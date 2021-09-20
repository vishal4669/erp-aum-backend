<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;


class MstSampleParameter extends Model
{
    use HasFactory;

    protected $fillable = [
        'mst_companies_id',
        'parameter_name',
        'selected_year',
        'copied_from_year',
        'is_active',
        'created_by',
        'updated_by',
        'created_at',
        'updated_at',
    ];
}
