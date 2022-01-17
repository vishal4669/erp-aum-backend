<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use DB;

class ViewProductSamples extends Model
{
    use HasFactory;
    protected $fillable = [
        'mst_companies_id',
        'mst_product_id',
        'by_pass',
        'parent',
        'mst_sample_parameter_id',
        'label_claim',
        'min_limit',
        'max_limit',
        'amount',
        'method',
        'description',
        'division',
        'nabl',
        'formula',
        'created_by',
        'updated_by',
        'created_at',
        'updated_at',
        'parent_name',
        'parameter_name',
        'parent_deleted_at',
        'parameter_deleted_at',
    ];
}
