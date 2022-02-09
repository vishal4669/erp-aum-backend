<?php

namespace App\Models\ModelViews;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class ViewBookingSampleDetails extends Model
{
    use HasFactory;
    protected $fillable = [
        "mst_companies_id",
        "booking_id",
        "product_id",
        "batch_no",
        "packsize",
        "request_quantity",
        "sample_code",
        "sample_description",
        "sample_quantity",
        "sample_location",
        "sample_packaging",
        "sample_type",
        "sampling_date_from",
        "sampling_date_from_options",
        "sampling_date_to",
        "sampling_date_to_options",
        "sample_received_through",
        "chemist",
        "sample_condition",
        "is_sample_condition",
        "batch_size_qty_rec",
        "notes",
        "sample_drawn_by",
        "created_by",
        "updated_by",
        "created_at",
        "updated_at",
        "selected_year",
        "copied_from_year",
        "is_active",
        "deleted_at",
        "product_name",
        "generic_product_name",
        "product_generic",
        "pharmacopeia_id",
        "product_deleted_at"
    ];
}
