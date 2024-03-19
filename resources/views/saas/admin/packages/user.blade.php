@extends('admin.layouts.app')
@push('title')
    {{ $title }}
@endpush
@section('content')
    <div class="p-30">
        <div class="">
            <h4 class="fs-24 fw-500 lh-34 text-black pb-16">{{ __($title) }}</h4>
            <div class="row bd-c-ebedf0 bd-half bd-ra-25 bg-white h-100 p-30">
                <div class="col-lg-12">
                    <div class="customers__area bg-style mb-30">
                        @if (isAddonInstalled('SUBSAAS') > 0)
                            <div class="item-title d-flex flex-wrap justify-content-end">
                                <div class="mb-3">
                                    <button class="border-0 fs-15 fw-500 lh-25 text-white py-10 px-26 bg-7f56d9 bd-ra-12"
                                        type="button" id="assignPackage">
                                        <i class="fa fa-plus"></i> {{ __('Assign Package') }}
                                    </button>
                                </div>
                            </div>
                        @endif
                        <div class="table-responsive zTable-responsive">
                            <table class="table zTable" id="packageUserDataTable">
                                <thead>
                                    <th>
                                        <div>{{ __('SL') }}</div>
                                    </th>
                                    <th>
                                        <div>{{ __('Name') }}</div>
                                    </th>
                                    <th>
                                        <div>{{ __('Email') }}</div>
                                    </th>
                                    <th>
                                        <div>{{ __('Package Name') }}</div>
                                    </th>
                                    <th>
                                        <div>{{ __('Gateway') }}</div>
                                    </th>
                                    <th>
                                        <div>{{ __('Start Date') }}</div>
                                    </th>
                                    <th>
                                        <div>{{ __('End Date') }}</div>
                                    </th>
                                    <th>
                                        <div>{{ __('Payment Status') }}</div>
                                    </th>
                                    <th>
                                        <div>{{ __('Status') }}</div>
                                    </th>
                                </thead>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    @if (isAddonInstalled('SUBSAAS') > 0)
        <div class="modal fade" id="assignPackageModal" tabindex="-1" aria-labelledby="assignPackageModalLabel"
            aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">
                    <div class="modal-header p-20 border-0 pb-0">
                        <h5 class="modal-title fs-18 fw-600 lh-24 text-1b1c17">{{ __('Assign Package') }}</h5>
                        <button type="button" class="w-30 h-30 rounded-circle bd-one bd-c-e4e6eb p-0 bg-transparent"
                            data-bs-dismiss="modal" aria-label="Close"><i class="fa-solid fa-times"></i></button>
                    </div>
                    <form class="ajax reset" action="{{ route('admin.packages.assign') }}" method="post"
                        enctype="multipart/form-data" data-handler="commonResponseForModal">
                        @csrf
                        <input type="hidden" name="gateway" value="cash">
                        <input type="hidden" name="currency" value="{{ currentCurrencyType() }}">
                        <div class="modal-body">
                            <div class="row">
                                <div class="primary-form-group mt-4">
                                    <div class="primary-form-group-wrap">
                                        <label class="form-label">{{ __('User') }}
                                            <span class="text-danger">*</span></label>
                                        <select name="user_id" class="primary-form-control select2">
                                            @foreach ($users as $user)
                                                <option value="{{ $user->id }}">
                                                    {{ $user->name }}({{ $user->email }})</option>
                                            @endforeach
                                        </select>
                                    </div>
                                </div>
                                <div class="primary-form-group mt-4">
                                    <div class="primary-form-group-wrap">
                                        <label class="form-label">{{ __('Package') }}
                                            <span class="text-danger">*</span></label>
                                        <select name="package_id" class="primary-form-control">
                                            @foreach ($packages as $package)
                                                <option value="{{ $package->id }}">{{ $package->name }}</option>
                                            @endforeach
                                        </select>
                                    </div>
                                </div>
                                <div class="primary-form-group mt-4">
                                    <div class="primary-form-group-wrap">
                                        <label class="form-label">{{ __('Duration Type') }}
                                            <span class="text-danger">*</span></label>
                                        <select name="duration_type" class="primary-form-control">
                                            <option value="1">{{ __('Monthly') }}</option>
                                            <option value="2">{{ __('Yearly') }}</option>
                                        </select>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="modal-footer border-0 pt-0">
                            <button type="submit"
                                class="m-0 fs-15 border-0 fw-500 lh-25 text-white py-10 px-26 bg-7f56d9 bd-ra-12">{{ __('Assing') }}</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    @endif
    <input type="hidden" id="packagesUserRoute" value="{{ route('admin.packages.user') }}">
@endsection

@push('script')
    <script src="{{ asset('admin/custom/js/package.js') }}"></script>
@endpush
