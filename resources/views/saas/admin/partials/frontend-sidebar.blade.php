<div class="email__sidebar bg-style">
    <div class="sidebar__item">
        <ul class="d-flex flex-column rg-15 sidebar__mail__nav">
            <li>
                <a href="{{ route('admin.frontend-setting.index') }}"
                   class="align-items-center flex list-item list-item">
                    <span class="fa fa-gear fs-14 text-707070"></span>
                    <span class="font-bold fs-14 hover-color-one text-1b1c17 {{ @$sectionSettingsActiveClass }}">{{__('Frontend Setting')}}</span>
                </a>
            </li>
            <li>
                <a href="{{ route('admin.frontend-setting.section.index') }}"
                   class="align-items-center flex list-item list-item">
                    <span class="fa fa-gear fs-14 text-707070"></span>
                    <span class="font-bold fs-14 hover-color-one text-1b1c17 {{ @$subSectionSettingsActiveClass }}">{{__('Section Setting')}}</span>
                </a>
            </li>
            <li>
                <a href="{{ route('admin.frontend-setting.features.index') }}"
                   class="align-items-center flex list-item list-item">
                    <span class="fa fa-gear fs-14 text-707070"></span>
                    <span class="font-bold fs-14 hover-color-one text-1b1c17 {{ @$featuresActiveClass }}">{{__('Features')}}</span>
                </a>
            </li>
            <li>
                <a href="{{ route('admin.frontend-setting.best-features.index') }}"
                   class="align-items-center flex list-item list-item">
                    <span class="fa fa-gear fs-14 text-707070"></span>
                    <span class="font-bold fs-14 hover-color-one text-1b1c17 {{ @$bestFeaturesActiveClass }}">{{__('Best Features')}}</span>
                </a>
            </li>
            <li>
                <a href="{{ route('admin.frontend-setting.faq.index') }}"
                   class="align-items-center flex list-item list-item">
                    <span class="fa fa-gear fs-14 text-707070"></span>
                    <span class="font-bold fs-14 hover-color-one text-1b1c17 {{ @$faqActiveClass }}">{{__('Faq')}}</span>
                </a>
            </li>
            <li>
                <a href="{{ route('admin.frontend-setting.testimonial.index') }}"
                   class="align-items-center flex list-item list-item">
                    <span class="fa fa-gear fs-14 text-707070"></span>
                    <span class="font-bold fs-14 hover-color-one text-1b1c17 {{ @$subTestimonialActiveClass }}">{{__('Testimonial')}}</span>
                </a>
            </li>
        </ul>
    </div>
</div>
