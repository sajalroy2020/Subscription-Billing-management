<?php

namespace App\Http\Controllers\Saas;

use App\Http\Services\Saas\FrontendService;
use App\Models\FeaturesSetting;
use App\Models\BestFeaturesSetting;
use App\Models\Faq;
use App\Models\Package;
use App\Models\Testimonial;
use Illuminate\Routing\Controller as BaseController;

class FrontendController extends BaseController
{
    public function index()
    {
        $data['pageTitle'] = __('Welcome');
        $frontendSection = new FrontendService();
        $frontendSection = $frontendSection ->getHomeFrontendSection();
        $data['section'] = [
            'hero_banner' => $frontendSection->where('slug', 'hero_banner')->first(),
            'core_features' => $frontendSection->where('slug', 'core_features')->first(),
            'best_features' => $frontendSection->where('slug', 'best_features')->first(),
            'pricing_plan' => $frontendSection->where('slug', 'pricing_plan')->first(),
            'product_services' => $frontendSection->where('slug', 'product_services')->first(),
            'integrations_menu' => $frontendSection->where('slug', 'integrations_menu')->first(),
            'testimonials_area' => $frontendSection->where('slug', 'testimonials_area')->first(),
            'faqs_area' => $frontendSection->where('slug', 'faqs_area')->first(),
        ];
        $data['feature'] = FeaturesSetting::where('status',STATUS_ACTIVE)->get();
        $data['all_faq'] = Faq::where('status', ACTIVE)->get();
        $data['all_testimonial'] = Testimonial::where('status', ACTIVE)->get();
        $data['best_features'] = BestFeaturesSetting::where('status', ACTIVE)->get();
        $data['packages'] = Package::where('status', ACTIVE)->get();

        return view('saas.frontend.index', $data);
    }
}
