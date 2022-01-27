<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Quotation extends Model
{
    use HasFactory;
    use SoftDeletes;
    protected $fillable = [
        "mst_companies_id",
        "quotation_no",
        "type",
        "customer_id",
        "subject",
        "quotation_date",
        "valid_until",
        "status",
        "kind_attention",
        "turn_around_time",
        "remarks",
        "currency_type",
        "grand_total",
        "payment_terms",
        "product_info_grand_total",
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

