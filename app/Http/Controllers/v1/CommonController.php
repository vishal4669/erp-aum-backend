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

class CommonController extends Controller
{

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
            return Helper::response("Years List Shown Successfully", Response::HTTP_OK, true,$data);
        } catch (Exception $e) {
            $data = array();
            return Helper::response(trans("message.something_went_wrong"),$e->getStatusCode(),false,$data);
        }       
        
    }

    public function listCompanies(Request $request)
    {
        try {
            $data = Company::where('is_active',1)->get();
            return Helper::response("All Companies List Shown Successfully", Response::HTTP_OK,true,$data);
        } catch (Exception $e) {
            $data = array();
            return Helper::response(trans("message.something_went_wrong"),$e->getStatusCode(),false,$data);
        } 
    }

    public function listStates(Request $request)
    {
        try {
            $data = State::leftjoin('mst_countries', 'mst_countries.id', '=', 'mst_states.mst_countries_id')
                        ->where('mst_states.is_active',1)
                        ->select('mst_states.id','mst_states.state_name','mst_countries.country_name')
                        ->get();
            return Helper::response("All States List Shown Successfully", Response::HTTP_OK,true,$data);
        } catch (Exception $e) {
            $data = array();
            return Helper::response(trans("message.something_went_wrong"),$e->getStatusCode(),false,$data);
        } 
    }

    public function listCountries(Request $request)
    {
        try {
            $data = Country::where('is_active',1)->get();
            return Helper::response("All Countries List Shown Successfully", Response::HTTP_OK,true,$data);
        } catch (Exception $e) {
            $data = array();
            return Helper::response(trans("message.something_went_wrong"),$e->getStatusCode(),false,$data);
        } 
    }

    public function countriesWiseStates(Request $request,$id)
    {
        try {
            $data = Country::where('id',$id)->with('contry_wise_states')->get();
            return Helper::response("All Countries List Shown Successfully", Response::HTTP_OK,true,$data);
        } catch (Exception $e) {
            $data = array();
            return Helper::response(trans("message.something_went_wrong"),$e->getStatusCode(),false,$data);
        } 
    }
}

