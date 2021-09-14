<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Productparameters extends Model
{
    use HasFactory;
    protected $table = "product_sample_parameters_list";
    protected $fillable = [
        'mst_companies_id',
        'parameter_name',
        'is_active',
        'selected_year',
        'copied_from_year',
        'created_by',
        'updated_by',
        'created_at',
        'updated_at',
    ];
}
