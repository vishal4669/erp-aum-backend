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
        "test_name",
        "label_claim",
        "label_claim_percentage",
        "min_limit",
        "max_limit",
        "amount",
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
?>

        

