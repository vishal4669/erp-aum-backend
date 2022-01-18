<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use DB;
use Illuminate\Http\Request;

class ViewMethod extends Model
{
    use HasFactory;
    protected $appends = ['pharmacopeia'];
    protected $fillable = [
        'mst_companies_id',
        'name',
        'type',
        'date',
        'file_1',
        'file_2',
        'file_3',
        'file_4',
        'description',
        'selected_year',
        'copied_from_year',
        'is_active',
        'created_by',
        'updated_by',
        'created_at',
        'updated_at'

    ];

    public function getPharmacopeiaAttribute()
    {
        $ph_data = DB::table('view_pharmacopeia')
            ->where('id', $this->type)
            ->select('id', 'pharmacopeia_name', 'deleted_at')->get()->toarray();

        $default_array = array(
            "id" => "",
            "pharmacopeia_name" => "",
            "deleted_at" => ""
        );
        return (isset($ph_data[0])) ? $ph_data[0] : $default_array;
    }
    public function getPharmacopeiaDropdownAttribute()
    {

        $ph_data = DB::table('view_pharmacopeia')
            ->where('deleted_at', NULL)
            ->select('id', 'pharmacopeia_name', 'deleted_at')
            ->get()
            ->toarray();
        if (isset($this->pharmacopeia->deleted_at)) {
            $is_deleted = $this->pharmacopeia->deleted_at;
            if ($is_deleted != NULL || $is_deleted != '') {
                array_push($ph_data, $this->pharmacopeia);
            }
        }
        $default_array = array(
            "id" => "",
            "pharmacopeia_name" => "",
            "deleted_at" => ""
        );
        return (isset($ph_data)) ? $ph_data : $default_array;
    }
}
