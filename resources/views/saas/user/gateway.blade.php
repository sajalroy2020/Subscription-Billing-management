@extends('user.layouts.app')
@push('title')
    {{ @$title }}
@endpush
@section('content')
    <div class="px-24 pb-24 position-relative">
        <div class="d-flex justify-content-between align-items-center g-10 flex-wrap pb-20">
            <div class="">
                <h4 class="fs-24 fw-500 lh-24 text-white"></h4>
            </div>
        </div>
        <div class="p-20 bd-one bd-c-stroke-color bd-ra-12 bg-white overflow-hidden">
            <h4 class="fs-18 fw-600 lh-24 text-textBlack pb-13">{{ __(@$title) }}</h4>
            <div id="customersTable_wrapper" class="dataTables_wrapper no-footer">
                <table class="table zTable zTable-last-item-right dataTable no-footer dtr-inline" id="customersTable"
                    aria-describedby="customersTable_info">
                    <thead>
                        <tr>
                            <th scope="col" class="sorting_disabled" rowspan="1" colspan="1">
                                <div>{{ __('SL') }}</div>
                            </th>
                            <th scope="col" class="sorting_disabled" rowspan="1" colspan="1">
                                <div>{{ __('Image') }}</div>
                            </th>
                            <th scope="col" class="sorting_disabled" rowspan="1" colspan="1">
                                <div>{{ __('Title') }}</div>
                            </th>
                            <th scope="col" class="sorting_disabled" rowspan="1" colspan="1">
                                <div>{{ __('Slug') }}</div>
                            </th>
                            <th scope="col" class="sorting_disabled" rowspan="1" colspan="1">
                                <div>{{ __('Status') }}</div>
                            </th>
                            <th scope="col" class="sorting_disabled" rowspan="1" colspan="1">
                                <div>{{ __('Mode') }}</div>
                            </th>
                            <th scope="col" class="sorting_disabled" rowspan="1" colspan="1">
                                <div>{{ __('Action') }}</div>
                            </th>
                        </tr>
                    </thead>
                    <tbody>
                        @foreach ($gateways as $gateway)
                            <tr>
                                <td>{{ $loop->iteration }}</td>
                                <td>
                                    <div class="">
                                        <div class="btn btn-dropdown site-language">
                                            <img src="{{ asset($gateway->image) }}" class="gateway-image" alt="">
                                        </div>
                                    </div>
                                </td>
                                <td>{{ $gateway->title }}</td>
                                <td>{{ $gateway->slug }}</td>
                                <td>
                                    @if ($gateway->status == ACTIVE)
                                        <div class="status-btn status-btn-green font-13 radius-4">
                                            {{ __('Active') }}</div>
                                    @else
                                        <div class="status-btn status-btn-orange font-13 radius-4">
                                            {{ __('Deactive') }}</div>
                                    @endif
                                </td>
                                <td>
                                    @if ($gateway->mode == GATEWAY_MODE_LIVE)
                                        <div class="status-btn status-btn-green font-13 radius-4">
                                            {{ __('Live') }}</div>
                                    @elseif($gateway->slug != 'bank')
                                        <div class="status-btn status-btn-orange font-13 radius-4">
                                            {{ __('Sandbox') }}</div>
                                    @endif
                                </td>
                                <td>
                                    <button type="button" class="border-0 edit" data-toggle="tooltip"
                                        title="{{ __('Edit') }}" data-id="{{ $gateway->id }}">
                                        <img src="{{ asset('assets/images/icon/edit.svg') }}" alt="edit">
                                    </button>
                                </td>
                            </tr>
                        @endforeach
                    </tbody>
                </table>
            </div>
        </div>
    </div>
    <!-- Page content area end -->
    <div class="modal fade" id="editModal" tabindex="-1" aria-labelledby="editModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content bd-c-stroke-color bd-ra-12 py-25 px-20">
                <div class="d-flex justify-content-between align-items-center cg-10 pb-24">
                    <h4 class="fs-18 fw-600 lh-24 text-textBlack">{{ __('Edit Gateway') }}</h4>
                    <button type="button"
                        class="w-30 h-30 rounded-circle d-flex justify-content-center align-items-center bd-one bd-c-stroke-color bg-transparent"
                        data-bs-dismiss="modal" aria-label="Close">
                        <img src="{{ asset('user/images/icon/close.svg') }}" alt="" />
                    </button>
                </div>
                <form class="ajax" action="{{ route('user.gateway.store') }}" method="POST"
                    data-handler="responseOnGatewaStore">
                    @csrf
                    <input type="hidden" name="id" id="id" required>
                    <div class="zForm-wrap pb-20">
                        <div class="upload-profile-photo-box mb-10">
                            <div class="profile-user position-relative d-inline-block">
                                <img src="" class="image" alt="">
                            </div>
                        </div>
                    </div>
                    <div class="zForm-wrap pb-20">
                        <label class="zForm-label">{{ __('Title') }}</label>
                        <input type="text" class="form-control zForm-control title" readonly>
                    </div>
                    <div class="zForm-wrap pb-20">
                        <label class="zForm-label">{{ __('Title') }}</label>
                        <input type="text" class="form-control zForm-control title" readonly>
                    </div>
                    <div class="zForm-wrap pb-20">
                        <label class="zForm-label">{{ __('Slug') }}</label>
                        <input type="text" name="slug" class="form-control zForm-control slug" readonly>
                    </div>

                    <div class="zForm-wrap pb-20">
                        <label for="status" class="zForm-label">{{ __('Status') }}</label>
                        <select name="status" id="status" class="form-control zForm-control">
                            <option value="0">{{ __('Deactive') }}</option>
                            <option value="1">{{ __('Active') }}</option>
                        </select>
                    </div>

                    <div class="zForm-wrap pb-20">
                        <label for="mode" class="zForm-label">{{ __('Mode') }}</label>
                        <select name="mode" id="mode" class="form-control zForm-control">
                            <option value="1">{{ __('Live') }}</option>
                            <option value="2">{{ __('Sandbox') }}</option>
                        </select>
                    </div>
                    <div class="zForm-wrap">
                        <div class="row">
                            <div class="bank-div pb-20">
                                <div class="bank-div-append">
                                </div>
                                <div class="row mb-20">
                                    <div class="col-12 text-end">
                                        <button type="button"
                                            class="add-bank bd-ra-12 bg-color5 border-0 fs-16 fw-600 lh-19 px-25 py-13 text-white"
                                            title="{{ __('Add Bank') }}">
                                            <span class="iconify" data-icon="material-symbols:add"></span>
                                            {{ __('Add Bank') }}</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="zForm-wrap">
                        <div class="row url-div pb-20">
                            <div class="col-md-12 gateway-input" id="gateway-url">
                                <label class="zForm-label">{{ __('Url') }}
                                    /{{ __('Hash') }}</label>
                                <input class="form-control" type="text" name="url">
                            </div>
                        </div>
                    </div>
                    <div class="zForm-wrap">
                        <div class="row key-secret-div pb-20">
                            <div class="col-md-12 mb-10 gateway-input" id="gateway-key">
                                <label class="zForm-label">{{ __('Key') }}</label>
                                <input class="form-control" type="text" name="key">
                                <small
                                    class="d-none small">{{ __('Client id, Public Key, Key, Store id, Api Key') }}</small>
                            </div>
                            <div class="col-md-12 mb-10 gateway-input" id="gateway-secret">
                                <label class="zForm-label">{{ __('Secret') }}</label>
                                <input class="form-control" type="text" name="secret">
                                <small
                                    class="d-none small">{{ __('Client Secret, Secret, Store Password, Auth Token') }}</small>
                            </div>
                        </div>
                    </div>
                    <div class="zForm-wrap pb-20">
                        <div class="row">
                            <div class="col-md-12">
                                <label class="label-text-title color-heading font-medium mb-2">{{ __('Currency Conversion Rate') }}
                                    <button type="button"
                                        class="add-currency bd-ra-12 bg-e4e6eb border-0 edit-btn fs-15 fw-500 lh-25 ml-10fs-15 text-black"><svg
                                            xmlns="http://www.w3.org/2000/svg" width="21" height="21"
                                            viewBox="0 0 21 21">
                                            <path fill="none" stroke="currentColor" stroke-linecap="round"
                                                stroke-linejoin="round" d="M5.5 10.5h10m-5-5v10" />
                                        </svg></span>
                                    </button>
                                </label>
                                <div id="currencyConversionRateSection"></div>
                            </div>
                        </div>
                    </div>
                    <div class="d-flex align-items-center cg-10">
                        <button type="submit"
                            class="border-0 bd-ra-12 py-13 px-25 bg-main-color fs-16 fw-600 lh-19 text-white">{{ __('Update') }}
                        </button>
                        <button type="button"
                            class="border-0 bd-ra-12 py-13 px-25 bg-cancel-color fs-16 fw-600 lh-19 text-textBlack "
                            data-bs-dismiss="modal">
                            {{ __('Cancel') }}
                        </button>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <input type="hidden" id="getInfoRoute" value="{{ route('user.gateway.get.info') }}">
    <input type="hidden" id="getCurrencySymbol" value="{{ getCurrencySymbol() }}">
    <input type="hidden" id="allCurrency" value="{{ json_encode(getCurrency()) }}">
    <input type="hidden" id="gatewaySettings" value="{{ gatewaySettings() }}">
@endsection
@push('script')
    <script src="{{ asset('admin/js/gateway.js') }}"></script>
@endpush
