<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class MstTestParameter extends Model
{
    use HasFactory;
    protected $fillable = [
        "mst_companies_id",
        "test_by_pass",
        "test_parameter_name",
        "test_alpha",
        "formula",
        "type",
        "unit",
        "value",
        "sort",
        "is_active"
    ];
}
