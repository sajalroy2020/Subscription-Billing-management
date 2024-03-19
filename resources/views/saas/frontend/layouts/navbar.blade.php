@if (env('LOGIN_HELP') == 'active')
    <div class="alert alert-danger text-center mb-0" role="alert">
        This page only for addon
        <button type="button" id="topBannerClose" class="close float-end" data-dismiss="alert" aria-label="Close"><span
                aria-hidden="true">&times;</span></button>
    </div>
@endif
<section class="landing-header">
    <div class="container">
        <div class="row align-items-center">
            <div class="col-lg-2 col-6">
                <div class="max-w-174">
                    <a href="{{ route('frontend') }}">
                        <img src="{{ getSettingImage('app_logo') }}" alt="{{ getOption('app_name') }}" />
                    </a>
                </div>
            </div>
            <div class="col-lg-7 col-xl-8 col-6">
                <nav class="navbar navbar-expand-lg p-0">
                    <button class="navbar-toggler landing-menu-navbar-toggler ms-auto" type="button"
                        data-bs-toggle="offcanvas" data-bs-target="#offcanvasNavbar" aria-controls="offcanvasNavbar"
                        aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                    </button>
                    <div class="navbar-collapse landing-menu-navbar-collapse offcanvas offcanvas-start" tabindex="-1"
                        id="offcanvasNavbar" aria-labelledby="offcanvasNavbarLabel">
                        <button type="button"
                            class="d-lg-none w-30 h-30 p-0 rounded-circle bg-white border-0 position-absolute top-10 right-10"
                            data-bs-dismiss="offcanvas" aria-label="Close"><i class="fa-solid fa-times"></i></button>
                        <ul class="navbar-nav landing-menu-navbar-nav justify-content-lg-center flex-wrap w-100">
                            <li class="nav-item"><a class="nav-link" href="#features">{{ __('Features') }}</a></li>
                            <li class="nav-item"><a class="nav-link" href="#price">{{ __('Pricing') }}</a></li>
                            <li class="nav-item"><a class="nav-link" href="#faq">{{ __('FAQ\'s') }}</a></li>
                            <li class="nav-item"><a class="nav-link" href="#integration">{{ __('Integrations') }}</a>
                            </li>
                            <li class="nav-item d-lg-none">
                                @if (auth()->check())
                                    @if (auth()->user()->role == USER_ROLE_ADMIN)
                                        <a href="{{ route('admin.dashboard') }}"
                                            class="nav-link">{{ __('Dashboard') }}</a>
                                    @else
                                        <a href="{{ route('user.dashboard') }}"
                                            class="nav-link">{{ __('Dashboard') }}</a>
                                    @endif
                                @else
                                    <a href="{{ route('login') }}" class="nav-link">{{ __('Login') }}</a>
                                @endif
                            </li>
                        </ul>
                    </div>
                </nav>
            </div>
            <div class="col-lg-3 col-xl-2 d-none d-lg-block">
                @if (auth()->check())
                    @if (auth()->user()->role == USER_ROLE_ADMIN)
                        <a href="{{ route('admin.dashboard') }}"
                            class="d-flex justify-content-center header-right-btn align-items-center py-17 px-10 bd-ra-12 bg-main-color fs-18 fw-600 lh-22 text-white">{{ __('Dashboard') }}</a>
                    @else
                        <a href="{{ route('user.dashboard') }}"
                            class="d-flex justify-content-center header-right-btn align-items-center py-17 px-10 bd-ra-12 bg-main-color fs-18 fw-600 lh-22 text-white">{{ __('Dashboard') }}</a>
                    @endif
                @else
                    <a href="{{ route('login') }}"
                        class="d-flex justify-content-center header-right-btn align-items-center py-17 px-10 bd-ra-12 bg-main-color fs-18 fw-600 lh-22 text-white">{{ __('Login') }}</a>
                @endif
            </div>
        </div>
    </div>
</section>
<!-- Start banner -->
<div class="landing-hero-banner ld-container-1320"
    data-background="{{ asset(getFileUrl($section['hero_banner']->banner_image)) }}">
    <!-- Banner -->
    <div class="container">
        @if (isset($section['hero_banner']) && $section['hero_banner']->status == STATUS_ACTIVE)
            @if (getOption('registration_status', 0) == ACTIVE)
                <div class="landing-hero-banner-content pt-101 pb-68">
                    <h4 class="title">{{ __($section['hero_banner']->title) }}</h4>
                    <p class="info">{{ __($section['hero_banner']->description) }}</p>
                    <a href="{{ route('user.register.form') }}" class="link">{{ __('Request A Demo') }}</a>
                </div>
            @endif
        @endif
    </div>
    <div class="landing-banner-img-one"><img src="{{ asset(getFileUrl($section['hero_banner']->image)) }}"
            alt="{{ getOption('app_name') }}" /></div>
</div>
