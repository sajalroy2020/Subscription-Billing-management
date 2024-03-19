@extends('user.layouts.app')
@push('title')
    {{ __(@$title) }}
@endpush
@section('content')
    <div class="px-24 pb-24 position-relative">
        <div class="d-flex justify-content-between align-items-center g-10 flex-wrap pb-20">
            <div class="">
                <h4 class="fs-24 fw-500 lh-24 text-white">{{ __(@$title) }}</h4>
            </div>
        </div>

        <div class="p-20 bd-ra-12 bg-white">
            <div class="row">
                <div class="col-md-6">
                    @if (!is_null($userPackage))
                        <div class="card bd-c-bg-color mb-20">
                            <div class="card-header border-bottom-0">
                                <div class="current-plan d-flex align-items-center">
                                    <div class="flex-grow-1">
                                        <p class="fs-14 fw-400 lh-18 text-para-text">{{ __('Current Package') }}</p>
                                        <h4 class="fs-18 fw-700 lh-28 text-para-text  text-capitalize">
                                            {{ $userPackage->name }}
                                            <small
                                                class="small">/{{ $userPackage->duration_type == DURATION_MONTH ? __('Monthly') : __('Yearly') }}</small>
                                        </h4>
                                    </div>
                                    <div class="flex-shrink-0 ms-3">
                                        <button type="button"
                                            class="border-0 bd-ra-12 bg-main-color py-13 px-25 fs-16 fw-600 lh-19 text-white"
                                            id="chooseAPlan"
                                            title="{{ __('Upgrade Plan') }}">{{ __('Upgrade Plan') }}</button>
                                    </div>
                                </div>
                            </div>
                            <div class="subscription-plan-box">
                                <div class="card-body">
                                    <p class="fs-16 fw-400 lh-18 text-para-text pb-12">{{ __('Usage') }}</p>
                                    <div class="plan-usage-list">

                                        <div class="d-flex mb-2 align-items-center cg-10">
                                            <i class="fa fa-check" aria-hidden="true"></i>

                                            <h4 class="flex-grow-1 fs-18 fw-600 lh-28 text-para-text">
                                                {{ getExistingCustomers(auth()->id()) }} /
                                                @if ($userPackage->customer_limit == -1)
                                                    {{ __('Add Unlimited Customers') }}
                                                @else
                                                    {{ __('Add ' . $userPackage->customer_limit . ' Customers') }}
                                                @endif
                                            </h4>
                                        </div>

                                        <div class="d-flex mb-2 align-items-center cg-10">
                                            <i class="fa fa-check" aria-hidden="true"></i>
                                            <h4 class="flex-grow-1 fs-18 fw-600 lh-28 text-para-text">
                                                {{ getExistingProducts(auth()->id()) }} /
                                                @if ($userPackage->product_limit == -1)
                                                    {{ __('Add Unlimited Products') }}
                                                @else
                                                    {{ __('Add ' . $userPackage->product_limit . ' Products') }}
                                                @endif
                                            </h4>
                                        </div>

                                        <div class="d-flex mb-2 align-items-center cg-10">
                                            <i class="fa fa-check" aria-hidden="true"></i>
                                            <h4 class="flex-grow-1 fs-18 fw-600 lh-28 text-para-text">
                                                {{ getExistingSubscriptions(auth()->id()) }} /
                                                @if ($userPackage->customer_limit == -1)
                                                    {{ __('Add Unlimited Subscriptions') }}
                                                @else
                                                    {{ __('Add ' . $userPackage->customer_limit . ' Subscriptions') }}
                                                @endif
                                            </h4>
                                        </div>

                                        @foreach (getPackageOtherFields(auth()->id()) as $field)
                                            <div class="d-flex mb-2 align-items-center cg-10">
                                                <i class="fa fa-check" aria-hidden="true"></i>
                                                <h4 class="flex-grow-1 fs-18 fw-600 lh-28 text-para-text">
                                                    {{ $field }}
                                                </h4>
                                            </div>
                                        @endforeach

                                        <div class="d-flex mb-2 align-items-center cg-10">
                                            <i class="fa fa-check" aria-hidden="true"></i>
                                            <h4 class="flex-grow-1 fs-18 fw-600 lh-28 text-para-text">
                                                <span class="h6">
                                                    {{ __('Started at ') }}
                                                </span>
                                                {{ $userPackage->start_date }}
                                            </h4>
                                        </div>

                                        <div class="d-flex mb-2 align-items-center cg-10">
                                            <i class="fa fa-check" aria-hidden="true"></i>
                                            <h4 class="flex-grow-1 fs-18 fw-600 lh-28 text-para-text">
                                                <span class="h6">{{ __('End in ') }}</span>
                                                {{ $userPackage->end_date }}
                                            </h4>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    @else
                        <div class="card bd-c-bg-color mb-20">
                            <div class="card-body">
                                <h4 class="mb-20">{{ __("Currently you doesn't have any subscription") }}</h4>
                                <button type="button"
                                    class="border-0 bd-ra-12 bg-main-color py-13 px-25 fs-16 fw-600 lh-19 text-white"
                                    id="chooseAPlan" title="{{ __('Choose a plan') }}">{{ __('Choose a plan') }}</button>
                            </div>
                        </div>
                    @endif
                </div>
                <div class="col-md-6">
                    @if (!is_null($userPackage))
                        <div class="card bd-c-bg-color">
                            <div class="card-body">
                                <form action="{{ route('user.subscription.cancel') }}" method="post">
                                    @csrf
                                    <button type="button"
                                        class="theme-btn-red subscriptionCancel border-0 bg-red bd-ra-10 fs-16 fw-600 lh-19 text-white p-13"
                                        title="{{ __('Cancel your subscription') }}">{{ __('Cancel your subscription') }}</button>
                                </form>
                            </div>
                            <p class="px-20 pb-20 fs-16 fw-400 lh-18 text-para-text">
                                {{ __('Please be aware that cancelling your subscription will cause you to lose all your saved content and earned words on your subscription.') }}
                            </p>
                        </div>
                    @endif
                </div>
            </div>
            <!-- Page Content Wrapper End -->
            <div class="row">
                <div class="col-md-6">
                    <div class="p-20 bd-one bd-c-stroke-color bd-ra-12 bg-white mb-24">
                        <h4 class="fs-18 fw-600 lh-24 text-textBlack pb-16">{{ __('Package History') }}</h4>
                        <div class="table-responsive">
                            <table class="table zTable zTable-last-item-right">
                                <thead>
                                    <tr>
                                        <th scope="col">
                                            <div class="min-w-120">{{ __('Package') }}</div>
                                        </th>
                                        <th scope="col">
                                            <div>{{ __('Total') }}</div>
                                        </th>
                                        <th scope="col">
                                            <div>{{ __('Start Date') }}</div>
                                        </th>
                                        <th scope="col">
                                            <div>{{ __('End Date') }}</div>
                                        </th>
                                    </tr>
                                </thead>
                                <tbody>
                                    @forelse($packageHistories as $package)
                                        <tr>
                                            <td>{{ $package->packageName }}</td>
                                            <td>{{ $package->total }}</td>
                                            <td>{{ date('Y-m-d', strtotime($package->start_date)) }}</td>
                                            <td>{{ date('Y-m-d', strtotime($package->end_date)) }}</td>
                                        </tr>
                                    @empty
                                        <tr>
                                            <td class="text-center " colspan="2">{{ __('No Data Found') }}</td>
                                        </tr>
                                    @endforelse

                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="p-20 bd-one bd-c-stroke-color bd-ra-12 bg-white mb-24">
                        <h4 class="fs-18 fw-600 lh-24 text-textBlack pb-16">{{ __('Order History') }}</h4>
                        <div class="table-responsive">
                            <table class="table zTable zTable-last-item-right">
                                <thead>
                                    <tr>
                                        <th scope="col">
                                            <div class="min-w-120">{{ __('Package') }}</div>
                                        </th>
                                        <th scope="col">
                                            <div>{{ __('Total') }}</div>
                                        </th>
                                        <th scope="col">
                                            <div>{{ __('Gateway') }}</div>
                                        </th>
                                        <th scope="col">
                                            <div>{{ __('Status') }}</div>
                                        </th>
                                    </tr>
                                </thead>
                                <tbody>
                                    @forelse($orderHistories as $order)
                                        <tr>
                                            <td>{{ $order->packageName }}</td>
                                            <td>{{ $order->total }}</td>
                                            <td>{{ $order->gatewayTitle }}</td>
                                            <td>
                                                @if ($order->payment_status == PAYMENT_STATUS_PAID)
                                                    <p class="zBadge zBadge-active">{{ __('Paid') }}</p>
                                                @elseif ($order->payment_status == PAYMENT_STATUS_PENDING)
                                                    <p class="zBadge zBadge-fuilure">{{ __('Unpaid') }}</p>
                                                @else
                                                    <p class="zBadge zBadge-pending">{{ __('Cancelled') }} </p>
                                                @endif
                                            </td>
                                        </tr>
                                    @empty
                                        <tr>
                                            <td class="text-center " colspan="2">{{ __('No Data Found') }}</td>
                                        </tr>
                                    @endforelse
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>

        </div>
    </div>
    <!-- Right Content End -->
    {{-- modal  --}}
    <!-- Choose a plan Modal Start -->

    @if (isAddonInstalled('SUBSAAS') > 0)
        <div class="modal fade" id="choosePackageModal" tabindex="-1" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered modal-xl">
                <div class="modal-content bd-c-stroke-color bd-ra-12 py-25 px-20">
                    <div class="d-flex justify-content-end align-items-center cg-10 pb-24">
                        <button type="button"
                            class="w-30 h-30 rounded-circle d-flex justify-content-center align-items-center bd-one bd-c-stroke-color bg-transparent"
                            data-bs-dismiss="modal" aria-label="Close">
                            <img src="{{ asset('user/images/icon/close.svg') }}" alt="" />
                        </button>
                    </div>
                    <div class="modal-body">
                        <div class="choose-plan-area">
                            <div class="row justify-content-center">
                                <div class="col-lg-7">
                                    <div class="text-center pb-35">
                                        <h4 class="fs-sm-64 fs-33 fw-700 lh-sm-76 lh-44 text-textBlack">
                                            {{ __('Choose A Plan') }}</h4>
                                    </div>
                                </div>
                            </div>
                            <div class="d-flex justify-content-center align-items-center g-20 pb-50">
                                <h4 class="fs-20 fw-500 lh-26 text-textBlack">Monthly</h4>
                                <div class="price-plan-tab">
                                    <div class="zCheck form-check form-switch zPrice-plan-switch">
                                        <input class="form-check-input" type="checkbox" role="switch"
                                            id="zPrice-plan-switch" />
                                    </div>
                                </div>
                                <h4 class="fs-20 fw-500 lh-26 text-textBlack">Yearly</h4>
                            </div>
                            <div class="pricing-plan-area px-5">
                                <div class="row price-table-wrap" id="planListBlock">

                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Choose a plan Modal End -->

        <!-- Payment Method Modal Start -->
        <div class="modal fade" id="paymentMethodModal" tabindex="-1" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered modal-xl">
                <div class="modal-content bd-c-stroke-color bd-ra-12 py-25 px-20">
                    <div class="d-flex justify-content-end align-items-center cg-10 pb-24">
                        <button type="button"
                            class="w-30 h-30 rounded-circle d-flex justify-content-center align-items-center bd-one bd-c-stroke-color bg-transparent"
                            data-bs-dismiss="modal" aria-label="Close">
                            <img src="{{ asset('user') }}/images/icon/close.svg" alt="" />
                        </button>
                    </div>
                    <div class="modal-body">
                        <!-- Choose a plan content Start -->
                        <div class="payment-method-area">
                            <div class="row justify-content-center">
                                <div class="col-lg-7">
                                    <div class="text-center pb-35">
                                        <h4 class="fs-sm-52 fw-700 lh-44 lh-sm-76 text-textBlack">
                                            {{ __('Select Payment Method') }}</h4>
                                    </div>
                                </div>
                            </div>
                            <div class="payment-method-wrap px-5">
                                <form class="" action="{{ route('payment.subscription.checkout') }}"
                                    method="POST" enctype="multipart/form-data">
                                    @csrf
                                    <input type="hidden" id="package_id" name="package_id">
                                    <input type="hidden" id="selectGateway" name="gateway">
                                    <input type="hidden" id="selectCurrency" name="currency">
                                    <input type="hidden" id="duration_type" name="duration_type">
                                    <div class="row" id="gatewayListBlock">
                                    </div>
                                    <div class="row">
                                        <div class="cg-10 d-flex justify-content-end mt-18">
                                            <button type="button"
                                                class="border-0 bd-ra-12 py-13 px-25 bg-main-color fs-16 fw-600 lh-19 text-white"
                                                id="payBtn">{{ __('Pay Now') }}<span class="ms-1"
                                                    id="gatewayCurrencyAmount"></span></button>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                        <!-- Choose a plan content End -->
                    </div>
                </div>
            </div>
        </div>
        <!-- Payment Method Modal End -->
    @endif


    @if (!is_null(request()->id))
        <input type="hidden" id="requestPlanId" value="{{ request()->id }}">
        <input type="hidden" id="gatewayResponse" value="{{ $gateways }}">
    @endif
    <input type="hidden" id="requestCurrentPlan" value="{{ request()->current_plan }}">
    <input type="hidden" id="chooseAPlanRoute" value="{{ route('user.subscription.get.package') }}">
    <input type="hidden" id="getCurrencyByGatewayRoute" value="{{ route('user.subscription.get.currency') }}">
@endsection

@push('script')
    <script src="{{ asset('user/custom/js/subscription-user.js') }}"></script>
@endpush
