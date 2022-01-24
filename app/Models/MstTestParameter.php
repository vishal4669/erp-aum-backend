<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class MstTestParameter extends Model
{
    use HasFactory;
    use SoftDeletes;
    protected $fillable = [
        "mst_companies_id",
        "mst_test_id",
        "test_by_pass",
        "test_parameter_name",
        "test_alpha",
        "formula",
        "type",
        "unit",
        "value",
        "sort",
        "is_active",
        "created_by",
        "updated_by",
        "selected_year"
    ];
}
