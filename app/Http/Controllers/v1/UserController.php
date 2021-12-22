<?php

namespace App\Http\Controllers\v1;

use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Http\Response;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Validator;
use JWTAuth;
use Tymon\JWTAuth\Exceptions\JWTException;
use Log;
use App\Helpers\Helper;
use Auth;

class UserController extends Controller
{

    public function authenticate(Request $request)
    {
        $selected_year = $request->selected_year;
        $company_id = $request->company_id;

        $credentials = $request->only('username', 'password');
        Log::info("User Login -> " . json_encode(array('credentials' => $request->username)));
        try {

            // check for the resigned employees
            $is_resigned = User::where('username', $request->username)->pluck('is_resigned')->first();

            if ($is_resigned) {
                $res = Helper::response("You are not authorized to login into system, please contact system administrator", Response::HTTP_UNAUTHORIZED, true, []);
                Log::info("User Login -> Resigned User Try Login with Email : " . $request->username);

                return $res;
            }

            $customClaims = array('selected_year' => $selected_year, 'company_id' => $company_id, 'is_resigned' => 0);

            if (!$token = JWTAuth::claims($customClaims)->attempt($credentials)) {
                $data = array();

                $res = Helper::response("Invalid Credentials", Response::HTTP_UNAUTHORIZED, true, $data);

                Log::info("User Login -> Invalid Credentials");

                return $res;
            }
        } catch (JWTException $e) {
            $data = array();
            $res = Helper::response("Something went try again, please try again", Response::HTTP_BAD_REQUEST, false, $data);

            Log::info("User Login -> Something went try again, please try again");

            return $res;
        }

        $user = Auth::user();
        $data = array('token' => $token, 'user' => $user, 'user_login_data' => $customClaims);
        $res = Helper::response("User logged in successfully",  Response::HTTP_OK, true, $data);

        return $res;
    }

    public function register(Request $request)
    {
        Log::info("User Registration initiated");

        try {

            $validator = Validator::make($request->all(), [
                'first_name' => 'required|string|max:255',
                'middle_name' => 'required|string|max:255',
                'last_name' => 'required|string|max:255',
                'email' => 'required|string|email|max:255|unique:users',
                'password' => 'required|string|min:6|confirmed',
            ]);

            if ($validator->fails()) {
                return response()->json($validator->errors()->all(), 400);
            }

            $user = User::create([
                'first_name' => $request->get('first_name'),
                'middle_name' => $request->get('middle_name'),
                'last_name' => $request->get('last_name'),
                'email' => $request->get('email'),
                'username' => $request->get('email'),
                'password' => Hash::make($request->get('password')),
                'blood_group' => $request->get('blood_group'),
                'gender' => $request->get('gender'),
                'birth_date' => $request->get('birth_date'),
                'marital_status' => $request->get('marital_status'),
                'machine_code' => $request->get('machine_code'),
                'phone' => $request->get('phone'),
                'mobile' => $request->get('mobile'),
                'notes' => $request->get('notes'),
                'attendance' => $request->get('attendance'),
                'signature' => $request->get('signature'),
                'booking_action' => $request->get('booking_action'),
                'booking_sms' => $request->get('booking_sms'),
                'booking_email' => $request->get('booking_email'),
                'booking_copy' => $request->get('booking_copy'),
                'nationality' => $request->get('nationality'),
                'religion' => $request->get('religion'),
                'reporting_authority' => $request->get('reporting_authority'),
                'deposit' => $request->get('deposit'),
                'booking_ratetiny' => $request->get('booking_ratetiny'),
                'postal_address' => $request->get('postal_address'),
                'emergency_contact_name' => $request->get('emergency_contact_name'),
                'emergency_contact_number' => $request->get('emergency_contact_number'),
                'current_year' => $request->get('current_year'),
                'copied_from_year' => $request->get('copied_from_year')
            ]);

            Log::info("User Registration details" . json_encode(array('user' => $user)));

            $token = JWTAuth::fromUser($user);

            Log::info("User Registration -> Token created" . json_encode(array('token' => $token)));

            $data = array('token' => $token, 'user' => $user);
            $res = Helper::response(trans('auth.logged_in'), 201, true, $data);
            return $res;
        } catch (Exception $e) {
            $data = array();
            return Helper::response(trans("message.something_went_wrong"), $e->getStatusCode(), false, $data);
        }
    }

    public function getAuthenticatedUser()
    {
        try {
            if (!$user = JWTAuth::parseToken()->authenticate()) {
                $data = array();
                $res = Helper::response("User not found", 404, false, $data);
                return $res;
            }
        } catch (Tymon\JWTAuth\Exceptions\TokenExpiredException $e) {
            $data = array();
            $res = Helper::response(trans('auth.expired'), $e->getStatusCode(), false, $data);
            return $res;
        } catch (Tymon\JWTAuth\Exceptions\TokenInvalidException $e) {

            $data = array();
            $res = Helper::response(trans('auth.invalid'), $e->getStatusCode(), false, $data);
            return $res;
        } catch (Tymon\JWTAuth\Exceptions\JWTException $e) {

            $data = array();
            $res = Helper::response(trans('auth.expired'), $e->getStatusCode(), false, $data);
            return $res;
        }

        $data = array('user' => $user);
        $res = Helper::response("User retrived successfully", Response::HTTP_OK, true, $data);
        return $res;
    }

    public function logout(Request $request)
    {

        $token = $request->header('Authorization');

        try {
            JWTAuth::parseToken()->invalidate($token);

            $data = array();
            $res = Helper::response(trans('auth.logged_out'), Response::HTTP_OK, true, $data);
            return $res;
        } catch (TokenExpiredException $exception) {

            $data = array();
            $res = Helper::response(trans('auth.expired'), Response::HTTP_UNAUTHORIZED, false, $data);
            return $res;
        } catch (TokenInvalidException $exception) {

            $data = array();
            $res = Helper::response(trans('auth.invalid'), Response::HTTP_UNAUTHORIZED, false, $data);
            return $res;
        } catch (JWTException $exception) {

            $data = array();
            $res = Helper::response(trans('auth.missing'), Response::HTTP_UNAUTHORIZED, false, $data);
            return $res;
        }
    }
}
