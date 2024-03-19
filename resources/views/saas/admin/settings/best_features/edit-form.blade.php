<div class="modal-header p-20 border-0 pb-0">
    <h5 class="modal-title fs-18 fw-600 lh-24 text-1b1c17">{{ __('Update features') }}</h5>
    <button type="button" class="w-30 h-30 rounded-circle bd-one bd-c-e4e6eb p-0 bg-transparent" data-bs-dismiss="modal"
        aria-label="Close"><i class="fa-solid fa-times"></i></button>
</div>
<form class="ajax reset" action="{{ route('admin.frontend-setting.best-features.store') }}" method="post"
    data-handler="commonResponseForModal">
    @csrf
    <div class="modal-body">
        <div class="row rg-10">
            <input type="hidden" value="{{$features->id}}" name="id">
            <div class="col-12">
                <div class="primary-form-group">
                    <div class="primary-form-group-wrap">
                        <label for="currentPassword" class="form-label">{{ __('Name') }} <span
                                class="text-danger">*</span></label>
                        <input type="text" class="primary-form-control" name="name"
                            placeholder="{{ __('name') }}" value="{{$features->name}}">
                    </div>
                </div>
            </div>
            <div class="col-12">
                <div class="primary-form-group">
                    <div class="primary-form-group-wrap">
                        <label for="currentPassword" class="form-label">{{ __('Title') }} <span
                                class="text-danger">*</span></label>
                        <input type="text" class="primary-form-control" name="title"
                            placeholder="{{ __('title') }}" value="{{$features->title}}">
                    </div>
                </div>
            </div>
            <div class="col-12">
                <div class="primary-form-group">
                    <div class="primary-form-group-wrap">
                        <label for="currentPassword" class="form-label">{{ __('Description') }} <span
                                class="text-danger">*</span></label>
                        <textarea class="primary-form-control" name="description" id="" cols="30" rows="6" placeholder="{{ __('description') }}">{{$features->description}}</textarea>
                    </div>
                </div>
            </div>
            <div class="col-12">
                <div class="primary-form-group pb-12">
                    <div class="primary-form-group-wrap">
                        <label for="rtl" class="form-label">{{ __('Status') }} <span
                            class="text-danger">*</span></label>
                        <select class="sf-select-without-search" name="status">
                            <option {{ $features->status == ACTIVE ? 'selected' : '' }} value="1">{{ __('Active') }}
                            </option>
                            <option {{ $features->status == DEACTIVATE ? 'selected' : '' }} value="0">{{ __('Deactivate') }}
                            </option>
                        </select>
                    </div>
                </div>
            </div>
            <div class="col-12">
                <div class="primary-form-group">
                    <div class="primary-form-group-wrap zImage-upload-details mw-100">
                        <div class="zImage-inside">
                            <div class="d-flex pb-12"><img
                                    src="{{ asset('assets/images/icon/upload-img-1.svg') }}"
                                    alt="" />
                            </div>
                            <p class="fs-15 fw-500 lh-16 text-1b1c17">{{ __('Drag & drop files here') }}
                            </p>
                        </div>
                        <label for="zImageUpload" class="form-label">{{ __('Image') }} <span
                               class="text-danger">*</span></label>
                        <div class="upload-img-box">
                            <img src="{{ getFileUrl($features->image) }}" />
                            <input type="file" name="image" id="image" accept="image/*"
                                onchange="previewFile(this)" />
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
