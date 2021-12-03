<?php

namespace App\Http\Controllers\v1;

use App\Helpers\Helper;
use App\Models\RoleRightDesign;
use Illuminate\Http\Request;
use Illuminate\Http\Response;
use App\Models\RoleRights;


class RoleRightsController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function assign_role_design()
    {
        //
        try {

            $data = RoleRightDesign::all();
            
            return Helper::response("Roll and Rights Are Show Successfully", Response::HTTP_OK, true, $data);

        } catch (Exception $e) {
            $data =  array();
            return Helper::response(trans("message.something_went_wrong"), $e->getStatusCode(), false, $data);
        }
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
    public function assign_role_rights(Request $request)
    {
        //
        try {
            //code...
            $data = RoleRights::create([
                "user_id" => isset($request->user_id) ? $request->user_id : 0,
                "roll_rights" => isset($request->roll_rights) ? $request->roll_rights : "",
                "updated_at" => Null
            ]);
            return Helper::response("Roll and Rights Are Assigned To user Successfully", Response::HTTP_OK, true, $data);
        } catch (Exception $e) {
            //throw $th;
            $data =  array();
            return Helper::response(trans("message.something_went_wrong"), $e->getStatusCode(), false, $data);
        }
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\RoleRights  $roleRights
     * @return \Illuminate\Http\Response
     */
    public function show_role_rights(RoleRights $roleRights, $id)
    {
        //
        try {
            $data = RoleRights::where('user_id', $id)->get();

            return Helper::response("Roll and Rights Are Show Successfully", Response::HTTP_OK, true, $data);
        } catch (Exception $e) {
            //throw $th;
            $data =  array();
            return Helper::response(trans("message.something_went_wrong"), $e->getStatusCode(), false, $data);
        }
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\RoleRights  $roleRights
     * @return \Illuminate\Http\Response
     */
    public function edit(RoleRights $roleRights)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\RoleRights  $roleRights
     * @return \Illuminate\Http\Response
     */
    public function update_role_rights(Request $request, RoleRights $roleRights, $id)
    {
        //
        try {
            //code...
            $data = RoleRights::find($id);
            if ($data != null) {
                $data->update([
                    "user_id" => isset($request->user_id) ? $request->user_id : 0,
                    "roll_rights" => isset($request->roll_rights) ? $request->roll_rights : "",
                ]);
            }
            return Helper::response("Roll and Rights Are Assigned To user Successfully", Response::HTTP_OK, true, $data);
        } catch (Exception $e) {
            //throw $th;
            $data =  array();
            return Helper::response(trans("message.something_went_wrong"), $e->getStatusCode(), false, $data);
        }
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\RoleRights  $roleRights
     * @return \Illuminate\Http\Response
     */
    public function destroy(RoleRights $roleRights)
    {
        //
    }
}
