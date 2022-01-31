<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class CustomerPriceList extends Model
{
    use HasFactory;
    protected $fillable = [
        'id',
        'mst_companies_id',
        'customer_id',
        'file_1',
        'file_2',
        'file_3',
        'created_by',
        'updated_by',
        'selected_year',
        'copied_from_year',
        'is_active',
        'updated_at',
        'deleted_at'
    ];
}
