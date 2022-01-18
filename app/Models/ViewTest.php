<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use DB;

class ViewTest extends Model
{
    use HasFactory;
    protected $appends = [];
    protected $fillable = [
        'mst_companies_id',
        'procedure_name',
        'price',
        'test_code',
        'test_category',
        'test_procedure',
        'parent_id',
        'selected_year',
        'copied_from_year',
        'is_active',
        'created_by',
        'updated_by',
        'created_at',
        'updated_at',
    ];

    public function getParentNameAttribute()
    {
        $data = DB::table('view_tests')
            ->select('id', 'procedure_name', 'deleted_at')
            ->where('id', $this->parent_id)
            ->get()->toarray();

        $default_arr = [
            "id" => "",
            "procedure_name" => "",
            "deleted_at" => ""
        ];
        return (isset($data[0])) ? $data : $default_arr;
    }
    public function getParentDropdownAttribute()
    {
        $data = DB::table('view_tests')
            ->select('id', 'procedure_name', 'deleted_at')
            ->whereNotNull('price')
            ->where('deleted_at', NULL)
            ->where('is_active', 1)
            ->get()->toarray();

        if (isset($this->parent_name->deleted_at)) {
            $is_deleted = $this->parent_name->deleted_at;
            if ($is_deleted != NULL || $is_deleted != '') {
                array_push($data, $this->parent_name);
            }
        }
        $default_arr = [
            "id" => "",
            "procedure_name" => "",
            "deleted_at" => ""
        ];
        return (isset($data)) ? $data : $default_arr;
    }
}
