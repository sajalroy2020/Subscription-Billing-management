<div class="modal-header p-20 border-0 pb-0">
    <h5 class="modal-title fs-18 fw-600 lh-24 text-1b1c17">{{ __('Section Update') }}</h5>
    <button type="button" class="w-30 h-30 rounded-circle bd-one bd-c-e4e6eb p-0 bg-transparent" data-bs-dismiss="modal"
        aria-label="Close"><i class="fa-solid fa-times"></i></button>
</div>
<form class="ajax reset" action="{{ route('admin.frontend-setting.section.update') }}" method="post"
    data-handler="commonResponseForModal">
    @csrf
    <input type="hidden" name="slug" value="{{ $section->slug }}">
    <input name="id" type="hidden" value="{{ $section->id }}">
    <div class="modal-body">
        <div class="row rg-10">
            @if ($section->has_page_title == STATUS_ACTIVE)
                <div class="col-12">
                    <div class="primary-form-group">
                        <div class="primary-form-group-wrap">
                            <label for="currentPassword" class="form-label">{{ __('Page Title') }} <span
                                    class="text-danger">*</span></label>
                            <input type="text" class="primary-form-control" name="page_title"
                                value="{{ $section->page_title }}" required placeholder="{{ __('Page Title') }}">
                        </div>
                    </div>
                </div>
            @endif
            <div class="col-12">
                <div class="primary-form-group">
                    <div class="primary-form-group-wrap">
                        <label for="currentPassword" class="form-label">{{ __('Title') }} <span
                                class="text-danger">*</span></label>
                        <input type="text" class="primary-form-control" name="title" value="{{ $section->title }}"
                            required placeholder="{{ __('Title') }}">
                    </div>
                </div>
            </div>
            @if ($section->has_description == STATUS_ACTIVE)
                <div class="col-12">
                    <div class="primary-form-group">
                        <div class="primary-form-group-wrap">
                            <label for="currentPassword" class="form-label">{{ __('Description') }} <span
                                    class="text-danger">*</span></label>
                            <textarea class="primary-form-control" name="description" rows="6" placeholder="Description">{{ $section->description }}</textarea>
                        </div>
                    </div>
                </div>
            @endif
            <div class="col-12">
                <div class="primary-form-group">
                    <div class="primary-form-group-wrap">
                        <label for="iso_code" class="form-label">{{ __('Status') }} <span
                                class="text-danger">*</span></label>
                        <select name="status" class="sf-select-without-search primary-form-control">
                            <option {{ $section->status == 1 ? 'selected' : '' }} value="1">{{ __('Active') }}
                            <option {{ $section->status == 0 ? 'selected' : '' }} value="0">
                                {{ __('Deactivate') }}
                        </select>
                    </div>
                </div>
            </div>
            @if ($section->has_image == STATUS_ACTIVE)
                <div class="col-12">
                    <div class="primary-form-group">
                        <div class="primary-form-group-wrap zImage-upload-details mw-100">
                            <div class="zImage-inside">
                                <div class="d-flex pb-12"><img src="{{ asset('assets/images/icon/upload-img-1.svg') }}"
                                        alt="" /></div>
                                <p class="fs-15 fw-500 lh-16 text-1b1c17">{{ __('Drag & drop files here') }}</p>
                            </div>
                            <label for="zImageUpload" class="form-label">{{ __('Image') }} <span
                                    class="text-mime-type">{{ __('(jpeg,png,jpg,svg,webp)') }}</span> <span
                                    class="text-danger">*</span></label>
                            <div class="upload-img-box">
                                <img src="{{ getFileUrl($section->image) }}" />
                                <input type="file" name="image" id="flag" accept="image/*"
                                    onchange="previewFile(this)" />
                            </div>
                        </div>
                    </div>
                </div>
                @if ($section->has_banner_image == STATUS_ACTIVE)
                    <div class="col-12">
                        <div class="primary-form-group">
                            <div class="primary-form-group-wrap zImage-upload-details mw-100">
                                <div class="zImage-inside">
                                    <div class="d-flex pb-12"><img
                                            src="{{ asset('assets/images/icon/upload-img-1.svg') }}" alt="" />
                                    </div>
                                    <p class="fs-15 fw-500 lh-16 text-1b1c17">{{ __('Drag & drop files here') }}</p>
                                </div>
                                <label for="zImageUpload" class="form-label">{{ __('Banner Image') }} <span
                                        class="text-mime-type">{{ __('(jpeg,png,jpg,svg,webp)') }}</span> <span
                                        class="text-danger">*</span></label>
                                <div class="upload-img-box">
                                    <img src="{{ getFileUrl($section->banner_image) }}" />
                                    <input type="file" name="banner_image" id="flag" accept="banner_image/*"
                                        onchange="previewFile(this)" />
                                </div>
                            </div>
                        </div>
                    </div>
                @endif
            @endif
        </div>
    </div>
    <div class="modal-footer border-0 pt-0">
        <button type="submit"
            class="m-0 fs-15 fw-500 lh-25 text-white py-10 px-26 bg-7f56d9 bd-ra-12 border-0">{{ __('Update') }}</button>
    </div>
</form>
