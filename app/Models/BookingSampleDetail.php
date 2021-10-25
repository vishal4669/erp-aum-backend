<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class BookingSampleDetail extends Model
{
    use HasFactory;
    use SoftDeletes;
    protected $fillable = [
        "booking_id",
        "product_id",
        "generic_name",
        "product_type",
        "pharmacopiea_id",
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
        "selected_year",
        "copied_from_year",
        "is_active",
        "created_by",
        "updated_by",
        "updated_at"

    ];

    /**
     * Get the product_id,pharmacopiea_id associated with the BookingSampleDetail
     *
     * @return \Illuminate\Database\Eloquent\Relations\HasOne
     */
    public function product_id()
    {
        return $this->hasOne(MstProduct::class, 'id', 'product_id');
    }
    public function pharmacopiea_id()
    {
        return $this->hasOne(Pharmacopeia::class, 'id', 'pharmacopiea_id');
    }
    //get product and bind deleted and selected product for frontend
    public function get_product()
    {
        return $this->hasOne(MstProduct::class, 'id', 'product_id')->withTrashed();
    }
}
