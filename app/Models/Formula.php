<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Formula extends Model
{
    use HasFactory;
    use SoftDeletes;
    
    protected $fillable = [
        "mst_companies_id",
        "formula_name",
        "formula_type",
        "created_by",
        "updated_by",
        "created_at",
        "selected_year",
        "copied_from_year",
        "is_active",
        "updated_at",
    ];
}

