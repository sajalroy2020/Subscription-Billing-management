<?php

use App\Http\Controllers\CommonController;
use App\Http\Controllers\User\InvoiceController;
use App\Models\Language;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Auth\LoginController;
use App\Http\Controllers\Auth\GoogleController;
use App\Http\Controllers\Auth\FacebookController;
use App\Http\Controllers\VersionUpdateController;
use App\Http\Controllers\User\GoogleAuthController;
use App\Http\Controllers\Auth\ForgotPasswordController;
use App\Http\Controllers\CheckoutController;
use App\Http\Controllers\PaymentController;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/local/{ln}', function ($ln) {
    $language = Language::where('iso_code', $ln)->first();
    if (!$language) {
        $language = Language::where('default', 1)->first();
        if ($language) {
            $ln = $language->iso_code;
        }
    }
    session()->put('local', $ln);
    return redirect()->back();
})->name('local');


Auth::routes(['verify' => false, 'register' => false]);

Route::group(['middleware' => ['isFrontend']], function () {
    Route::get('/', [CommonController::class, 'index'])->name('frontend');
});

Route::get('affiliate-register/{hash}', [LoginController::class, 'affiliate_register_form'])->name('affiliate.register.form');
Route::post('affiliate-register-store', [LoginController::class, 'affiliate_register_store'])->name('affiliate.register.store');

Route::get('password/reset/verify/{token}/{email}', [ForgotPasswordController::class, 'forgetVerifyForm'])->name('password.reset.verify_form');
Route::get('password/reset/verify/{token}', [ForgotPasswordController::class, 'forgetVerify'])->name('password.reset.verify');
Route::post('password/reset/verify-resend/{token}', [ForgotPasswordController::class, 'forgetVerifyResend'])->name('password.reset.verify_resend');
Route::post('password/reset/update/{token}', [ForgotPasswordController::class, 'updatePassword'])->name('password.update');

Route::group(['middleware' => ['auth']], function () {
    Route::get('logout', [LoginController::class, 'logout']);
    Route::get('google2fa/authenticate/verify', [GoogleAuthController::class, 'verifyView'])->name('google2fa.authenticate.verify');
    Route::post('google2fa/authenticate/verify/action', [GoogleAuthController::class, 'verify'])->name('google2fa.authenticate.verify.action');
    Route::post('google2fa/authenticate/enable', [GoogleAuthController::class, 'enable'])->name('google2fa.authenticate.enable');
    Route::post('google2fa/authenticate/disable', [GoogleAuthController::class, 'disable'])->name('google2fa.authenticate.disable');
});

Route::get('auth/google', [GoogleController::class, 'redirectToGoogle'])->name('google-login');
Route::get('auth/google/callback', [GoogleController::class, 'handleGoogleCallback']);

// Route::get('auth/facebook', [FacebookController::class, 'redirectToFacebook'])->name('auth.facebook');
Route::get('auth/facebook', [FacebookController::class, 'redirectToFacebook'])->name('facebook-login');
Route::get('auth/facebook/callback', [FacebookController::class, 'handleFacebookCallback']);

Route::get('version-update', [VersionUpdateController::class, 'versionUpdate'])->name('version-update')->withoutMiddleware(['version.update']);
Route::post('process-update', [VersionUpdateController::class, 'processUpdate'])->name('process-update')->withoutMiddleware(['version.update']);

Route::get('invoice-maker', [InvoiceController::class, 'recurringInvoiceMaker'])->name('invoice-maker');

// checkout
Route::get('checkout/{hash}', [CheckoutController::class, 'checkout'])->name('checkout');
Route::post('checkout/order', [CheckoutController::class, 'checkoutOrder'])->name('checkout.order');
Route::get('get-currency-by-gateway', [CheckoutController::class, 'getCurrencyByGateway'])->name('gateway.currency');
Route::get('get-coupon-info', [CheckoutController::class, 'getCouponInfo'])->name('get.coupon.info');

// verify gateway
Route::match(array('GET', 'POST'), 'subscription/verify', [PaymentController::class, 'verify'])->name('subscription.verify');
Route::get('thankyou', [PaymentController::class, 'thankyou'])->name('thankyou');
Route::get('waiting', [PaymentController::class, 'waiting'])->name('waiting');
Route::get('failed', [PaymentController::class, 'failed'])->name('failed');

Route::get('invoice/{id}', [InvoiceController::class, 'invoiceDownload'])->name('invoice');
