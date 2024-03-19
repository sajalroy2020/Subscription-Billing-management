<div class="col-md-5">
    <div class="tenant-portal-invoice-details-leftside bg-off-white theme-border p-20 radius-4 mb-25">
        <div class="row align-items-center">
            <div class="col-12">
                <div class="d-flex align-items-center justify-content-between mb-25">
                    <h4 class="mb-0">{{ __('Payment Details') }}</h4>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-12">
                <div class="table-responsive">
                    <table class="table theme-border p-20">
                        <tbody>
                            <tr>
                                <td>{{ __('Name') }}</td>
                                <td>
                                    <h6 class="tenant-invoice-tbl-right-text text-end">
                                        {{ $package->name }}</h6>
                                </td>
                            </tr>
                            <tr>
                                <td>{{ __('Duration') }}</td>
                                <td>
                                    <h6 class="tenant-invoice-tbl-right-text text-end">
                                        {{ getDurationName($durationType) }}</h6>
                                </td>
                            </tr>
                            <tr>
                                <td>{{ __('Amount') }}</td>
                                <td>
                                    @if ($durationType == DURATION_MONTH)
                                        <h6 class="tenant-invoice-tbl-right-text text-end">
                                            <input type="hidden" id="planAmount" value="{{ $package->monthly_price }}">
                                            {{ showPrice($package->monthly_price) }}
                                        </h6>
                                    @else
                                        <h6 class="tenant-invoice-tbl-right-text text-end">
                                            <input type="hidden" id="planAmount" value="{{ $package->yearly_price }}">
                                            {{ showPrice($package->yearly_price) }}
                                        </h6>
                                    @endif
                                </td>
                            </tr>
                            <tr>
                                <td>{{ __('Start Date') }}</td>
                                <td>
                                    <h6 class="tenant-invoice-tbl-right-text text-end">
                                        {{ $startDate }}</h6>
                                </td>
                            </tr>
                            <tr>
                                <td>{{ __('End Date') }}</td>
                                <td>
                                    <h6 class="tenant-invoice-tbl-right-text text-end">
                                        {{ $endDate }}</h6>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                    <table class="table theme-border p-20">
                        <tbody id="currencyAppend"></tbody>
                    </table>
                    <table class="table theme-border p-20 d-none" id="bankAppend">
                        <tbody>
                            <tr>
                                <td>{{ __('Bank Deposit') }}</td>
                            </tr>
                            <tr>
                                <td>
                                    <label
                                        class="label-text-title color-heading font-medium mb-2">{{ __('Bank Name') }}</label>
                                    <select name="bank_id" id="bank_id" class="form-control mb-2">
                                        <option value="">{{ __('Select Option') }}</option>
                                        @foreach ($banks as $bank)
                                            <option value="{{ $bank->id }}"
                                                data-details="{{ nl2br($bank->details) }}">{{ $bank->name }}
                                            </option>
                                        @endforeach
                                    </select>
                                    <div class="topic-content-item d-block bg-white theme-border radius-12 my-2 d-none"
                                        id="bankDetails">
                                        <div
                                            class="topic-content-item-btns d-flex align-content-center justify-content-between">
                                            <p class="font-12 my-2 ps-2"></p>
                                        </div>
                                    </div>
                                    <label
                                        class="label-text-title color-heading font-medium mb-2">{{ __('Upload Deposit Slip') }}
                                        (png, jpg)</label>
                                    <input type="file" name="bank_slip" id="bank_slip" class="form-control"
                                        accept="image/png, image/jpg">
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="col-md-7">
    <div class="row justify-content-center" id="gatewaySection">
        <div class="paymentMethod-two">
            @foreach ($gateways as $gateway)
                <div class="item" title="{{ $gateway->title }}">
                    <div class="img">
                        <img src="{{ asset($gateway->image) }}" alt="{{ $gateway->title }}" />
                    </div>
                    <button type="button" data-gateway={{ $gateway->slug }} data-id={{ $gateway->id }}
                        data-package_id={{ $package->id }} data-duration_type={{ $durationType }}
                        class="btn link select-payment-gateway paymentGateway">{{ __('Select') }}</button>
                </div>
            @endforeach
        </div>
    </div>
</div>
