<?php

namespace App\Http\Services\Saas;

use App\Models\Package;
use App\Models\SubscriptionOrder;
use App\Models\UserPackage;
use App\Traits\ResponseTrait;
use Exception;
use Illuminate\Support\Facades\DB;

class UserSubscriptionOrderService
{
    use ResponseTrait;

    public function getByStatus($request)
    {
        $status = 0;
        if ($request->status == 'Paid') {
            $status = PAYMENT_STATUS_PAID;
        } else if ($request->status == 'Pending') {
            $status = PAYMENT_STATUS_PENDING;
        } else if ($request->status == 'Bank') {
            $status = PAYMENT_STATUS_PENDING;
        } else if ($request->status == 'Cancelled') {
            $status = PAYMENT_STATUS_CANCELLED;
        }

        $orders = SubscriptionOrder::query()
            ->leftJoin('packages', 'subscription_orders.package_id', '=', 'packages.id')
            ->leftJoin('gateways', 'subscription_orders.gateway_id', '=', 'gateways.id')
            ->leftJoin('users', 'subscription_orders.user_id', '=', 'users.id')
            ->leftJoin('file_managers', ['subscription_orders.bank_deposit_slip_id' => 'file_managers.id'])
            ->orderByDesc('subscription_orders.id')
            ->select([
                'subscription_orders.*',
                'packages.name as packageName',
                'gateways.title as gatewayTitle',
                'gateways.slug as gatewaySlug',
                'file_managers.id as file_id',
                'users.name as userName',
                'users.email'
            ]);
        if ($request->status == 'Bank') {
            $orders->whereNotNull('subscription_orders.bank_deposit_slip_id');
        }
        if ($request->status == 'All') {
            $orders = $orders;
        } else {
            $orders = $orders->where('subscription_orders.payment_status', $status);
        }

        return datatables($orders)
            ->addIndexColumn()
            ->addColumn('package', function ($order) {
                return '<h6>' . $order->packageName . '</h6>';
            })
            ->addColumn('userName', function ($order) {
                return $order->userName;
            })
            ->addColumn('date', function ($order) {
                return $order->created_at->format('Y-m-d h:i');
            })
            ->addColumn('amount', function ($order) {
                return showPrice($order->total);
            })
            ->addColumn('gateway', function ($order) {
                if ($order->gatewaySlug == 'bank') {
                    return  '<a href="' . getFileUrl($order->folder_name, $order->file_name) . '" title="' . __('Bank slip download') . '" download>' . $order->gatewayTitle . '</a>';
                }
                return $order->gatewayTitle;
            })
            ->addColumn('status', function ($order) {
                if ($order->payment_status == PAYMENT_STATUS_PAID) {
                    return '<div class="status-btn status-btn-blue font-13 radius-4">Paid</div>';
                } elseif ($order->payment_status == PAYMENT_STATUS_PENDING) {
                    return '<div class="status-btn status-btn-red font-13 radius-4">Pending</div>';
                } else {
                    return '<div class="status-btn status-btn-orange font-13 radius-4">Cancelled</div>';
                }
            })
            ->addColumn('action', function ($data) {
                $html = '<div class="d-flex justify-content-end align-items-center g-10">';
                $html = "<button class='border-0 p-0 bg-transparent flex-shrink-0 me-2'><img src='" . asset('user/images/icon/eye.svg') . "'></button>";
                if ($data->payment_status == PAYMENT_STATUS_PENDING) {
                    $html .= "<button type='button' class='border-0 p-0 bg-transparent flex-shrink-0 me-2 orderPayStatus' title='Status' data-id='$data->id'><img src='" . asset('user/images/icon/edit.svg') . "'></button>";
                }
                if ($data->gatewaySlug == PAYMENT_STATUS_BANK) {
                    $html .= '<a href="' . getFileUrl($data->file_id) . '"  class=" border-0 p-0 bg-transparent flex-shrink-0" title="Bank slip download" download><img src="' . asset("user/images/icon/download.svg") . '"></a>';
                }
                $html .= '</div>';
                return $html;
            })
            ->rawColumns(['package', 'userName', 'status', 'gateway', 'action'])
            ->make(true);
    }

    public function orderGetInfo($id)
    {
        try {
            return SubscriptionOrder::query()
                ->join('gateways', 'subscription_orders.gateway_id', '=', 'gateways.id')
                ->select(['subscription_orders.*', 'gateways.title as gatewayTitle'])
                ->where('subscription_orders.id', $id)
                ->first();
        } catch (Exception $e) {
            $message = getErrorMessage($e, $e->getMessage());
            return $this->error([],  $message);
        }
    }

    public function orderPaymentStatusChange($request)
    {
        DB::beginTransaction();
        try {
            $subscriptionOrder = SubscriptionOrder::findOrFail($request->id);
            if ($request->status == PAYMENT_STATUS_PAID) {
                $subscriptionOrder->payment_status = PAYMENT_STATUS_PAID;
                $subscriptionOrder->transaction_id = str_replace("-", "", uuid_create(UUID_TYPE_RANDOM));
                $duration = 0;
                if ($subscriptionOrder->duration_type == DURATION_MONTH) {
                    $duration = 30;
                } elseif ($subscriptionOrder->duration_type == DURATION_YEAR) {
                    $duration = 365;
                }
                $package = Package::findOrFail($subscriptionOrder->package_id);
                setUserPackage($subscriptionOrder->user_id, $package, $duration, $subscriptionOrder->id);
                setCommonNotification('Have a new checkout', 'Order Id: ' . $subscriptionOrder->order_id, '', $subscriptionOrder->user_id);
            } elseif ($request->status == PAYMENT_STATUS_CANCELLED) {
                $subscriptionOrder->payment_status = PAYMENT_STATUS_CANCELLED;
            } else {
                $subscriptionOrder->payment_status = PAYMENT_STATUS_PENDING;
            }
            $subscriptionOrder->save();
            DB::commit();
            $message = __(UPDATED_SUCCESSFULLY);
            return $this->success([], $message);
        } catch (Exception $e) {
            DB::rollBack();
            $message = getErrorMessage($e, $e->getMessage());
            return $this->error([],  $message);
        }
    }

    public function getAllUserPackageByUser($userId = null)
    {
        $userId = !is_null($userId) ? $userId : auth()->id();
        $orders = UserPackage::query()
            ->join('packages', 'user_packages.package_id', '=', 'packages.id')
            ->join('orders', 'subscription_orders.id', '=', 'user_packages.order_id')
            ->where('user_packages.user_id', $userId)
            ->select(['user_packages.*', 'packages.name as packageName', 'subscription_orders.total'])
            ->get();
        return $this->success($orders);
    }

    public function getPendingOrderByUser($userId = null)
    {
        $userId = !is_null($userId) ? $userId : auth()->id();
        return SubscriptionOrder::query()
            ->leftJoin('packages', 'subscription_orders.package_id', '=', 'packages.id')
            ->leftJoin('gateways', 'subscription_orders.gateway_id', '=', 'gateways.id')
            ->leftJoin('users', 'subscription_orders.user_id', '=', 'users.id')
            ->leftJoin('file_managers', ['subscription_orders.bank_deposit_slip_id' => 'file_managers.id', 'file_managers.origin_type' => (DB::raw("'App\\\Models\\\Order'"))])
            ->select(['subscription_orders.*', 'packages.name as packageName', 'gateways.title as gatewayTitle', 'gateways.slug as gatewaySlug', 'file_managers.file_name', 'file_managers.folder_name'])
            ->where('subscription_orders.user_id', $userId)
            ->get();
    }
}
