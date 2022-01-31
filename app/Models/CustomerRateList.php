<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class CustomerRateList extends Model
{
    use HasFactory;
    use SoftDeletes;
    protected $fillable = [
        'id',
        'mst_companies_id',
        'customer_price_list',
        'product_id',
        'parent_id',
        'test_id',
        'rate',
        'created_by',
        'updated_by',
        'created_at',
        'updated_at',
        'selected_year',
        'copied_from_year',
        'is_active',
        'deleted_at'
    ];
}
