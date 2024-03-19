<?php

namespace App\Http\Services;

use App\Models\FileManager;
use App\Models\User;
use App\Traits\ResponseTrait;
use Carbon\Carbon;
use Exception;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;

class UserService
{
    use ResponseTrait;

    public function userDetails($id)
    {
        return User::find($id);
    }

    public function userData($id = NULL)
    {
        $id = is_null($id) ? auth()->id() : $id;
        return User::where('id', $id)->first();
    }

    public function smsSend($request)
    {
        try {
            $user = User::where('id', auth()->id())->first();
            //check already send otp and this validate
            $currentDateTime = Carbon::now()->format('Y-m-d H:i:s');
            if ($user->otp_expiry && $currentDateTime < $user->otp_expiry) {
                return $this->error([], __("An otp has already been sent to your phone number."));
            }
            //send new otp
            $phoneNumber = $user->mobile;
            $otp = rand(111111, 999999);
            $smsText = __("Your") . " " . getOption('app_name') . " " . __("verification code is") . ": " . $otp;
            $sendSmsStatus = TwilioService::sendSms($phoneNumber, $otp, $smsText);
            if ($sendSmsStatus == true) {
                $dateTime = Carbon::now()->addMinute(5);
                $expiryTime = $dateTime->format('Y-m-d H:i:s');
                //save otp and expiry time in user table
                $user->otp = $otp;
                $user->otp_expiry = $expiryTime;
                $user->mobile = $phoneNumber;
                $user->save();
                return $this->success([], __("OTP has been sent to your phone number,please check"));
            } else {
                return $this->error([], __("Something went wrong,please check your credentials"));
            }
        } catch (Exception $exception) {
            return $this->error([], getMessage(SOMETHING_WENT_WRONG));
        }
    }

    public function smsReSend()
    {

        try {
            $user = User::where('id', auth()->id())->first();
            //check already send otp and this validate
            $currentDateTime = Carbon::now()->format('Y-m-d H:i:s');
            if ($user->otp_expiry && $currentDateTime < $user->otp_expiry) {
                return $this->error([], __("An otp has already been sent to your phone number."));
            }
            //send new otp
            $phoneNumber = $user->mobile;
            $otp = rand(111111, 999999);
            $smsText = __("Your") . " " . getOption('app_name') . " " . __("verification code is") . ": " . $otp;
            $sendSmsStatus = TwilioService::sendSms($phoneNumber, $otp, $smsText);
            if ($sendSmsStatus == true) {
                $dateTime = Carbon::now()->addMinute(5);
                $expiryTime = $dateTime->format('Y-m-d H:i:s');
                //save otp and expiry time in user table
                $user->otp = $otp;
                $user->otp_expiry = $expiryTime;
                $user->save();
                return $this->success([], __("OTP has been re-sent to your phone number,please check"));
            } else {
                return $this->error([], __("Something went wrong,please check your phone number"));
            }
        } catch (Exception $exception) {
            return $this->error([], getMessage(SOMETHING_WENT_WRONG));
        }
    }

    public function smsVerify($request)
    {

        $otp = $request->opt_field[0] . $request->opt_field[1] . $request->opt_field[2] . $request->opt_field[3] . $request->opt_field[4] . $request->opt_field[5];
        $user = User::where('id', auth()->id())->first();
        //check otp validity
        $currentDateTime = Carbon::now()->format('Y-m-d H:i:s');
        if ($user->otp_expiry && $currentDateTime < $user->otp_expiry) {
            if ($user->otp == $otp) {
                $user->phone_verification_status = 1;
                $user->save();
                return $this->success([], __("OTP verify successful"));
            } else {
                return $this->error([], __("OTP is Invalid!"));
            }
        } else {
            return $this->error([], __("OTP time expiry!"));
        }
    }

    public function profileUpdate($request)
    {
        $authUser = auth()->user();
        DB::beginTransaction();
        try {
            $userData = [
                'name' => $request['name'],
                'email' => $request['email'],
                'mobile' => $request['mobile'],
                'currency' => $request['currency'],
                'country' => $request['country'],
                'city' => $request['city'],
                'zip_code' => $request['zip_code'],
                'address' => $request['address'],
                'company_name' => $request['company_name'],
                'company_designation' => $request['company_designation'],
                'company_country' => $request['company_country'],
                'company_city' => $request['company_city'],
                'company_zip_code' => $request['company_zip_code'],
                'company_address' => $request['company_address'],
            ];
            $pass1 = $request->get('pass1','');
            $pass2 = $request->get('pass2','');
            if($pass1 != '' && $pass2 != ''){
                if($pass1 != $pass2){
                    DB::rollBack();
                    return $this->error([], __("Password does not Match"));
                }else{
                    $authUser->password = Hash::make($request->pass1);
                }
            }
            if ($request->hasFile('image')) {
                $existFile = FileManager::where('id', $authUser->image)->first();
                if ($existFile) {
                    $existFile->removeFile();
                    $uploaded = $existFile->upload('User', $request->image, '', $existFile->id);
                } else {
                    $newFile = new FileManager();
                    $uploaded = $newFile->upload('User', $request->image);
                }
                if ($uploaded) {
                    $userData['image'] = $uploaded->id;
                } else {
                    throw new Exception(__('Image Not Uploaded.'));
                }
            }

            if ($request->hasFile('company_logo')) {
                $existFile = FileManager::where('id', $authUser->company_logo)->first();
                if ($existFile) {
                    $existFile->removeFile();
                    $uploaded = $existFile->upload('User', $request->company_logo, '', $existFile->id);
                } else {
                    $newFile = new FileManager();
                    $uploaded = $newFile->upload('User', $request->company_logo);
                }
                if ($uploaded) {
                    $userData['company_logo'] = $uploaded->id;
                } else {
                    throw new Exception(__('Image Not Uploaded.'));
                }
            }

            $authUser->update($userData);
            DB::commit();
            return $this->success([], getMessage(__(UPDATED_SUCCESSFULLY)));
        } catch (Exception $e) {
            DB::rollBack();
            return $this->error([], getMessage(__(SOMETHING_WENT_WRONG)));
        }
    }

    public function addInstitution(Request $request)
    {
        $authUser = auth()->user();
        $data = $request->validate([
            "passing_year" => 'bail|required|max:195',
            "degree" => 'bail|required|max:195',
            "institute" => 'bail|required|max:195',
        ]);

        try {
            DB::beginTransaction();

            $authUser->institutions()->create([
                'passing_year' => $data['passing_year'],
                'degree' => $data['degree'],
                'institute' => $data['institute'],
            ]);

            DB::commit();
            return $this->success([], getMessage(CREATED_SUCCESSFULLY));
        } catch (Exception $e) {
            DB::rollBack();
            return $this->error([], getMessage(SOMETHING_WENT_WRONG));
        }
    }

    public function changePasswordUpdate(Request $request)
    {

        $request->validate([
            'current_password' => 'required',
            'password' => 'bail|required|min:6|confirmed',
        ]);

        try {
            $hashedPassword = Auth::user()->password;

            if (Hash::check($request->current_password, $hashedPassword)) {
                DB::beginTransaction();
                $user = User::find(Auth::id());
                $user->password = Hash::make($request->password);
                $user->save();
                DB::commit();
                return $this->success([], getMessage(UPDATED_SUCCESSFULLY));
            } else {
                return $this->error([], "Current password dose not match!");
            }
        } catch (Exception $e) {
            return $this->error([], getMessage(SOMETHING_WENT_WRONG));
        }
    }

    public function settingUpdate(Request $request)
    {
        try {
            auth()->user()->update([$request->key => $request->value]);
            return $this->success([], getMessage(UPDATED_SUCCESSFULLY));
        } catch (Exception $e) {
            return $this->error([], getMessage(SOMETHING_WENT_WRONG));
        }
    }

    public function customerListAll()
    {
        $user = User::leftJoin('orders', 'users.id', '=', 'orders.customer_id')
            ->leftJoin('gateways', 'orders.gateway_id', '=', 'gateways.id')
            ->leftJoin('user_details', 'users.id', '=', 'user_details.user_id')
            ->select(
                'users.name as customer_name',
                'gateways.title as gateway_name',
                'users.email as customer_email',
                'users.created_at as customer_create_date',
                'user_details.billing_country',
                DB::raw('SUM(orders.total) as total_revenue'),
                'users.id as customer_id'
            )
            ->where('orders.user_id', auth()->id())
            ->where('users.role', USER_ROLE_CUSTOMER)
            ->groupBy('users.id');


        return datatables($user)
            ->addIndexColumn()
            ->addColumn('name', function ($data) {
                return '<h4 class="fs-14 fw-400 lh-24 text-para-text">' . htmlspecialchars($data->customer_name) . ' </h4>';
            })
            ->addColumn('email', function ($data) {
                return $data->customer_email ?? __("N/A");
            })
            ->addColumn('created_at', function ($data) {
                return date('d-m-Y', strtotime($data->customer_create_date));
            })
            ->addColumn('revenue', function ($data) {
                return showPrice($data->total_revenue); // Display the total revenue
            })
            ->addColumn('country', function ($data) {
                return $data->billing_country ?? __("N/A");
            })
            ->addColumn('payment', function ($data) {
                return $data->gateway_name ?? __("N/A");
            })
            ->addColumn('action', function ($data) {
                return '<ul class="d-flex align-items-center cg-5 justify-content-end">
                        <li class="d-flex gap-2">
                            <button onclick="deleteItem(\'' . route('user.customer.delete', $data->customer_id) . '\', \'customersTable\')" class="border-0 p-0 bg-transparent flex-shrink-0 d-none" title="Delete">
                                <img src="' . asset('assets/images/icon/delete-1.svg') . '" alt="delete">
                            </button>
                            <a href="' . route('user.customer.details', $data->customer_id) . '" class="fs-14 fw-500 lh-17 text-main-color text-decoration-underline flex-shrink-0"><img src="' . asset('assets/images/icon/eye.svg') . '" alt="delete"></a>
                        </li>
                    </ul>';
            })
            ->rawColumns(['name', 'action'])
            ->make(true);
    }

    public function details($id)
    {
        return User::with('userDetail')->findOrFail($id);
    }

    public function delete($id)
    {
        try {
            $customer = User::where('id', $id)->firstOrFail();
            $customer->delete();
            DB::beginTransaction();
            DB::commit();
            $message = getMessage(DELETED_SUCCESSFULLY);
            return $this->success([], $message);
        } catch (\Exception $e) {
            DB::rollBack();
            $message = getErrorMessage($e, $e->getMessage());
            return $this->error([], $message);
        }
    }


}
