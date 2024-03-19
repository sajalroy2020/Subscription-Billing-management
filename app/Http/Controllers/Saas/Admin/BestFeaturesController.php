<?php

namespace App\Http\Controllers\Saas\Admin;

use Exception;
use Illuminate\Http\Request;
use App\Traits\ResponseTrait;
use App\Http\Controllers\Controller;
use App\Http\Requests\Admin\BestFeaturesSettingRequest;
use App\Http\Requests\Admin\FeaturesSettingRequest;
use App\Http\Services\Saas\BestFeaturesSettingService;
use App\Models\BestFeaturesSetting;

class BestFeaturesController extends Controller
{
    use ResponseTrait;
    protected $bestFeatures;
    public function __construct()
    {
        $this->bestFeatures = new BestFeaturesSettingService();
    }

    public function index(Request $request){
        $data['pageTitle'] = __('Best Features Section');
        $data['showFrontendSectionList'] = 'show active';
        $data['activeFrontendList'] = 'active';
        $data['bestFeaturesActiveClass'] = 'active-color-one';
        if($request->ajax()){
            return $this->bestFeatures->list();
        }
        return view('saas.admin.settings.best_features.index', $data);
    }

    public function store(BestFeaturesSettingRequest $request){
        return $this->bestFeatures->bestFeaturesStore($request);
    }

    public function delete($id){
        return $this->bestFeatures->featuresDelete($id);
    }

    public function edit($id)
    {
        $data['pageTitle'] = __('Best Features Section');
        try {
            $data['features'] = BestFeaturesSetting::find($id);
            if (is_null($data['features'])) {
                return $this->error([], getMessage(SOMETHING_WENT_WRONG));
            }
        } catch (Exception $exception) {
            return $this->error([], getMessage(SOMETHING_WENT_WRONG));
        }
        return view('saas.admin.settings.best_features.edit-form', $data);;
    }


}
