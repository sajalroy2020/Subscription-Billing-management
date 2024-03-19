<?php

namespace App\Http\Controllers\Saas;

use App\Http\Controllers\Controller;
use App\Http\Requests\CheckoutRequest;
use App\Http\Services\Payment\Payment;
use App\Http\Services\Saas\SubscriptionService;
use App\Models\Bank;
use App\Models\Currency;
use App\Models\FileManager;
use App\Models\Gateway;
use App\Models\GatewayCurrency;
use App\Models\Package;
use App\Models\SubscriptionOrder;
use App\Models\User;
use Exception;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class PaymentSubscriptionController extends Controller
{
    public function checkout(CheckoutRequest $request)
    {
        DB::beginTransaction();
        try {
            // current package check
            $subscriptionService = new SubscriptionService;
            $userPackage = $subscriptionService->getCurrentPackage();
            if (isset($userPackage)) {
                if ($userPackage->package_id == $request->package_id && $userPackage->duration_type == $request->duration_type) {
                    throw new Exception(__('Package Already Exist'));
                }
            }

            $adminUser = User::where('role', USER_ROLE_ADMIN)->first();
            $durationType = $request->duration_type == DURATION_MONTH ? DURATION_MONTH : DURATION_YEAR;
            $package = Package::findOrFail($request->package_id);
            $gateway = Gateway::where(['user_id' => $adminUser->id, 'slug' => $request->gateway, 'status' => ACTIVE])->firstOrFail();
            $gatewayCurrency = GatewayCurrency::where(['user_id' => $adminUser->id, 'gateway_id' => $gateway->id, 'currency' => $request->currency])->firstOrFail();
            if ($gateway->slug == 'bank') {
                $bank = Bank::where(['user_id' => $adminUser->id, 'gateway_id' => $gateway->id, 'id' => $request->bank_id])->first();
                if (is_null($bank)) {
                    throw new Exception(__('Bank not found'));
                }
                $bank_id = $bank->id;
                $bank_deposit_by = $request->deposit_by;
                $bank_deposit_slip_id = null;
                if ($request->hasFile('bank_slip')) {
                    /*File Manager Call upload for Thumbnail Image*/
                    $newFile = new FileManager();
                    $upload = $newFile->upload('Order', $request->bank_slip);

                    if ($upload['status']) {
                        $bank_deposit_slip_id = $upload['file']->id;
                        $upload['file']->origin_type = "App\Models\Order";
                        $upload['file']->save();
                    } else {
                        throw new Exception($upload['message']);
                    }
                    /*End*/
                } else {
                    throw new Exception(__('The Bank slip is required'));
                }
                $order = $this->placeOrder($package, $durationType, $gateway, $gatewayCurrency, $bank_id, $bank_deposit_by, $bank_deposit_slip_id);
                $order->bank_deposit_slip_id = $bank_deposit_slip_id;
                $order->save();
                DB::commit();
                return redirect()->route('user.subscription.index')->with('success', __('Bank Details Sent Successfully! Wait for approval'));
            } elseif ($gateway->slug == 'cash') {
                $order = $this->placeOrder($package, $durationType, $gateway, $gatewayCurrency);
                $order->save();
                DB::commit();
                return redirect()->route('user.subscription.index')->with('success', __('Cash Payment Request Sent Successfully! Wait for approval'));
            } else {
                $order = $this->placeOrder($package, $durationType, $gateway, $gatewayCurrency);
                DB::commit();
            }
            $object = [
                'id' => $order->id,
                'callback_url' => route('payment.subscription.verify'),
                'currency' => $gatewayCurrency->currency,
                'type' => 'subscription'
            ];
            $payment = new Payment($gateway->slug, $object);
            $responseData = $payment->makePayment($order->total);
            if ($responseData['success']) {
                $order->payment_id = $responseData['payment_id'];
                $order->save();
                return redirect($responseData['redirect_url']);
            } else {
                return redirect()->back()->with('error', $responseData['message']);
            }
        } catch (\Exception $e) {
            DB::rollBack();
            return redirect()->route('user.subscription.index')->with('error', $e->getMessage());
        }
    }

    public function placeOrder($package, $durationType, $gateway, $gatewayCurrency, $bank_id = null, $bank_deposit_by = null, $bank_deposit_slip_id = null)
    {
        $price = 0;
        $discount = 0;
        if ($durationType == DURATION_MONTH) {
            $price = $package->monthly_price;
        } else {
            $price = $package->yearly_price;
        }

        return SubscriptionOrder::create([
            'user_id' => auth()->id(),
            'package_id' => $package->id,
            'order_id' => uniqid(),
            'payment_status' => PAYMENT_STATUS_PENDING,
            'transaction_id' => str_replace("-", "", uuid_create(UUID_TYPE_RANDOM)),
            'system_currency' => Currency::where('current_currency', 'on')->first()->currency_code,
            'gateway_id' => $gateway->id,
            'gateway_currency' => $gatewayCurrency->currency,
            'duration_type' => $durationType,
            'conversion_rate' => $gatewayCurrency->conversion_rate,
            'amount' => $price,
            'tax_amount' => 0,
            'tax_type' => 0,
            'discount' => $discount,
            'subtotal' => $price,
            'total' => $price,
            'transaction_amount' => $price * $gatewayCurrency->conversion_rate,
            'bank_id' => $bank_id,
            'bank_deposit_by' => $bank_deposit_by,
            'bank_deposit_slip_id' => $bank_deposit_slip_id,
        ]);
    }

    public function verify(Request $request)
    {
        $order_id = $request->get('id', '');
        $payerId = $request->get('PayerID', NULL);
        $payment_id = $request->get('payment_id', NULL);

        $order = SubscriptionOrder::findOrFail($order_id);
        if ($order->status == PAYMENT_STATUS_PAID) {
            return redirect()->route('user.subscription.index')->with('error', __('Your order has been paid!'));
        }

        $gateway = Gateway::find($order->gateway_id);
        DB::beginTransaction();
        try {
            if ($order->gateway_id == $gateway->id && $gateway->slug == MERCADOPAGO) {
                $order->payment_id = $payment_id;
                $order->save();
            }

            $payment_id = $order->payment_id;
            $gatewayBasePayment = new Payment($gateway->slug, ['currency' => $order->gateway_currency, 'type' => 'subscription']);
            $payment_data = $gatewayBasePayment->paymentConfirmation($payment_id, $payerId);

            if ($payment_data['success']) {
                if ($payment_data['data']['payment_status'] == 'success') {
                    $order->payment_status = PAYMENT_STATUS_PAID;
                    $order->transaction_id = str_replace('-', '', uuid_create());
                    $order->save();
                    $package = Package::find($order->package_id);
                    $duration = 0;
                    if ($order->duration_type == DURATION_MONTH) {
                        $duration = 30;
                    } elseif ($order->duration_type == DURATION_YEAR) {
                        $duration = 365;
                    }

                    setUserPackage(auth()->id(), $package, $duration, $order->id);

                    DB::commit();
                    return redirect()->route('user.subscription.index')->with('success', __('Payment Successful!'));
                }
            } else {
                return redirect()->route('user.subscription.index')->with('error', __('Payment Failed!'));
            }
        } catch (\Exception $e) {
            DB::rollBack();
            return redirect()->route('user.subscription.index')->with('error', __('Payment Failed!'));
        }
    }
}
