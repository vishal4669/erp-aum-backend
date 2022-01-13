<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use DB;

class ViewProduct extends Model
{
    use HasFactory;
    protected $appends = [
        'entered_by',
        'modified_by'
    ];
    protected $fillable = [
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
    ];

    public function getPharmacopeiaNameAttribute()
    {
        $data = DB::table('view_pharmacopeia')
            ->select('id', 'pharmacopeia_name', 'deleted_at')
            ->where('id', $this->pharmacopeia_id)->get();
        $default_arr = [
            "id" => "",
            "pharmacopeia_name" => "",
            "deleted_at" => ""
        ];
        return (isset($data[0])) ? $data : $default_arr;
    }

    public function getEnteredByAttribute()
    {
        $data = ViewUser::select('id', 'first_name', 'middle_name', 'last_name')
            ->where('id', $this->created_by)->get();
        if (isset($data[0])) {
            return $entered_by = $data[0]->first_name . ' ' . $data[0]->middle_name . ' ' . $data[0]->last_name;
        } else {
            return '';
        }
    }

    public function getModifiedByAttribute()
    {
        $data = ViewUser::select('id', 'first_name', 'middle_name', 'last_name')
            ->where('id', $this->updated_by)->get();
        if (isset($data[0])) {
            return $entered_by = $data[0]->first_name . ' ' . $data[0]->middle_name . ' ' . $data[0]->last_name;
        } else {
            return '';
        }
    }

    /**
     * Get all of the comments for the ViewProduct
     *
     * @return \Illuminate\Database\Eloquent\Relations\HasMany
     */
    public function samples()
    {
        return $this->hasMany(MstProductSample::class, 'mst_product_id', 'id');
    }
}
