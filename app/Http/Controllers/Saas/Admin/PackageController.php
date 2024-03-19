<?php

namespace App\Http\Controllers\Saas\Admin;

use App\Http\Controllers\Controller;
use App\Http\Requests\PackageRequest;
use App\Models\User;
use App\Http\Services\Saas\PackageService;
use App\Traits\ResponseTrait;
use Illuminate\Http\Request;

class PackageController extends Controller
{
    use ResponseTrait;
    public $packageService;

    public function __construct()
    {
        $this->packageService = new PackageService;
    }

    public function index(Request $request)
    {
        if ($request->ajax()) {
            return $this->packageService->getAllData($request);
        } else {
            $data['title'] = __('All Packages');
            $data['activePackageIndex'] = 'active';
            return view('saas.admin.packages.index', $data);
        }
    }

    public function store(PackageRequest $request)
    {
        return $this->packageService->store($request);
    }

    public function getInfo(Request $request)
    {
        $data = $this->packageService->getInfo($request->id);
        $data->icon = getFileUrl($data->icon_id);
        return $this->success($data);
    }

    public function destroy($id)
    {
        return $this->packageService->destroy($id);
    }

    public function userPackage(Request $request)
    {
        if ($request->ajax()) {
            return $this->packageService->getUserPackagesData($request);
        } else {
            $data['title'] = __('User Packages');
            $data['activePackageUser'] = 'active';
            $data['users'] = User::where('role', USER_ROLE_USER)->get();
            $data['packages'] = $this->packageService->getAll();
            return view('saas.admin.packages.user', $data);
        }
    }

    public function assignPackage(Request $request)
    {
        return $this->packageService->assignPackage($request);
    }
}
