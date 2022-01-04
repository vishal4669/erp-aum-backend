<?php

namespace App\Helpers;

use App\Models\TrainerCafeBooking;
use Illuminate\Http\Response;
use JWTAuth;
use Illuminate\Support\Str;
use Carbon\Carbon;

class Helper
{
    public static function response($message = '', $status = 200, $success_status = true, $data = [])
    {
        $response_array = array(
            //'message' => $message,
            'message' => is_array($message) ? implode(" <br> ", $message) : $message,
            'status' => $status,
            'success' => $success_status,
            'data' => $data
        );

        return response($response_array, $status);
    }

    /**
     * Function to get years list
     */
    public static function yearsList()
    {
        $years_array = array();
        $year_len = 7;
        for ($i = 0; $i <= $year_len; $i++) {
            $current_date = Carbon::now();
            $current_year = Carbon::now()->year;
            $next_year = Carbon::now()->addYear()->format('y') - $i;
            $finacial_new_year_start = \Carbon\Carbon::createFromFormat('Y-m-d', '' . $current_year . '-03-31');
            $current_date = \Carbon\Carbon::createFromFormat('Y-m-d', '' . $current_year . '-04-01');
            $result = $current_date->gt($finacial_new_year_start);
            if ($result === true) {
                $finacial_new_year = $finacial_new_year_start->format('Y');
                if ($finacial_new_year == $current_year) {
                    $current_year = Carbon::now()->year - $i;
                    $year_data = $current_year . "-" . $next_year;
                    array_push($years_array, $year_data);
                }
            } else {
                $j = $i + 1;
                $current_year = Carbon::now()->year - $j;
                $year_data = $current_year . "-" . $next_year - 1;
                array_push($years_array, $year_data);
            }
        }

        return $years_array;
    }

    /**
     * It will generate the random string as per the given count parameter default it will be 5
     * 
     */
    public static function generateRandomString($count = 5)
    {
        $random_string = Str::random($count);

        return $random_string;
    }

    public static function getUserData()
    {
        $userdata = array();

        $token = JWTAuth::parseToken();
        $userdata['selected_year'] = $token->getPayload()->get('selected_year');
        $userdata['company_id'] = $token->getPayload()->get('company_id');
        $userdata['logged_in_user_id'] = $user = JWTAuth::toUser($token)->id;

        return $userdata;
    }
}
