<?php

namespace App\Http\Services\Saas;

use App\Models\Currency;
use App\Models\FileManager;
use App\Models\Gateway;
use App\Models\GatewayCurrency;
use App\Models\Package;
use App\Models\SubscriptionOrder;
use App\Models\User;
use App\Models\UserPackage;
use App\Traits\ResponseTrait;
use Exception;
use Illuminate\Support\Facades\DB;

class PackageService
{
    use ResponseTrait;
    public function getAllData($request)
    {
        $packages = Package::query();

        return datatables($packages)
            ->addIndexColumn()
            ->addColumn('name', function ($package) {
                return $package->name;
            })
            ->addColumn('icon', function ($data) {
                return '<div class="min-w-160 d-flex align-items-center cg-10">
                            <div class="flex-shrink-0 w-35 h-35 bd-one bd-c-cdef84 rounded-circle overflow-hidden bg-eaeaea d-flex justify-content-center align-items-center">
                                <img src="' . getFileUrl($data->icon_id) . '" alt="icon" class="rounded avatar-xs w-100">
                            </div>
                        </div>';
            })
            ->addColumn('monthly_price', function ($package) {
                return showPrice($package->monthly_price);
            })
            ->addColumn('yearly_price', function ($package) {
                return showPrice($package->yearly_price);
            })
            ->addColumn('status', function ($package) {
                if ($package->status == STATUS_ACTIVE) {
                    return '<div class="status-btn status-btn-green font-13 radius-4">' . __('Active') . '</div>';
                } else {
                    return '<div class="status-btn status-btn-orange font-13 radius-4">' . __('Deactivate') . '</div>';
                }
            })
            ->addColumn('trail', function ($package) {
                if ($package->is_trail == ACTIVE) {
                    return '<div class="status-btn status-btn-blue font-13 radius-4">' . __('Yes') . '</div>';
                } else {
                    return '<div class="status-btn status-btn-red font-13 radius-4">' . __('No') . '</div>';
                }
            })
            ->addColumn('action', function ($package) {
                return '<div class="text-center">
                    <button type="button" class="btn p-1 tbl-action-btn edit" data-id="' . $package->id . '" title="' . __('Edit') . '"><i class="fa-regular fa-pen-to-square"></i></button>
                    <button onclick="deleteItem(\'' . route('admin.packages.destroy', $package->id) . '\', \'packageDataTable\')" class="btn p-1 tbl-action-btn"   title="' . __('Delete') . '"><i class="fa-solid fa-trash"></i></button>
                </div>';
            })
            ->rawColumns(['name', 'icon', 'status', 'trail', 'action'])
            ->make(true);
    }

    public function getAll()
    {
        return Package::query()->get();
    }

    public function getActiveAll()
    {
        return Package::where('status', STATUS_ACTIVE)->where('is_trail', '!=', ACTIVE)->get();
    }

    public function store($request)
    {
        DB::beginTransaction();
        try {
            $id = $request->get('id', '');
            if ($id != '') {
                $package = Package::findOrFail($request->id);
            } else {
                $package = new Package();
            }

            // Slug exists
            $slug = getSlug($request->name);
            $slugExist = Package::where('slug', $slug)->whereNot('id', $request->id)->exists();
            if ($slugExist) {
                throw new Exception(__('Name Already Exist!'));
            }

            if ($request->hasFile('icon')) {
                $newFile = new FileManager();
                $uploaded = $newFile->upload('Package', $request->icon);

                if (!is_null($uploaded)) {
                    $package->icon_id = $uploaded->id;
                } else {
                    return $this->error([], getMessage(__(SOMETHING_WENT_WRONG)));
                }
            }

            $package->name = $request->name;
            $package->slug = $slug;
            $package->customer_limit = $request->customer_limit_type == 1 ? $request->customer_limit : -1;
            $package->product_limit = $request->product_limit_type == 1 ? $request->product_limit : -1;
            $package->subscription_limit = $request->subscription_limit_type == 1 ? $request->subscription_limit : -1;
            $package->others = json_encode($request->others);
            $package->status = $request->status ? ACTIVE : DEACTIVATE;
            $package->is_trail = $request->is_trail ? ACTIVE : DEACTIVATE;
            $package->is_default = $request->is_default ? ACTIVE : DEACTIVATE;
            $package->monthly_price = $request->monthly_price;
            $package->yearly_price = $request->yearly_price;
            $package->save();

            DB::commit();
            $message = $request->id ? __(UPDATED_SUCCESSFULLY) : __(CREATED_SUCCESSFULLY);
            return $this->success([], $message);
        } catch (Exception $e) {
            DB::rollBack();
            $message = getErrorMessage($e, $e->getMessage());
            return $this->error([], $message);
        }
    }

    public function getInfo($id)
    {
        return Package::findOrFail($id);
    }

    public function destroy($id)
    {
        DB::beginTransaction();
        try {
            if (Package::where('status', ACTIVE)->count() > 1) {
                Package::findOrFail($id)->delete();

                // update if trail changed
                if (is_null(Package::where(['is_trail' => ACTIVE, 'status' => STATUS_ACTIVE])->first())) {
                    Package::where(['status' => STATUS_ACTIVE])->first()->update(['is_trail' => ACTIVE]);
                }

                DB::commit();
                $message = __(DELETED_SUCCESSFULLY);
                return $this->success([], $message);
            } else {
                $message = __("Trial package can not be deleted");
                return $this->error([], $message);
            }
        } catch (Exception $e) {
            DB::rollBack();
            $message = getErrorMessage($e, $e->getMessage());
            return $this->error([], $message);
        }
    }

    public function getUserPackagesData()
    {
        $ownerPackages = UserPackage::query()
            ->join('users', 'user_packages.user_id', '=', 'users.id')
            ->join('packages', 'user_packages.package_id', '=', 'packages.id')
            ->join('subscription_orders', 'user_packages.order_id', '=', 'subscription_orders.id')
            ->join('gateways', 'subscription_orders.gateway_id', '=', 'gateways.id')
            ->select('user_packages.*', 'users.name as userName', 'users.email', 'packages.name as packageName', 'subscription_orders.payment_status', 'gateways.title as gatewaysName')
            ->orderBy('user_packages.id', 'desc');

        return datatables($ownerPackages)
            ->addIndexColumn()
            ->addColumn('user_name', function ($ownerPackage) {
                return $ownerPackage->userName;
            })
            ->addColumn('package_name', function ($ownerPackage) {
                return $ownerPackage->packageName;
            })
            ->addColumn('gateway', function ($ownerPackage) {
                return $ownerPackage->gatewaysName;
            })
            ->addColumn('payment_status', function ($ownerPackage) {
                if ($ownerPackage->payment_status == PAYMENT_STATUS_PAID) {
                    return '<div class="status-btn status-btn-green font-13 radius-4">' . __('Paid') . '</div>';
                } elseif ($ownerPackage->payment_status == PAYMENT_STATUS_PENDING) {
                    return '<div class="status-btn status-btn-red font-13 radius-4">' . __('Pending') . '</div>';
                } else {
                    return '<div class="status-btn status-btn-orange font-13 radius-4">' . __('Cancelled') . '</div>';
                }
            })
            ->addColumn('start_date', function ($ownerPackage) {
                return date('Y-m-d', strtotime($ownerPackage->start_date));
            })
            ->addColumn('end_date', function ($ownerPackage) {
                return date('Y-m-d', strtotime($ownerPackage->end_date));
            })
            ->addColumn('status', function ($ownerPackage) {
                if ($ownerPackage->status == ACTIVE) {
                    return '<div class="status-btn status-btn-blue font-13 radius-4">' . __('Active') . '</div>';
                } else {
                    return '<div class="status-btn status-btn-orange font-13 radius-4">' . __('Deactivate') . '</div>';
                }
            })
            ->addColumn('action', function ($ownerPackage) {
                return '<div class="tbl-action-btns d-inline-flex">
                            <button type="button" class="p-1 tbl-action-btn edit" data-id="' . $ownerPackage->id . '" title="' . __('Edit') . '">
                                <span class="iconify" data-icon="clarity:note-edit-solid"></span>
                            </button>
                        </div>';
            })
            ->rawColumns(['user_name', 'package_name', 'payment_status', 'start_date', 'end_date', 'status', 'action'])
            ->make(true);
    }

    public function assignPackage($request)
    {
        DB::beginTransaction();
        try {
            $package = Package::findOrFail($request->package_id);
            $user = User::where('role', USER_ROLE_USER)->findOrFail($request->user_id);
            $adminUser = User::where('role', USER_ROLE_ADMIN)->first();

            $gateway = Gateway::where(['user_id' => $adminUser->id, 'slug' => 'cash'])->firstOrFail();
            $currency = Currency::where('current_currency', ACTIVE)->first()->currency_code;
            if (is_null($currency)) {
                throw new Exception(__('Please Add Currency'));
            }
            $gatewayCurrency = GatewayCurrency::where(['user_id' => $adminUser->id, 'gateway_id' => $gateway->id, 'currency' => $currency])->firstOrFail();

            $price = 0;
            $duration = 0;
            $discount = 0;
            if (in_array($request->duration_type, [DURATION_MONTH, DURATION_YEAR])) {
                if ($request->duration_type == DURATION_MONTH) {
                    $price = $package->monthly_price;
                    $duration = 30;
                } else {
                    $price = $package->yearly_price;
                    $duration = 365;
                }
            } else {
                throw new Exception(__(SOMETHING_WENT_WRONG));
            }

            $order = SubscriptionOrder::create([
                'user_id' => $user->id,
                'package_id' => $package->id,
                'order_id' => uniqid(),
                'payment_status' => PAYMENT_STATUS_PAID,
                'transaction_id' => str_replace("-", "", uuid_create(UUID_TYPE_RANDOM)),
                'system_currency' => $currency,
                'gateway_id' => $gateway->id,
                'gateway_currency' => $gatewayCurrency->currency,
                'duration_type' => $request->duration_type,
                'conversion_rate' => $gatewayCurrency->conversion_rate,
                'amount' => $price,
                'tax_amount' => 0,
                'tax_type' => 0,
                'discount' => $discount,
                'subtotal' => $price,
                'total' => $price,
                'transaction_amount' => $price * $gatewayCurrency->conversion_rate
            ]);

            setUserPackage($order->user_id, $package, $duration, $order->id);
            DB::commit();
            return $this->success([], __(ASSIGNED_SUCCESSFULLY));
        } catch (Exception $e) {
            DB::rollBack();
            $message = getErrorMessage($e, $e->getMessage());
            return $this->error([], $message);
        }
    }
}
