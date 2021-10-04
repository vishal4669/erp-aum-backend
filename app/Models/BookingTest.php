<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class BookingTest extends Model
{
    use HasFactory;
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
        "amount",
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
