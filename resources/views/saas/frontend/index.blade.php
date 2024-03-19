@extends('saas.frontend.layouts.app')
@section('content')
    <!-- Start Core features -->
    @if (isset($section['core_features']) && $section['core_features']->status == STATUS_ACTIVE)
        <section class="py-150 ld-container-1320" id="features">
            <div class="container">
                <div class="row justify-content-center">
                    <div class="col-lg-6">
                        <div class="text-center pb-45">
                            <p
                                class="d-inline-flex py-6 px-20 bd-ra-12 bg-main-color-20 mb-13 fs-17 fw-500 lh-28 text-main-color">
                                {{ $section['core_features']->page_title }}</p>
                            <h4 class="fs-sm-64 fs-33 fw-700 lh-sm-76 lh-44 text-textBlack">
                                {{ $section['core_features']->title }}</h4>
                        </div>
                    </div>
                </div>
                <div class="landing-features-one">
                    @foreach ($feature as $fetures)
                        <div class="item row align-items-center">
                            <div class="col-lg-5">
                                <div class="max-w-483">
                                    <div class="d-flex max-w-80 pb-27"><img src="{{ asset(getFileUrl($fetures->icon)) }}"
                                            alt="" /></div>
                                    <h4 class="fs-sm-52 fw-700 lh-sm-64 text-textBlack pb-9">{{ $fetures->title }}</h4>
                                    <p class="fs-18 fw-400 lh-28 text-para-text">{{ $fetures->description }}</p>
                                </div>
                            </div>
                            <div class="col-lg-7">
                                <div class="max-w-680 ms-auto"><img src="{{ asset(getFileUrl($fetures->image)) }}"
                                        alt="" /></div>
                            </div>
                        </div>
                    @endforeach
                </div>
            </div>
        </section>
    @endif
    <!-- End Core features -->

    <!-- Start Best features -->
    @if (isset($section['best_features']) && $section['best_features']->status == STATUS_ACTIVE)
        <section class="bg-white pt-150 ld-container-1335 best-features">
            <div class="best-features-bg-img">
                <img src="{{ asset('user/images/landing-page/best-features-bg.png') }}" alt="{{ getOption('app_name') }}" />
            </div>
            <div class="container position-relative z-index-1">
                <div class="row justify-content-center">
                    <div class="col-lg-8">
                        <div class="text-center pb-52">
                            <p
                                class="d-inline-flex py-6 px-20 bd-ra-12 bg-main-color-20 mb-13 fs-17 fw-500 lh-28 text-main-color">
                                {{ $section['best_features']->page_title }}</p>
                            <h4 class="pb-9 fs-sm-64 fs-33 fw-700 lh-sm-76 lh-44 text-white">
                                <{{ $section['best_features']->title }} /h4>
                                    <p class="fs-18 fw-400 lh-28 text-header-text max-w-581 m-auto">
                                        {{ $section['best_features']->description }}</p>
                        </div>
                    </div>
                </div>
                <div class="">
                    <ul class="nav nav-tabs zTab-reset zTab-three" id="myTab" role="tablist">
                        @forelse ($best_features as $key => $item)
                            <li class="nav-item" role="presentation">
                                <button class="nav-link{{ $key === 0 ? ' active' : '' }}" id="tab-{{ $key }}-tab"
                                    data-bs-toggle="tab" data-bs-target="#tab-{{ $key }}" type="button"
                                    role="tab" aria-controls="tab-{{ $key }}"
                                    aria-selected="{{ $key === 0 ? 'true' : 'false' }}">
                                    {{ $item->name }}
                                </button>
                            </li>
                        @empty
                            <!-- Handle empty case here -->
                        @endforelse
                    </ul>
                    <div class="tab-content best-features-tabContent" id="myTabContent">
                        @forelse ($best_features as $key => $item)
                            <div class="tab-pane fade{{ $key === 0 ? ' show active' : '' }}" id="tab-{{ $key }}"
                                role="tabpanel" aria-labelledby="tab-{{ $key }}-tab" tabindex="0">
                                <div class="best-features-content">
                                    <div class="row align-items-center rg-20">
                                        <div class="col-lg-5">
                                            <div class="max-w-483">
                                                <h4 class="fs-sm-52 fs-33 fw-700 lh-sm-64 text-white pb-9">
                                                    {{ $item->title }}</h4>
                                                <p class="fs-18 fw-400 lh-28 text-para-text">{{ $item->description }}</p>
                                            </div>
                                        </div>
                                        <div class="col-lg-7">
                                            <div class="max-w-680 ms-auto">
                                                <img src="{{ getFileUrl($item->image) }}" alt="{{ $item->title }}" />
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        @empty
                            <div class="text-end">
                                <p class="text-main-color">{{ __('No Data Found') }}</p>
                            </div>
                        @endforelse
                    </div>
                </div>
            </div>
        </section>
    @endif
    <!-- End Best features -->
    @if (isset($section['pricing_plan']) && $section['pricing_plan']->status == STATUS_ACTIVE)
        <!-- Start Pricing Plan -->
        <section class="py-150 bg-white ld-container-1320" id="price">
            <div class="container">
                <!--  -->
                <div class="row justify-content-center">
                    <div class="col-lg-7">
                        <div class="text-center pb-35">
                            <p
                                class="d-inline-flex py-6 px-20 bd-ra-12 bg-main-color-20 mb-13 fs-17 fw-500 lh-28 text-main-color">
                                {{ $section['pricing_plan']->page_title }}</p>
                            <h4 class="fs-sm-64 fs-33 fw-700 lh-sm-76 lh-44 text-textBlack">
                                {{ $section['pricing_plan']->title }}</h4>
                        </div>
                    </div>
                </div>
                <!--  -->
                <div class="d-flex justify-content-center align-items-center g-20 pb-50">
                    <h4 class="fs-20 fw-500 lh-26 text-textBlack">{{ __('Monthly') }}</h4>
                    <div class="price-plan-tab">
                        <div class="zCheck form-check form-switch zPrice-plan-switch">
                            <input class="form-check-input" type="checkbox" role="switch" id="zPrice-plan-switch" />
                        </div>
                    </div>
                    <h4 class="fs-20 fw-500 lh-26 text-textBlack">{{ __('Yearly') }}</h4>
                </div>
                <!--  -->
                <div class="">
                    <div class="row rg-20">
                        @foreach ($packages as $package)
                            <div class="col-xl-4 col-md-6">
                                <div
                                    class="price-plan-one {{ $package->is_default == ACTIVE ? 'price-plan-popular active' : '' }}">
                                    <div class="price-head">
                                        <div class="icon">
                                            <img src="{{ getFileUrl($package->icon_id) }}" alt="{{ $package->name }}" />
                                        </div>
                                        <h4 class="fs-24 fw-500 lh-28 text-white pb-19">{{ $package->name }}</h4>
                                        <h4 class="fs-20 fw-500 lh-24 text-white zPrice-plan-monthly"><span
                                                class="fs-sm-64 lh-sm-76">{{ showPrice($package->monthly_price) }}</span>/{{ __('Monthly') }}
                                        </h4>
                                        <h4 class="fs-20 fw-500 lh-24 text-white zPrice-plan-yearly"><span
                                                class="fs-sm-64 lh-sm-76">{{ showPrice($package->yearly_price) }}</span>/{{ __('Yearly') }}
                                        </h4>
                                    </div>
                                    <div class="price-body">
                                        <ul class="zList-pb-13 mb-50">
                                            <li>
                                                <div class="d-flex align-items-center g-10 bg-white bd-ra-40 py-12 px-15">
                                                    <div class="d-flex max-w-22">
                                                        <img src="{{ asset('user/images/icon/price-check-icon.svg') }}"
                                                            alt="{{ $package->name }}" />
                                                    </div>
                                                    <p class="fs-18 fw-400 lh-22 text-para-text">
                                                        @if ($package->customer_limit == -1)
                                                            {{ __('Add Unlimited Customers') }}
                                                        @else
                                                            {{ __('Add ' . $package->customer_limit . ' Customers') }}
                                                        @endif
                                                    </p>
                                                </div>
                                            </li>
                                            <li>
                                                <div class="d-flex align-items-center g-10 bg-white bd-ra-40 py-12 px-15">
                                                    <div class="d-flex max-w-22">
                                                        <img src="{{ asset('user/images/icon/price-check-icon.svg') }}"
                                                            alt="{{ $package->name }}" />
                                                    </div>
                                                    <p class="fs-18 fw-400 lh-22 text-para-text">
                                                        @if ($package->product_limit == -1)
                                                            {{ __('Add Unlimited Products') }}
                                                        @else
                                                            {{ __('Add ' . $package->product_limit . ' Products') }}
                                                        @endif
                                                    </p>
                                                </div>
                                            </li>
                                            <li>
                                                <div class="d-flex align-items-center g-10 bg-white bd-ra-40 py-12 px-15">
                                                    <div class="d-flex max-w-22">
                                                        <img src="{{ asset('user/images/icon/price-check-icon.svg') }}"
                                                            alt="{{ $package->name }}" />
                                                    </div>
                                                    <p class="fs-18 fw-400 lh-22 text-para-text">
                                                        @if ($package->customer_limit == -1)
                                                            {{ __('Add Unlimited Subscriptions') }}
                                                        @else
                                                            {{ __('Add ' . $package->customer_limit . ' Subscriptions') }}
                                                        @endif
                                                    </p>
                                                </div>
                                            </li>
                                            @foreach (json_decode($package->others) ?? [] as $other)
                                                <li>
                                                    <div
                                                        class="d-flex align-items-center g-10 bg-white bd-ra-40 py-12 px-15">
                                                        <div class="d-flex max-w-22">
                                                            <img src="{{ asset('user/images/icon/price-check-icon.svg') }}"
                                                                alt="{{ $package->name }}" />
                                                        </div>
                                                        <p class="fs-18 fw-400 lh-22 text-para-text">
                                                            {{ __($other) }} </p>
                                                    </div>
                                                </li>
                                            @endforeach
                                        </ul>
                                        <a href="{{ route('user.subscription.index') }}?id={{ $package->id }}"
                                            class="btn link"
                                            title="{{ __('Subscribe Now') }}">{{ __('Subscribe Now') }}</a>
                                    </div>
                                </div>
                                </form>
                            </div>
                        @endforeach
                    </div>
                </div>
            </div>
        </section>
    @endif
    <!-- End Pricing Plan -->
    @if (isset($section['product_services']) && $section['product_services']->status == STATUS_ACTIVE)
        <!-- Start Product Services -->
        <section class="pb-150 bg-white" id="products">
            <div class="container">
                <div class="row justify-content-center">
                    <div class="col-lg-8">
                        <div class="text-center pb-45">
                            <p
                                class="d-inline-flex py-6 px-20 bd-ra-12 bg-main-color-20 mb-13 fs-17 fw-500 lh-28 text-main-color">
                                {{ $section['product_services']->page_title }}</p>
                            <h4 class="pb-9 fs-sm-64 fs-33 fw-700 lh-sm-76 lh-44 text-textBlack">
                                {{ $section['product_services']->title }}</h4>
                        </div>
                    </div>
                </div>
            </div>
            <div class="container-fluid">
                <div class="max-w-1701 m-auto">
                    <img src="{{ asset(getFileUrl($section['product_services']->image)) }}"
                        alt="{{ $section['product_services']->page_title }}" />
                </div>
            </div>
        </section>
    @endif
    <!-- End Product Services -->
    <!-- Start integrations -->
    @if (isset($section['integrations_menu']) && $section['integrations_menu']->status == STATUS_ACTIVE)
        <section class="py-150" id="integration" data-background="assets/images/landing-page/integrations-bg.png">
            <!--  -->
            <div class="container">
                <div class="row justify-content-center">
                    <div class="col-lg-8">
                        <div class="text-center pb-52">
                            <p
                                class="d-inline-flex py-6 px-20 bd-ra-12 bg-main-color-20 mb-13 fs-17 fw-500 lh-28 text-main-color">
                                {{ $section['integrations_menu']->page_title }}</p>
                            <h4 class="pb-9 fs-sm-64 fs-33 fw-700 lh-sm-76 lh-44 text-textBlack">
                                {{ $section['integrations_menu']->title }}</h4>
                            <p class="fs-18 fw-400 lh-28 text-para-text">{{ $section['integrations_menu']->description }}
                            </p>
                        </div>
                    </div>
                </div>
                <div class="">
                    <img src="{{ asset(getFileUrl($section['integrations_menu']->image)) }}"
                        alt="{{ $section['integrations_menu']->page_title }}" />
                </div>
            </div>
        </section>
    @endif
    <!-- End integrations -->
    <!-- Start Testimonials -->
    @if (isset($section['testimonials_area']) && $section['testimonials_area']->status == STATUS_ACTIVE)
        <section class="pt-150 bg-white overflow-hidden" id="testimonial">
            <div class="container">
                <!--  -->
                <div class="row justify-content-center">
                    <div class="col-lg-7">
                        <div class="text-center pb-52">
                            <p
                                class="d-inline-flex py-6 px-20 bd-ra-12 bg-main-color-20 mb-13 fs-17 fw-500 lh-28 text-main-color">
                                {{ $section['testimonials_area']->page_title }}</p>
                            <h4 class="pb-9 fs-sm-64 fs-33 fw-700 lh-sm-76 lh-44 text-textBlack">
                                {{ $section['testimonials_area']->title }}</h4>
                            <p class="fs-18 fw-400 lh-28 text-para-text max-w-581 m-auto">
                                {{ $section['testimonials_area']->description }}</p>
                        </div>
                    </div>
                </div>
            </div>
            <!--  -->
            <div class="ld-testi-contain">
                <div class="swiper testiSlider">
                    <div class="swiper-wrapper">
                        @forelse ($all_testimonial as $testimonial)
                            <div class="swiper-slide">
                                <div class="bg-body-bg bd-ra-15 px-13 ld-testi-wrap">
                                    <div class="row align-items-center">
                                        <div class="col-lg-6 align-self-stretch">
                                            <div class="ld-testi-img">
                                                <img src="{{ getFileUrl($testimonial->image) }}"
                                                    alt="{{ $testimonial->name }}" />
                                            </div>
                                        </div>
                                        <div class="col-lg-6">
                                            <div class="py-12">
                                                <div class="ld-testi-content">
                                                    <p
                                                        class="bd-b-one bd-c-stroke-color pb-31 mb-31 fs-20 fw-400 lh-32 text-para-text">
                                                        {{ $testimonial->comment }}</p>
                                                    <div class="">
                                                        <h4 class="fs-28 fw-600 lh-28 text-textBlack pb-8">
                                                            {{ $testimonial->name }}</h4>
                                                        <p class="fs-18 fw-500 lh-28 text-textBlack">
                                                            {{ $testimonial->designation }}</p>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        @empty
                            <div class="text-end">
                                <p class="text-main-color">{{ __('No Data Found') }}</p>
                            </div>
                        @endforelse

                    </div>
                    <div class="ld-testi-arrow-btn">
                        <div class="swiper-button-next"><i class="fa-solid fa-angle-right"></i></div>
                        <div class="swiper-button-prev"><i class="fa-solid fa-angle-left"></i></div>
                    </div>
                </div>
            </div>
        </section>
    @endif
    <!-- End Testimonials -->

    <!-- Start FAQ's -->
    @if (isset($section['faqs_area']) && $section['faqs_area']->status == STATUS_ACTIVE)
        <section class="py-150 bg-white" id="faq">
            <div class="container">
                <!--  -->
                <div class="row justify-content-center">
                    <div class="col-lg-7">
                        <div class="text-center pb-52">
                            <p
                                class="d-inline-flex py-6 px-20 bd-ra-12 bg-main-color-20 mb-13 fs-17 fw-500 lh-28 text-main-color">
                                {{ $section['faqs_area']->page_title }} </p>
                            <h4 class="pb-9 fs-sm-64 fs-33 fw-700 lh-sm-76 lh-44 text-textBlack">
                                {{ $section['faqs_area']->title }}</h4>
                            <p class="fs-18 fw-400 lh-28 text-para-text max-w-581 m-auto">
                                {{ $section['faqs_area']->description }}</p>
                        </div>
                    </div>
                </div>
                <!--  -->
                <div class="accordion zAccordion-reset zAccordion-one" id="accordionExample">
                    <div class="row rg-24">
                        @forelse ($all_faq as $key => $faq)
                            <div class="col-lg-6">
                                <div class="accordion-item">
                                    <h2 class="accordion-header">
                                        <button class="accordion-button collapsed" type="button"
                                            data-bs-toggle="collapse" data-bs-target="#collapse{{ $key }}"
                                            aria-controls="collapse{{ $key }}">{{ $faq->title }}</button>
                                    </h2>
                                    <div id="collapse{{ $key }}" class="accordion-collapse collapse"
                                        data-bs-parent="#accordionExample">
                                        <div class="accordion-body">
                                            <p class="">{{ $faq->description }}</p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        @empty
                            <div class="text-center">
                                <p class="text-main-color">{{ __('No Data Found') }}</p>
                            </div>
                        @endforelse
                    </div>
                </div>
            </div>
        </section>
    @endif
    <!-- End FAQ's -->
@endsection
