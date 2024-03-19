<?php

use App\Http\Controllers\Saas\Admin\FeaturesController;
use App\Http\Controllers\Saas\Admin\BestFeaturesController;
use App\Http\Controllers\Saas\Admin\FaqController;
use App\Http\Controllers\Saas\Admin\FrontendController;
use App\Http\Controllers\Saas\Admin\PackageController;
use App\Http\Controllers\Saas\Admin\SubscriptionController;
use App\Http\Controllers\Saas\User\SubscriptionController as UserSubscriptionController;
use App\Http\Controllers\Saas\Admin\TestimonialController;
use App\Http\Controllers\Saas\AuthController;
use App\Http\Controllers\Saas\PaymentSubscriptionController;
use App\Http\Controllers\Saas\User\GatewayController;
use Illuminate\Support\Facades\Route;

Route::group(['middleware' => ['version.update']], function () {

    Route::group(['prefix' => 'admin', 'as' => 'admin.', 'middleware' => ['web', 'auth', 'admin']], function () {

        Route::group(['prefix' => 'packages', 'as' => 'packages.'], function () {
            Route::get('/', [PackageController::class, 'index'])->name('index');
            Route::get('get-info', [PackageController::class, 'getInfo'])->name('get.info');
            Route::post('store', [PackageController::class, 'store'])->name('store');
            Route::post('destroy/{id}', [PackageController::class, 'destroy'])->name('destroy');
            Route::get('user', [PackageController::class, 'userPackage'])->name('user');
            Route::post('assign', [PackageController::class, 'assignPackage'])->name('assign');
        });

        Route::group(['prefix' => 'subscriptions', 'as' => 'subscriptions.'], function () {
            Route::get('orders', [SubscriptionController::class, 'orders'])->name('orders');
            Route::get('orders/get-info', [SubscriptionController::class, 'orderGetInfo'])->name('orders.get.info'); // ajax
            Route::post('orders/payment-status-change', [SubscriptionController::class, 'orderPaymentStatusChange'])->name('order.payment.status.change');
            Route::get('orders-payment-status', [SubscriptionController::class, 'ordersStatus'])->name('orders.payment.status'); // ajax
        });

        Route::group(['prefix' => 'frontend-setting', 'as' => 'frontend-setting.'], function () {

            Route::get('/', [FrontendController::class, 'frontendSectionIndex'])->name('index');
            Route::get('section-setting', [FrontendController::class, 'sectionSettingIndex'])->name('section.index');
            Route::get('section-info/{id}', [FrontendController::class, 'frontendSectionInfo'])->name('section.info');
            Route::post('section-update', [FrontendController::class, 'frontendSectionUpdate'])->name('section.update');

            // features start
            Route::group(['prefix' => 'features', 'as' => 'features.'], function () {
                Route::get('/', [FeaturesController::class, 'index'])->name('index');
                Route::post('store', [FeaturesController::class, 'store'])->name('store');
                Route::post('delete/{id}', [FeaturesController::class, 'delete'])->name('delete');
                Route::get('edit/{id}', [FeaturesController::class, 'edit'])->name('edit');
            });
            // features end

            // best features
            Route::group(['prefix' => 'best-features', 'as' => 'best-features.'], function () {
                Route::get('', [BestFeaturesController::class, 'index'])->name('index');
                Route::post('store', [BestFeaturesController::class, 'store'])->name('store');
                Route::post('delete/{id}', [BestFeaturesController::class, 'delete'])->name('delete');
                Route::get('edit/{id}', [BestFeaturesController::class, 'edit'])->name('edit');
            });

            //testimonial area
            Route::group(['prefix' => 'testimonial', 'as' => 'testimonial.'], function () {
                Route::get('testimonial', [TestimonialController::class, 'index'])->name('index');
                Route::post('store', [TestimonialController::class, 'store'])->name('store');
                Route::get('info/{id}', [TestimonialController::class, 'info'])->name('info');
                Route::post('update/{id}', [TestimonialController::class, 'update'])->name('update');
                Route::post('delete/{id}', [TestimonialController::class, 'delete'])->name('delete');
            });

            // faq
            Route::group(['prefix' => 'faq', 'as' => 'faq.'], function () {
                Route::get('faq', [FaqController::class, 'index'])->name('index');
                Route::post('faq-store', [FaqController::class, 'store'])->name('store');
                Route::post('faq-delete/{id}', [FaqController::class, 'delete'])->name('delete');
                Route::get('faq-edit/{id}', [FaqController::class, 'edit'])->name('edit');
            });
        });
    });

    // user profile
    Route::group(['prefix' => 'user', 'as' => 'user.', 'middleware' => ['auth', 'user']], function () {

        Route::group(['prefix' => 'subscription', 'as' => 'subscription.'], function () {
            Route::get('/', [UserSubscriptionController::class, 'index'])->name('index');
            Route::get('get-package', [UserSubscriptionController::class, 'getPackage'])->name('get.package');
            Route::post('get-gateway', [UserSubscriptionController::class, 'getGateway'])->name('get.gateway');
            Route::get('get-currency-by-gateway', [UserSubscriptionController::class, 'getCurrencyByGateway'])->name('get.currency');
            Route::post('cancel', [UserSubscriptionController::class, 'cancel'])->name('cancel');
        });

        Route::group(['prefix' => 'gateway', 'as' => 'gateway.'], function () {
            Route::get('/', [GatewayController::class, 'index'])->name('index');
            Route::post('store', [GatewayController::class, 'store'])->name('store')->middleware('isDemo');
            Route::get('get-info', [GatewayController::class, 'getInfo'])->name('get.info');
            Route::get('get-currency-by-gateway', [GatewayController::class, 'getCurrencyByGateway'])->name('get.currency');
        });
    });

    Route::group(['middleware' => ['isFrontend']], function () {
        Route::get('user-register', [AuthController::class, 'user_register_form'])->name('user.register.form');
        Route::post('user-register', [AuthController::class, 'user_register_store'])->name('user.register.store');
    });

    Route::group(['prefix' => 'payment'], function () {
        Route::post('/subscription/checkout', [PaymentSubscriptionController::class, 'checkout'])->name('payment.subscription.checkout');
        Route::match(array('GET', 'POST'), 'subscription/verify', [PaymentSubscriptionController::class, 'verify'])->name('payment.subscription.verify');
    });
});
