<?php

namespace App\Http\Controllers\v1;

use Illuminate\Http\Request;
use Illuminate\Http\Response;
use App\Http\Controllers\Controller;
use App\Models\Company;
use App\Models\State;
use App\Models\Country;
use App\Helpers\Helper;
use Log;
use App\Models\Customer;
use App\Models\Employee;

use function Symfony\Component\VarDumper\Dumper\esc;

class CommonController extends Controller
{
    /**
     * clear cache
     *
     */
    public function clearRoute()
    {
        \Artisan::call('cache:clear');
        // \Artisan::call('key:generate');
        \Artisan::call('route:cache');
        \Artisan::call('config:clear');
        \Artisan::call('view:clear');
        // \Artisan::call('composer update vendor/package');
        return Helper::response("Cache is cleared", Response::HTTP_OK, true);
    }
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */

    public function yearsList()
    {
        try {
            $data = Helper::yearsList();
            // dd($data);
            return Helper::response("Years List Shown Successfully", Response::HTTP_OK, true, $data);
        } catch (Exception $e) {
            $data = array();
            return Helper::response(trans("message.something_went_wrong"), $e->getStatusCode(), false, $data);
        }
    }

    public function listCompanies(Request $request)
    {
        try {
            $data = Company::where('is_active', 1)->get();
            return Helper::response("All Companies List Shown Successfully", Response::HTTP_OK, true, $data);
        } catch (Exception $e) {
            $data = array();
            return Helper::response(trans("message.something_went_wrong"), $e->getStatusCode(), false, $data);
        }
    }

    public function listStates(Request $request)
    {
        try {
            $data = State::leftjoin('mst_countries', 'mst_countries.id', '=', 'mst_states.mst_countries_id')
                ->where('mst_states.is_active', 1)
                ->select('mst_states.id', 'mst_states.state_name', 'mst_countries.country_name')
                ->get();
            return Helper::response("All States List Shown Successfully", Response::HTTP_OK, true, $data);
        } catch (Exception $e) {
            $data = array();
            return Helper::response(trans("message.something_went_wrong"), $e->getStatusCode(), false, $data);
        }
    }

    public function listCountries(Request $request)
    {
        try {
            $data = Country::where('is_active', 1)->get();
            return Helper::response("All Countries List Shown Successfully", Response::HTTP_OK, true, $data);
        } catch (Exception $e) {
            $data = array();
            return Helper::response(trans("message.something_went_wrong"), $e->getStatusCode(), false, $data);
        }
    }

    public function countriesWiseStates(Request $request, $id)
    {
        try {
            $data = Country::where('id', $id)->with('country_wise_states')->get();
            return Helper::response("All Countries List Shown Successfully", Response::HTTP_OK, true, $data);
        } catch (Exception $e) {
            $data = array();
            return Helper::response(trans("message.something_went_wrong"), $e->getStatusCode(), false, $data);
        }
    }

    /**
     * check username is uniq or not from employee or customer for their username
     * 
     */
    public function uniq_username($username = '', $id = '', $role = '')
    {
        if ($id == '' || $id == null) {
            // dd("hii");
            $check_employee = Employee::where("username", $username)->get();
            $check_customer = Customer::where("user_name", $username)->get();
            if ($check_employee->isNotEmpty() || $check_customer->isNotEmpty()) {
                //if username already exist in employee or customer table
                return true;
            }
        } else {
            if ($role == "Employee") {
                $check_employee = Employee::where("username", $username)->whereNotIn('id', [$id])->get();
                $check_customer = Customer::where("user_name", $username)->get();
            } else {
                if ($role == "Customer") {
                    $check_employee = Employee::where("username", $username)->get();
                    $check_customer = Customer::where("user_name", $username)->whereNotIn('id', [$id])->get();
                }
            }

            if ($check_employee->isNotEmpty() || $check_customer->isNotEmpty()) {
                //if username already exist in employee or customer table
                return true;
            }
        }
    }

    /**
     * dynamic_dropdown
     *
     * @return \Illuminate\Http\Response
     */

    public function dynamic_dropdown()
    {
        try {
            $data = Helper::yearsList();
            // dd($data);
            return Helper::response("Years List Shown Successfully", Response::HTTP_OK, true, $data);
        } catch (Exception $e) {
            $data = array();
            return Helper::response(trans("message.something_went_wrong"), $e->getStatusCode(), false, $data);
        }
    }
}
