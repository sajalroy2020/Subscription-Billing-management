<div class="modal-header p-20 border-0 pb-0">
    <h5 class="modal-title fs-18 fw-600 lh-24 text-1b1c17">{{ __('Section Update') }}</h5>
    <button type="button" class="w-30 h-30 rounded-circle bd-one bd-c-e4e6eb p-0 bg-transparent" data-bs-dismiss="modal"
            aria-label="Close"><i class="fa-solid fa-times"></i></button>
</div>
<form class="ajax reset" action="{{route('admin.frontend-setting.testimonial.update',$testimonial->id)}}" method="post"
      data-handler="commonResponseForModal">
    @csrf
    <input name="id" type="hidden" value="{{ $testimonial->id }}">
    <div class="modal-body">
        <div class="row rg-10">
            <div class="col-12">
                <div class="primary-form-group">
                    <div class="primary-form-group-wrap mt-4">
                        <label for="currentPassword" class="form-label">{{ __('Name') }} <span
                                class="text-danger">*</span></label>
                        <input type="text" class="primary-form-control" name="name"
                               value="{{ $testimonial->name }}" required placeholder="{{ __('Type Name') }}">
                    </div>
                </div>
            </div>
            <div class="col-12">
                <div class="primary-form-group">
                    <div class="primary-form-group-wrap mt-4">
                        <label for="currentPassword" class="form-label">{{ __('Designation') }} <span
                                class="text-danger">*</span></label>
                        <textarea class="primary-form-control" name="designation" rows="6"
                                  placeholder="Description">{{ $testimonial->designation }}</textarea>
                    </div>
                </div>
            </div>
            <div class="col-12">
                <div class="primary-form-group">
                    <div class="primary-form-group-wrap mt-4">
                        <label for="currentPassword" class="form-label">{{ __('Comment') }} <span
                                class="text-danger">*</span></label>
                        <textarea class="primary-form-control" name="comment" rows="6"
                                  placeholder="Type Comment">{{ $testimonial->comment }}</textarea>
                    </div>
                </div>
            </div>
            <div class="col-12">
                <div class="primary-form-group">
                    <div class="primary-form-group-wrap mt-4">
                        <label for="iso_code" class="form-label">{{ __('Status') }} <span
                                class="text-danger">*</span></label>
                        <select name="status" class="sf-select-without-search primary-form-control">
                            <option {{ $testimonial->status == 1 ? 'selected' : '' }} value="1">{{ __('Active') }}
                            <option {{ $testimonial->status == 0 ? 'selected' : '' }} value="0">{{ __('Deactivate') }}
                        </select>
                    </div>
                </div>
            </div>
            <div class="col-12">
                <div class="primary-form-group">
                    <div class="primary-form-group-wrap mt-4 zImage-upload-details mw-100">
                        <div class="zImage-inside">
                            <div class="d-flex pb-12"><img src="{{ asset('assets/images/icon/upload-img-1.svg') }}"
                                                           alt=""/></div>
                            <p class="fs-15 fw-500 lh-16 text-1b1c17">{{ __('Drag & drop files here') }}</p>
                        </div>
                        <label for="zImageUpload" class="form-label">{{ __('Image') }} <span
                                class="text-mime-type">{{__('(jpeg,png,jpg,svg,webp)')}}</span> <span
                                class="text-danger">*</span></label>
                        <div class="upload-img-box">
                            <img src="{{ getFileUrl($testimonial->image) }}"/>
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
                class="m-0 fs-15 fw-500 lh-25 text-white py-10 px-26 bg-7f56d9 bd-ra-12 border-0">{{ __('Update') }}</button>
    </div>
</form>

