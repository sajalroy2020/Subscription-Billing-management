<?php

namespace App\Http\Controllers\Saas\Admin;

use Exception;
use Illuminate\Http\Request;
use App\Traits\ResponseTrait;
use App\Models\FeaturesSetting;
use App\Http\Controllers\Controller;
use App\Http\Services\Saas\FeaturesSettingService;
use App\Http\Requests\Admin\FeaturesSettingRequest;

class FeaturesController extends Controller
{
    use ResponseTrait;
    protected $features;
    public function __construct()
    {
        $this->features = new FeaturesSettingService();
    }

    public function index(Request $request)
    {
        $data['pageTitle'] = __('Features Section');
        $data['showFrontendSectionList'] = 'show active';
        $data['activeFrontendList'] = 'active';
        $data['featuresActiveClass'] = 'active-color-one';
        if ($request->ajax()) {
            return $this->features->list();
        }
        return view('saas.admin.settings.features.index', $data);
    }

    public function store(FeaturesSettingRequest $request)
    {
        return $this->features->featuresStore($request);
    }

    public function delete($id)
    {
        return $this->features->featuresDelete($id);
    }

    public function edit($id)
    {
        $data['pageTitle'] = __('Features Section');

        // if($request->ajax()){
        //     $data['features'] = $this->features->featuresEdit($id);
        // }
        try {
            $data['features'] = FeaturesSetting::find($id);
            if (is_null($data['features'])) {
                return $this->error([], getMessage(SOMETHING_WENT_WRONG));
            }
        } catch (Exception $exception) {
            return $this->error([], getMessage(SOMETHING_WENT_WRONG));
        }
        return view('saas.admin.settings.features.edit-form', $data);;
    }
}
