<?php

namespace App\Http\Services\Saas;

use App\Models\FileManager;
use App\Models\FrontendSection;
use App\Traits\ResponseTrait;
use Exception;
use Illuminate\Support\Facades\DB;

class FrontendService
{
    use ResponseTrait;

    public function frontendSettingList()
    {
        $frontendSection = FrontendSection::query();
        return datatables($frontendSection)
            ->addIndexColumn()
            ->addColumn('status', function ($data) {
                if ($data->status == STATUS_ACTIVE) {
                    return '<span class="d-inline-block py-6 px-10 bd-ra-6 fs-14 fw-500 lh-16 text-0fa958 bg-0fa958-10">' . __("Active") . '</span>';
                } else {
                    return '<span class="d-inline-block py-6 px-10 bd-ra-6 fs-14 fw-500 lh-16 text-ea4335 bg-ea4335-10">' . __("Deactivate") . '</span>';
                }
            })
            ->addColumn('image', function ($data) {
                return '<img src="' . getFileUrl($data->image) . '" alt="icon" class="rounded avatar-xs tbl-user-image w-50 h-50">';
            })
            ->addColumn('action', function ($data) {
                return '<div class="action__buttons d-flex justify-content-center">
                    <button type="button" class="btn p-1 tbl-action-btn edit text-end"
                    onclick="getEditModal(\'' . route('admin.frontend-setting.section.info', $data->id) . '\'' . ', \'#edit-modal\')" type="button" class="btn p-1 tbl-action-btn edit text-end" data-id="' . $data->id . '" title="' . __('Edit') . '"><i class="fa-regular fa-pen-to-square"></i></button>
                </div>';
            })
            ->rawColumns(['status', 'image', 'action'])
            ->make(true);
    }

    public function frontendSettingUpdate($request)
    {
        DB::beginTransaction();
        try {
            $section = FrontendSection::findOrFail($request->id);
            $section->page_title = $request->page_title ?? '';
            $section->title = $request->title ?? '';
            $section->description = $request->description;
            $section->status = $request->status;
            if ($request->hasFile('image')) {
                $new_file = new FileManager();
                $uploaded = $new_file->upload('frontend-section', $request->image);
                $section->image = $uploaded->id;
            }
            if ($request->hasFile('banner_image')) {
                $new_file = new FileManager();
                $uploaded = $new_file->upload('frontend-section', $request->banner_image);
                $section->banner_image = $uploaded->id;
            }
            $section->save();
            DB::commit();
            $message = getMessage(UPDATED_SUCCESSFULLY);
            return $this->success([], $message);
        } catch (Exception $e) {
            DB::rollBack();
            $message = getErrorMessage($e, $e->getMessage());
            return $this->error([], $message);
        }
    }
    public function getHomeFrontendSection(){
        return FrontendSection::all();
    }

}
