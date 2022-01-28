<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use DB;
use App\Helpers\Helper;

class ViewProduct extends Model
{
    use HasFactory;
    protected $appends = [];
    protected $fillable = [
        'id',
        'mst_companies_id',
        'product_name',
        'product_generic',
        'marker_specification',
        'pharmacopeia_id',
        'generic_product_name',
        'packing_detail',
        'sample_description',
        'hsn_code',
        'is_generic',
        'selected_year',
        'copied_from_year',
        'is_active',
        'created_by',
        'updated_by',
        'created_at',
        'updated_at',
        'pharmacopeia_name',
        'pharmacopeia_deleted_at,',
        'entered_by',
        'modified_by'
    ];
    public function samples()
    {
        return $this->hasMany(ViewProductSamples::class, 'mst_product_id', 'id');
    }
    public function getPharmacopeiaDropdownAttribute()
    {
        $data = DB::table('view_pharmacopeia')
            ->select('id', 'pharmacopeia_name', 'deleted_at')
            ->where('is_active', 1)
            ->where('deleted_at',null)
            ->orderBy('id', 'desc')
            ->get()->toarray();

        $is_deleted = $this->pharmacopeia_deleted_at;
        if ($is_deleted != NULL || $is_deleted != '') {
            $deleted_pharmacopeia = [
                "id" => $this->pharmacopeia_id,
                "pharmacopeia_name" => $this->pharmacopeia_name,
                "deleted_at" => $this->pharmacopeia_deleted_at
            ];
            array_push($data, $deleted_pharmacopeia);
        }
        $default_arr = [
            "id" => "",
            "pharmacopeia_name" => "",
            "deleted_at" => ""
        ];
        return (isset($data[0])) ? $data : $default_arr;
    }

    

}
