<?php

namespace App\Http\Controllers\Saas\Admin;

use App\Http\Controllers\Controller;
use App\Http\Services\Saas\FrontendService;
use App\Models\FrontendSection;
use Illuminate\Http\Request;

class FrontendController extends Controller
{
    protected $frontendService;

    public function __construct()
    {
        $this->frontendService = new FrontendService();
    }

    public function sectionSettingIndex(Request $request)
    {
        if ($request->ajax()) {
            return $this->frontendService->frontendSettingList();
        }

        $data['pageTitle'] = __('Frontend Section');
        $data['showFrontendSectionList'] = 'show active';
        $data['activeFrontendList'] = 'active';
        $data['subSectionSettingsActiveClass'] = 'active-color-one';
        return view('saas.admin.settings.section-settings.index', $data);
    }

    public function frontendSectionInfo(Request $request)
    {
        $data['section'] = FrontendSection::findOrFail($request->id);
        return view('saas.admin.settings.section-settings.edit-form', $data);
    }

    public function frontendSectionUpdate(Request $request)
    {
        return $this->frontendService->frontendSettingUpdate($request);
    }

    public function frontendSectionIndex()
    {
        $data['pageTitle'] = __('Frontend Setting');
        $data['showFrontendSectionList'] = 'show active';
        $data['activeFrontendList'] = 'active';
        $data['sectionSettingsActiveClass'] = 'active-color-one';
        return view('saas.admin.settings.frontend-settings', $data);
    }
}
