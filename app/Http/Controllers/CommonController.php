<?php

namespace App\Http\Controllers;

use App\Http\Controllers\Saas\FrontendController;

class CommonController extends Controller
{
    public function index()
    {
        if (isAddonInstalled('SUBSAAS') > 0) {
            $frontendController = new FrontendController;
            return $frontendController->index();
        }
        return redirect()->route('login');
    }
}
