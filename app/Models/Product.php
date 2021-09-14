<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Product extends Model
{
    use HasFactory;
    protected $table = "mst_product_list";
    protected $fillable = [
        'mst_companies_id',
        'product_name',
        'product_generic',
        'marker_specification',
        'pharmacopiea_id',
        'generic_product_id',
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
}
