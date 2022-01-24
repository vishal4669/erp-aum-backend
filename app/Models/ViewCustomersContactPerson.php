<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use DB;

class ViewCustomersContactPerson extends Model
{
    use HasFactory;
    protected $table = "view_customers_contact_persons";
    protected $appends = ['department_dropdown','position_dropdown'];
    protected $fillable = [
        'mst_customer_id',
        'name',
        'mobile',
        'email',
        'department',
        'position',
        'created_by',
        'updated_by',
        'deleted_at',
        'department_name',
        'department_deleted_at',
        'position_title',
        'position_deleted_at'
    ];

    public function getDepartmentDropdownAttribute()
    {
        $data = DB::table('view_departments')
            ->select('id', 'department_name', 'deleted_at')
            ->where('is_active', 1)
            ->where('deleted_at', NULL)
            ->get()->toarray();

        $is_deleted = $this->department_deleted_at;
        if ($is_deleted != NULL || $is_deleted != '') {
            $deleted_department = [
                "id" => $this->department,
                "department_name" => $this->department_name,
                "deleted_at" => $this->department_deleted_at
            ];
            array_push($data, $deleted_department);
        }
        $default_arr = [
            "id" => "",
            "department_name" => "",
            "deleted_at" => ""
        ];
        return (isset($data)) ? $data : $default_arr;
    }

    public function getPositionDropdownAttribute()
    {
        $data = DB::table('view_positions')
            ->select('id', 'position_title', 'deleted_at')
            ->where('is_active', 1)
            ->where('deleted_at', NULL)
            ->get()->toarray();

        $is_deleted = $this->position_deleted_at;
        if ($is_deleted != NULL || $is_deleted != '') {
            $deleted_position = [
                "id" => $this->position,
                "department_name" => $this->position_title,
                "deleted_at" => $this->position_deleted_at
            ];
            array_push($data, $deleted_position);
        }
        $default_arr = [
            "id" => "",
            "position_title" => "",
            "deleted_at" => ""
        ];
        return (isset($data)) ? $data : $default_arr;
    }
}
