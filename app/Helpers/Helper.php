<?php

namespace App\Helpers;

use App\Models\TrainerCafeBooking;

class Helper
{
    public static function response($message = '', $status = 200, $success_status = true, $data = [])
    {
        return json_encode(
        	array('message' => $message,
        		'status' => $status,
        		'success' => $success_status,
        		'data' => $data
        	)
        );
    }
}