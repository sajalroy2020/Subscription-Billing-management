@extends('layouts.app')
@push('title')
    {{ $pageTitle }}
@endpush
@section('content')
    <div class="p-30">
        <div class="">
            <h4 class="fs-24 fw-500 lh-34 text-black pb-16">{{ __($pageTitle) }}</h4>
            <div class="row">
                <div class="col-xxl-2 col-lg-3 col-md-4 pr-0">
                    <div class="bd-c-ebedf0 bd-half bd-ra-25 bg-white h-100 p-30">
                        @include('saas.admin.partials.frontend-sidebar')
                    </div>
                </div>
                <div class="col-xxl-10 col-lg-9 col-md-8">
                    <div class="bg-white bd-half bd-c-ebedf0 bd-ra-25 p-30">
                        <div class="email-inbox__area bg-style form-horizontal__item bg-style admin-general-settings-page">
                            <div class="item-top mb-30">
                                <h4>{{ $pageTitle }}</h4>
                            </div>
                            <input type="hidden" id="frontend-section" value="{{ route('admin.frontend-setting.section.index') }}">
                            <div class="table-responsive zTable-responsive">
                                <table class="table zTable" id="frontendSectionDataTable">
                                    <thead>
                                        <tr>
                                            <th>
                                                <div>{{ __('SL') }}</div>
                                            </th>
                                            <th>
                                                <div>{{ __('Section Name') }}</div>
                                            </th>
                                            <th>
                                                <div>{{ __('Title') }}</div>
                                            </th>
                                            <th>
                                                <div>{{ __('Image') }}</div>
                                            </th>
                                            <th>
                                                <div>{{ __('Status') }}</div>
                                            </th>
                                            <th>
                                                <div class="text-center text-end">{{ __('Action') }}</div>
                                            </th>
                                        </tr>
                                    </thead>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="modal fade" id="edit-modal" aria-hidden="true" tabindex="-1">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">

            </div>
        </div>
    </div>
    <!-- Edit Modal section end -->
@endsection
@push('script')
    <script src="{{ asset('admin/custom/js/frontend_section.js') }}"></script>
@endpush
