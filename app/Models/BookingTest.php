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
        "assigned_date",
        "approval_date_time",
        "approved",
        "percentage_of_label_claim",
        "chemist_name",
        "created_by",
        "updated_by",
        "selected_year",
        "copied_from_year",
        "is_active",
        "updated_at"

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

    /**
     * Get the statusWiseTests associated with the BookingTest
     *
     * @return \Illuminate\Database\Eloquent\Relations\HasOne
     */
    public function booking_detail()
    {
        return $this->hasOne(Booking::class, 'id', 'booking_id');
    }
    /**
     * Get the statusWiseTests associated with the BookingTest
     *
     * @return \Illuminate\Database\Eloquent\Relations\HasOne
     */
    public function booking_samples_detail()
    {
        return $this->hasOne(BookingSampleDetail::class, 'booking_id', 'booking_id');
    }
    /**
     * Get the count of BookingTest where approved status pending
     *
     * @return \Illuminate\Database\Eloquent\Relations\HasOne
     */
    static public function count_pending_assign_tests()
    {
        $datacount = DB::table('booking_tests')->where("approved", "Pending")->count();
        return $datacount;
    }
}
