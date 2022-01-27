<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class QuotationProductInfo extends Model
{
    use HasFactory;
    use SoftDeletes;
    protected $fillable = [
        "mst_companies_id",
        "quotation_id",
        "sample_name",
        "test_required",
        "method_technique",
        "sample_qty",
        "first_sample",
        "sample_in_row",
        "sample_preperation",
        "total",
        "remark",
        "created_by",
        "updated_by",
        "selected_year",
        "copied_from_year",
        "is_active",
        "deleted_at"
    ];
}

