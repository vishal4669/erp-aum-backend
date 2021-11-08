<?php

namespace App\Helpers;

use App\Models\TrainerCafeBooking;
use Illuminate\Http\Response;
use JWTAuth;
use Illuminate\Support\Str;

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

        for($i=0; $i<=6; $i++){            
            $j = $i + 1;
            $year_data = date('Y', strtotime('-'.$j.' year')).'-'.date('y', strtotime('-'.$i.' year'));
            array_push($years_array, $year_data);
        }   

        return $years_array;
    }

    /**
     * It will generate the random string as per the given count parameter default it will be 5
     * 
    */
    public static function generateRandomString($count = 5){
        $random_string = Str::random($count);   

        return $random_string;
    }

    public static function getUserData(){
        $userdata = array();

        $token = JWTAuth::parseToken();
        $userdata['selected_year'] = $token->getPayload()->get('selected_year');
        $userdata['company_id'] = $token->getPayload()->get('company_id');
        $userdata['logged_in_user_id'] = $user = JWTAuth::toUser($token)->id;

        return $userdata;
    }



}