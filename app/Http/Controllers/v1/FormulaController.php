<?php

namespace App\Http\Controllers\v1;

use App\Models\Formula;
use Illuminate\Http\Request;
use Illuminate\Http\Response;
use App\Helpers\Helper;
use DB;
use Log;
class FormulaController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        //
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        //
       try {
        $loggedInUserData = Helper::getUserData();

        $data = Formula::create([
            'mst_companies_id' => $loggedInUserData['company_id'],
            'formula_name' => (isset($request->formula_name)?$request->formula_name:NULL),
            'formula_type' => (isset($request->formula_type)?$request->formula_type:NULL),
            'created_by' => $loggedInUserData['logged_in_user_id'],
            'selected_year' => $loggedInUserData['selected_year'],
            'is_active' => 1,
            'updated_at' => NULL
        ]);
 
        DB::commit();
        Log::info("Formula Created with details : " . json_encode($request->all()));

        return Helper::response("Formula added Successfully", Response::HTTP_CREATED, true, $data);
    } catch (Exception $e) {
        DB::rollback();
        $data = array();
        return Helper::response(trans("message.something_went_wrong"), $e->getStatusCode(), false, $data);
    }
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Formula  $formula
     * @return \Illuminate\Http\Response
     */
    public function show(Formula $formula)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\Formula  $formula
     * @return \Illuminate\Http\Response
     */
    public function edit(Formula $formula)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Formula  $formula
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Formula $formula)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Formula  $formula
     * @return \Illuminate\Http\Response
     */
    public function destroy(Formula $formula)
    {
        //
    }
}
