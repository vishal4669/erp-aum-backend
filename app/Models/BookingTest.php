<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use DB;

class BookingTest extends Model
{
    use HasFactory;
    use SoftDeletes;

    protected $fillable = [
        "mst_companies_id",
        "booking_id",
        "parent_child",
        "p_sr_no",
        "by_pass",
        "parent",
        "product_details",
        "test_id",
        "label_claim",
        "label_claim_percentage",
        "min_limit",
        "max_limit",
        "amount",
        "result",
        "result2",
        "label_claim_result",
        "label_claim_unit",
        "mean",
        "unit",
        "na_content",
        "final_na_content",
        "expanded_uncertainty",
        "division",
        "method",
        "test_time",
        "test_date_time",
        "approval_date_time",
        "approved",
        "chemist_name",
        "assigned_date",
        "created_by",
        "updated_by",
        "created_at",
        "updated_at",
        "selected_year",
        "copied_from_year",
        "is_active",
        "deleted_at"
    ];
}
