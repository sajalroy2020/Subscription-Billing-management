<?php

namespace App\Http\Controllers\Saas\Admin;

use App\Http\Controllers\Controller;
use App\Http\Services\Saas\UserSubscriptionOrderService;
use App\Traits\ResponseTrait;
use Illuminate\Http\Request;

class SubscriptionController extends Controller
{
    use ResponseTrait;
    public $subscriptionOrderService;

    public function __construct()
    {
        $this->subscriptionOrderService = new UserSubscriptionOrderService;
    }

    public function orders()
    {
        $data['title'] = __('All User Orders');
        $data['activeSubscriptionIndex'] = 'active';
        return view('saas.admin.subscriptions.orders', $data);
    }

    public function ordersStatus(Request $request)
    {
        if ($request->ajax()) {
            return $this->subscriptionOrderService->getByStatus($request);
        }
    }

    public function orderGetInfo(Request $request)
    {
        $data = $this->subscriptionOrderService->orderGetInfo($request->id);
        return $this->success($data);
    }

    public function orderPaymentStatusChange(Request $request)
    {
        return $this->subscriptionOrderService->orderPaymentStatusChange($request);
    }
}
