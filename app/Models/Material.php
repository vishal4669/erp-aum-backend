<?php

namespace App\Models;

use Illuminate\Database\Eloquent\SoftDeletes;
use Illuminate\Database\Eloquent\Model;

class Material extends Model
{
    use SoftDeletes;

    protected $table = 'mst_materials';

    protected $fillable = [
        'mst_companies_id',
        'material_type',
        'material_name',
        'material_purchase_rate',
        'material_code',
        'category_id',
        'sub_category_id',
        'sub_sub_category_id',
        'material_rate',
        'material_amount',
        'material_qty',
        'mst_units_id',
        'material_use_before_date',
        'material_case_number',
        'selected_year',
        'copied_from_year',
        'is_active',
        'created_by',
        'updated_by',
        'created_at',
        'updated_at',
        'deleted_at',
    ];
}
