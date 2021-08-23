<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Bank extends Model
{
    use SoftDeletes;

    protected $table = 'mst_banks';

    protected $fillable = [
        'mst_companies_id',
        'bank_name',
        'branch_name',
        'customer_id',        
        'account_no',
        'micr_code',
        'ifsc_code',
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
