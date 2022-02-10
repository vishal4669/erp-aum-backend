<?php

namespace App\Models\ModelViews;

use App\Models\ViewProduct;
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
        "pharmacopeia_name",
        "product_deleted_at"
    ];

    /**
     * Get the product dropdown associated with the ViewBookingSampleDetails 
     * with deleted scenario :ambed product who is associated with this bookingsample and is deleted:
     */
    public function getProductDropdownAttribute()
    {
        $data = ViewProduct::select(
            "id",
            "product_name",
            "generic_product_name",
            "product_generic",
            "pharmacopeia_id",
            "pharmacopeia_name",
            "deleted_at"
        )
            ->where('is_active', 1)
            ->where('deleted_at', NULL)
            ->orderBy('id', 'desc')
            ->get()->toarray();

        $is_deleted = $this->product_deleted_at;
        if ($is_deleted != NULL || $is_deleted != '') {
            $deleted_product = [
                "id" => $this->product_id,
                "product_name" => $this->product_name,
                "generic_product_name" => $this->generic_product_name,
                "product_generic" => $this->product_generic,
                "pharmacopeia_id" => $this->pharmacopeia_id,
                "pharmacopeia_name" => $this->pharmacopeia_name,
                "deleted_at" => $this->product_deleted_at
            ];
            array_push($data, $deleted_product);
        }
        $default_arr = [
            "id" => "",
            "product_name" => "",
            "generic_product_name" => "",
            "product_generic" => "",
            "pharmacopeia_id" => "",
            "pharmacopeia_name" => "",
            "deleted_at" => ""
        ];
        return (isset($data)) ? $data : $default_arr;
    }
}
