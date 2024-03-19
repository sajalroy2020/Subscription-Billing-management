<?php

namespace App\Http\Controllers\Saas\User;

use App\Http\Controllers\Controller;
use App\Http\Services\GatewayService;
use App\Http\Services\Saas\SubscriptionService;
use App\Models\Bank;
use App\Models\User;
use App\Traits\ResponseTrait;
use Carbon\Carbon;
use Exception;
use Illuminate\Http\Request;

class SubscriptionController extends Controller
{
    use ResponseTrait;
    public $subscriptionService;

    public function __construct()
    {
        $this->subscriptionService = new SubscriptionService;
    }

    public function index(Request $request)
    {
        $data['activeSubscription'] = 'active';
        $data['pageTitle'] = '';
        $data['title'] = __('My Package');
        $data['userPackage'] = $this->subscriptionService->getCurrentPackage();
        $data['packageHistories'] = $this->subscriptionService->getAllUserPackageByUserId(auth()->id(), 10);
        $data['orderHistories'] = $this->subscriptionService->getAllOrderByUserId(auth()->id(), 10);
        if (!is_null($request->id)) {
            $request->merge(['duration_type' => 1]);
            $data['gateways'] = $this->getGateway($request);
        }
        return view('saas.user.subscriptions.details', $data);
    }

    public function getPackage()
    {
        $data['packages'] = $this->subscriptionService->getAllPackages();
        $data['currentPackage'] = $this->subscriptionService->getCurrentPackage();
        return view('saas.user.subscriptions.partials.package-list', $data)->render();
    }

    public function getGateway(Request $request)
    {
        try {
            $user = User::where('role', USER_ROLE_ADMIN)->first();
            if (is_null($user)) {
                throw new Exception(__(SOMETHING_WENT_WRONG));
            }

            $gatewayService = new GatewayService;
            $data['gateways'] = $gatewayService->getActiveAll($user->id);
            $data['package'] = $this->subscriptionService->getById($request->id);
            $data['durationType'] = $request->duration_type;
            $data['banks'] = Bank::where('status', ACTIVE)->get();
            $data['startDate'] = now();
            if ($request->duration_type == DURATION_MONTH) {
                $data['endDate'] = Carbon::now()->addMonth();
            } else {
                $data['endDate'] = Carbon::now()->addYear();
            }
            return view('saas.user.subscriptions.partials.gateway-list', $data)->render();
        } catch (Exception $e) {
            return $this->error([],  $e->getMessage());
        }
    }

    public function getCurrencyByGateway(Request $request)
    {
        $data =  $this->subscriptionService->getCurrencyByGatewayId($request->id);
        return $this->success($data);
    }

    public function cancel()
    {
        $this->subscriptionService->cancel();
        return back()->with('success', __('Canceled Successful!'));
    }
}
