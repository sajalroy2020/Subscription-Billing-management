<?php

namespace App\Providers;

use App\Models\Language;
use App\Models\Setting;
use Illuminate\Pagination\Paginator;
use Illuminate\Support\Facades\App;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\ServiceProvider;
use Illuminate\Support\Facades\Blade;
use Illuminate\Support\Facades\View;
use Carbon\Carbon;
use Illuminate\Database\Schema\Builder;

class AppServiceProvider extends ServiceProvider
{
    /**
     * Register any application services.
     *
     * @return void
     */
    public function register()
    {
        //
    }

    /**
     * Bootstrap any application services.
     *
     * @return void
     */
    public function boot()
    {
        try {
            Builder::defaultStringLength(191);
            $connection = DB::connection()->getPdo();
            if ($connection) {
                $allOptions = [];
                $allOptions['settings'] = Setting::all()->pluck('option_value', 'option_key')->toArray();
                config($allOptions);
            }
            $language = Language::where('iso_code', session()->get('local'))->first();

            if (!$language) {
                $language = Language::find(1);
                if ($language) {
                    $ln = $language->iso_code;
                    session(['local' => $ln]);
                    App::setLocale(session()->get('local'));
                }
            } else {
                $language = Language::where('default', ACTIVE)->first();
                if ($language) {
                    $ln = $language->iso_code;
                    session(['local' => $ln]);
                    App::setLocale(session()->get('local'));
                }
            }

            config(['app.defaultLanguage' => getDefaultLanguage()]);
            config(['app.currencySymbol' => getCurrencySymbol()]);
            config(['app.isoCode' => getIsoCode()]);
            config(['app.currencyPlacement' => getCurrencyPlacement()]);
            config(['app.debug' => getOption('app_debug', true)]);
            config(['app.timezone' => getOption('app_timezone')]);
            config(['app.timezone' => 'Asia/Dhaka']);
            date_default_timezone_set(getOption('app_timezone'));

            config(['services.google.client_id' => getOption('google_client_id')]);
            config(['services.google.client_secret' => getOption('google_client_secret')]);
            config(['services.google.redirect' => url('auth/google/callback')]);

            config(['services.facebook.client_id' => getOption('facebook_client_id')]);
            config(['services.facebook.client_secret' => getOption('facebook_client_secret')]);
            config(['services.facebook.redirect' => url('auth/facebook/callback')]);
            if (!empty(getOption('google_recaptcha_status')) && getOption('google_recaptcha_status') == 1) {
                config(['recaptchav3.sitekey' => getOption('google_recaptcha_site_key')]);
                config(['recaptchav3.secret' => getOption('google_recaptcha_secret_key')]);
            }

            View::share('totalMessage', 1);
        } catch (\Exception $e) {
            Log::info('Service Provider - ' . $e->getMessage());
        }
    }
}
