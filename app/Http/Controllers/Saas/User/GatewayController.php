<?php

namespace App\Http\Controllers\Saas\User;

use App\Http\Controllers\Controller;
use App\Http\Requests\Admin\GatewayRequest;
use App\Http\Services\GatewayService;
use App\Traits\ResponseTrait;
use Illuminate\Http\Request;

class GatewayController extends Controller
{
    use ResponseTrait;

    public $gatewayService;

    public function __construct()
    {
        $this->gatewayService = new GatewayService;
    }

    public function index(Request $request)
    {
        $data['pageTitle'] = __('Gateway');
        $data['title'] = __('Gateway');
        $data['activeGatewaySetting'] = 'active';
        $data['gateways'] = $this->gatewayService->getAll();
        return view('saas.user.gateway', $data);
    }

    public function store(GatewayRequest $request)
    {
        return $this->gatewayService->store($request);
    }

    public function getInfo(Request $request)
    {
        return $this->gatewayService->getCurrenciesByGatewayId($request->id);
    }

    public function getCurrencyByGateway(Request $request)
    {
        $data = $this->gatewayService->getCurrencyByGatewayId($request->id);
        return $this->success($data);
    }
}
