<div class="row rg-20">
    @foreach ($packages as $package)
        <div class="col-xl-4 col-md-6">
            <form class="ajax" action="{{ route('user.subscription.get.gateway') }}" method="post"
                enctype="multipart/form-data" data-handler="setPaymentModal">
                @csrf
                <input type="hidden" name="id" value="{{ $package->id }}">
                <input type="hidden" class="plan_type" name="duration_type" value="1">
                <div class="price-plan-one {{ $package->is_default == ACTIVE ? 'price-plan-popular active' : '' }}">
                    <div class="price-head">
                        <div class="icon">
                            <img src="{{ getFileUrl($package->icon_id) }}" alt="" />
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
                                    <div class="d-flex align-items-center g-10 bg-white bd-ra-40 py-12 px-15">
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
                        @if ($currentPackage?->package_id == $package->id)
                            <button type="submit" class="btn link"
                                title="{{ __('Current Package') }}">{{ __('Current Package') }}</button>
                        @else
                            <button type="submit" class="btn link"
                                title="{{ __('Subscribe Now') }}">{{ __('Subscribe Now') }}</button>
                        @endif

                    </div>
                </div>
            </form>
        </div>
    @endforeach
</div>
