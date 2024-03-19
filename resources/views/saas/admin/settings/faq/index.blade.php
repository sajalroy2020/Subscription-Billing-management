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
                        <div
                            class="email-inbox__area bg-style form-horizontal__item bg-style admin-general-settings-page">

                            <div class="d-flex flex-wrap item-title justify-content-between align-items-center mb-30">
                                <h4>{{ $pageTitle }}</h4>
                                <div>
                                    <button class="fs-15 fw-500 lh-25 text-white py-10 px-26 bg-7f56d9 bd-ra-12 border-0"
                                        type="button" data-bs-toggle="modal" data-bs-target="#add-modal">
                                        <i class="fa fa-plus"></i> {{ __('Add Faq') }}
                                    </button>
                                </div>
                            </div>

                            <input type="hidden" id="faq_setting" value="{{ route('admin.frontend-setting.faq.index') }}">
                            <div class="table-responsive zTable-responsive">
                                <table class="table zTable" id="faqDataTable">
                                    <thead>
                                        <tr>
                                            <th>
                                                <div>{{ __('Title') }}</div>
                                            </th>
                                            <th>
                                                <div>{{ __('Description') }}</div>
                                            </th>
                                            <th>
                                                <div>{{ __('Status') }}</div>
                                            </th>
                                            <th>
                                                <div class="text-end">{{ __('Action') }}</div>
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

    <!-- Add Modal section start -->
    <div class="modal fade" id="add-modal" aria-hidden="true" tabindex="-1">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-header p-20 border-0 pb-0">
                    <h5 class="modal-title fs-18 fw-600 lh-24 text-1b1c17">{{ __($pageTitle) }}</h5>
                    <button type="button" class="w-30 h-30 rounded-circle bd-one bd-c-e4e6eb p-0 bg-transparent"
                        data-bs-dismiss="modal" aria-label="Close"><i class="fa-solid fa-times"></i></button>
                </div>
                <form class="ajax reset" action="{{ route('admin.frontend-setting.faq.store') }}" method="post"
                    data-handler="commonResponseForModal" enctype="multipart/form-data">
                    @csrf
                    <div class="modal-body">
                        <div class="row rg-25">

                            <div class="col-12">
                                <div class="primary-form-group">
                                    <div class="primary-form-group-wrap">
                                        <label for="currentPassword" class="form-label">{{ __('Title') }} <span
                                                class="text-danger">*</span></label>
                                        <input type="text" class="primary-form-control" name="title"
                                            placeholder="{{ __('title') }}">
                                    </div>
                                </div>
                            </div>
                            <div class="col-12">
                                <div class="primary-form-group">
                                    <div class="primary-form-group-wrap">
                                        <label for="currentPassword" class="form-label">{{ __('Description') }} <span
                                                class="text-danger">*</span></label>
                                        <textarea class="primary-form-control" name="description" id="" cols="30" rows="6" placeholder="{{ __('description') }}"></textarea>
                                    </div>
                                </div>
                            </div>

                        </div>
                    </div>
                    <div class="modal-footer border-0 pt-0">
                        <button type="submit" class="m-0 fs-15 border-0 fw-500 lh-25 text-white py-10 px-26 bg-7f56d9 bd-ra-12">{{ __('Save') }}</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
    <!-- Add Modal section end -->

     <!-- Edit Modal section start -->
     <div class="modal fade" id="edit-modal" aria-hidden="true" tabindex="-1">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">

            </div>
        </div>
    </div>
    <!-- Edit Modal section end -->

@endsection
@push('script')
    <script src="{{asset('admin/custom/js/faq.js')}}"></script>
@endpush
