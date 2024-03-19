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
                                        <i class="fa fa-plus"></i> {{ __('Add Testimonial') }}
                                    </button>
                                </div>
                            </div>
                            <input type="hidden" id="testimonial-area"
                                   value="{{ route('admin.frontend-setting.testimonial.index') }}">
                            <div class="table-responsive zTable-responsive">
                                <table class="table zTable" id="testimonialDataTable">
                                    <thead>
                                    <tr>
                                        <th>
                                            <div>{{ __('Name') }}</div>
                                        </th>
                                        <th>
                                            <div>{{ __('Image') }}</div>
                                        </th>
                                        <th>
                                            <div>{{ __('Designation') }}</div>
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


    <!-- Add Modal section start -->
    <div class="modal fade" id="add-modal" aria-hidden="true" tabindex="-1">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-header p-20 border-0 pb-0">
                    <h5 class="modal-title fs-18 fw-600 lh-24 text-1b1c17">{{ __('Add Testimonial') }}</h5>
                    <button type="button" class="w-30 h-30 rounded-circle bd-one bd-c-e4e6eb p-0 bg-transparent"
                            data-bs-dismiss="modal" aria-label="Close"><i class="fa-solid fa-times"></i></button>
                </div>
                <form class="ajax reset" action="{{route('admin.frontend-setting.testimonial.store')}}" method="post"
                      data-handler="commonResponseForModal" enctype="multipart/form-data">
                    @csrf
                    <div class="modal-body">
                        <div class="row">
                            <div class="primary-form-group">
                                <div class="primary-form-group-wrap mt-4">
                                    <label for="name" class="form-label">{{ __('Name') }} <span
                                            class="text-danger">*</span></label>
                                    <input type="text" name="name" id="name"
                                           placeholder="{{ __('Type Name') }}" class="primary-form-control">
                                </div>
                            </div>
                            <div class="primary-form-group">
                                <div class="primary-form-group-wrap mt-4">
                                    <label for="designation" class="form-label">{{ __('Designation') }} <span
                                            class="text-danger">*</span></label>
                                    <textarea class="primary-form-control" name="designation" rows="6"
                                              placeholder="{{__('Type Designation')}}"></textarea>
                                </div>
                            </div>
                            <div class="primary-form-group">
                                <div class="primary-form-group-wrap mt-4">
                                    <label for="designation" class="form-label">{{ __('Comment') }} <span
                                            class="text-danger">*</span></label>
                                    <textarea class="primary-form-control" name="comment" rows="6"
                                              placeholder="{{__('Type Comment')}}"></textarea>
                                </div>
                            </div>
                            <div class="primary-form-group">
                                <div class="primary-form-group-wrap mt-4">
                                    <label for="currency_placement" class="form-label">{{ __('Status') }}
                                        <span class="text-danger">*</span></label>
                                    <select class="primary-form-control sf-select-without-search" id="eventType"
                                            name="status">
                                        <option value="">--{{ __('Select Status') }}--</option>
                                        <option value="1">{{ __('Active') }}</option>
                                        <option value="0">{{ __('Deactivate') }}</option>
                                    </select>
                                </div>
                            </div>
                            <div class="col-12">
                                <div class="primary-form-group">
                                    <div class="primary-form-group-wrap mt-4 zImage-upload-details mw-100">
                                        <div class="zImage-inside">
                                            <div class="d-flex pb-12"><img
                                                    src="{{ asset('assets/images/icon/upload-img-1.svg') }}"
                                                    alt=""/></div>
                                            <p class="fs-15 fw-500 lh-16 text-1b1c17">{{ __('Drag & drop files here') }}</p>
                                        </div>
                                        <label for="zImageUpload" class="form-label">{{ __('Image') }} <span
                                                class="text-mime-type">{{__('(jpeg,png,jpg,svg,webp)')}}</span> <span
                                                class="text-danger">*</span></label>
                                        <div class="upload-img-box">
                                            <img src=""/>
                                            <input type="file" name="image" id="flag" accept="image/*"
                                                   onchange="previewFile(this)"/>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer border-0 pt-0">
                        <button type="submit"
                                class="m-0 fs-15 border-0 fw-500 lh-25 text-white py-10 px-26 bg-7f56d9 bd-ra-12">{{ __('Save') }}</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
    <!-- Add Modal section end -->
    <div class="modal fade" id="edit-modal" aria-hidden="true" tabindex="-1">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">

            </div>
        </div>
    </div>
    <!-- Edit Modal section end -->
@endsection
@push('script')
    <script src="{{asset('admin/custom/js/testimonial.js')}}"></script>
@endpush
