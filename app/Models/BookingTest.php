<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class BookingTest extends Model
{
    use HasFactory;
    use SoftDeletes;
    protected $fillable = [
        "booking_id",
        "parent_child",
        "p_sr_no",
        "by_pass",
        "parent",
        "product_details",
        "test_name",
        "label_claim",
        "label_claim_percent",
        "min_limit",
        "max_limit",
        "result",
        "label_claim_result",
        "label_claim_unit",
        "result2",
        "mean",
        "na_content",
        "final_na_content",
        "unit",
        "expanded_uncertanity",
        "amount",
        "division",
        "method",
        "division",
        "test_time",
        "test_date_time",
        "approval_date_time",
        "approved",
        "percentage_of_label_claim",
        "chemist_name",
        "created_by",
        "updated_by",
        "selected_year",
        "copied_from_year",
        "is_active"
    ];

    /**
     * Get the parent associated with the BookingTest
     *
     * @return \Illuminate\Database\Eloquent\Relations\HasOne
     */
    public function parent()
    {
        return $this->hasOne(MstProductParent::class, 'id', 'parent');
    }
}
