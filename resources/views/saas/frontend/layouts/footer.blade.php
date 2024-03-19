<!-- Start Footer -->
<section class="landing-footer bg-color10">
    <div class="footer-top pb-100 position-relative pt-114 z-index-1">
        <div class="container">
            <div class="row rg-20">
                <div class="col-lg-4 col-md-6">
                    <div class="max-w-366">
                        <div class="max-w-147 pb-22">
                            <a href="{{ route('frontend') }}">
                                <img src="{{ getSettingImage('app_logo_white') }}" alt="{{ getOption('app_name') }}" />
                            </a>
                        </div>
                        <p class="pb-32 fs-18 fw-400 lh-28 text-white-80">{{ getOption('app_footer_text') }}</p>
                        <ul class="d-flex align-items-center g-12 footer-social">
                            <li>
                                <a target="__blank" href="{{ getOption('social_media_facebook') }}"
                                    class="w-40 h-40 rounded-circle bd-one bd-c-white-10 d-flex justify-content-center align-items-center text-white"><i
                                        class="fa-brands fa-facebook-f"></i></a>
                            </li>
                            <li>
                                <a target="__blank" href="{{ getOption('social_media_twitter') }}"
                                    class="w-40 h-40 rounded-circle bd-one bd-c-white-10 d-flex justify-content-center align-items-center text-white"><i
                                        class="fa-brands fa-twitter"></i></a>
                            </li>
                            <li>
                                <a target="__blank" href="{{ getOption('social_media_linkedin') }}"
                                    class="w-40 h-40 rounded-circle bd-one bd-c-white-10 d-flex justify-content-center align-items-center text-white"><i
                                        class="fa-brands fa-linkedin-in"></i></a>
                            </li>
                            <li>
                                <a target="__blank" href="{{ getOption('social_media_skype') }}"
                                    class="w-40 h-40 rounded-circle bd-one bd-c-white-10 d-flex justify-content-center align-items-center text-white"><i
                                        class="fa-brands fa-skype"></i></a>
                            </li>
                        </ul>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6 col-sm-6">
                    <div class="pl-xl-70">
                        <h4 class="pb-37 fs-24 fw-500 lh-30 text-white">{{ __('Company') }}</h4>
                        <ul class="zList-pb-21">
                            <li>
                                <a href="#features"
                                    class="fs-18 fw-400 lh-27 text-white-80 hover-color-one">{{ __('Features') }}</a>
                            </li>
                            <li>
                                <a href="#integration"
                                    class="fs-18 fw-400 lh-27 text-white-80 hover-color-one">{{ __('Integrations') }}</a>
                            </li>
                            <li>
                                <a href="#price"
                                    class="fs-18 fw-400 lh-27 text-white-80 hover-color-one">{{ __('Pricing') }}</a>
                            </li>
                        </ul>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6 col-sm-6">
                    <div class="pl-xl-70">
                        <h4 class="pb-37 fs-24 fw-500 lh-30 text-white">{{ __('Info') }}</h4>
                        <ul class="zList-pb-21">
                            <li>
                                <a href="#faq"
                                    class="fs-18 fw-400 lh-27 text-white-80 hover-color-one">{{ __('FAQ\'s') }}</a>
                            </li>
                            <li>
                                <a href="#testimonial"
                                    class="fs-18 fw-400 lh-27 text-white-80 hover-color-one">{{ __('Testimonials') }}</a>
                            </li>
                            <li>
                                <a href="#products"
                                    class="fs-18 fw-400 lh-27 text-white-80 hover-color-one">{{ __('Products') }}</a>
                            </li>
                        </ul>
                    </div>
                </div>
                <div class="col-lg-2 col-md-6 col-sm-6">
                    <div class="max-w-131 ms-lg-auto">
                        <h4 class="pb-37 fs-24 fw-400 lh-30 text-white">{{ __('Get In Touch') }}</h4>
                        <ul class="zList-pb-21">
                            <li>
                                <a href="{{ route('user.register.form') }}"
                                    class="fs-18 fw-400 lh-27 text-white-80 hover-color-one">{{ __('Sign Up') }}</a>
                            </li>
                            <li>
                                <a href="{{ route('login') }}"
                                    class="fs-18 fw-400 lh-27 text-white-80 hover-color-one">{{ __('Sign In') }}</a>
                            </li>
                            @auth
                                <li>
                                    <a href="{{ route('logout') }}"
                                        class="fs-18 fw-400 lh-27 text-white-80 hover-color-one">{{ __('Logout') }}</a>
                                </li>
                            @endauth
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
    @if (getOption('app_copyright'))
        <div class="container">
            <div class="py-25 bd-t-one bd-c-white-12">
                <p class="text-center fs-16 fw-400 lh-22 text-white">
                    {{ getOption('app_copyright') }}
                    @if (getOption('develop_by'))
                        {{ __('By') }}
                        <a href="{{ route('frontend') }}"
                            class="text-main-color text-decoration-underline">{{ getOption('develop_by') }}</a>
                    @endif
                </p>
            </div>
        </div>
    @endif
</section>
<!-- End Footer -->
