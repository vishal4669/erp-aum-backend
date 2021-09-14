<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Productdetails extends Model
{
    use HasFactory;
    protected $table = "product_sample_details_list";
    protected $fillable = [
        'mst_companies_id',
        'product_id',
        'by_pass',
        'parent',
        'product_sample_parameter_id',
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
    ];
}
