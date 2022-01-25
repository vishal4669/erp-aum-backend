<?php

namespace App\Models\ModelViews;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use DB;

class ViewQuotation extends Model
{
    use HasFactory;
    protected $appends = ['customer_dropdown'];
    protected $fillable = [
        "id",
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
        "created_by",
        "updated_by",
        "created_at",
        "updated_at",
        "selected_year",
        "copied_from_year",
        "is_active",
        "deleted_at",
        "company_name",
        "company_cust_discount",
        "home_country_id",
        "home_country",
        "customer_deleted_at"
    ];
    /**
     * Get all of the comments for the ViewQuotation
     *
     * @return \Illuminate\Database\Eloquent\Relations\HasMany
     */
    public function quotationProductInfo()
    {
        return $this->hasMany(ViewQuotationProductInfo::class, 'quotation_id',$this->id);
    }
    public function getCustomerDropdownAttribute()
    {
        $data = DB::table('view_customers')
            ->select(
                'id',
                "company_name",
                "company_cust_discount",
                "home_country_id",
                "home_country",
                'deleted_at'
            )
            ->where('is_active', 1)
            ->where('deleted_at', NULL)
            ->get()->toarray();

        $is_deleted = $this->customer_deleted_at;
        if ($is_deleted != NULL || $is_deleted != '') {
            $deleted_department = [
                "id" => $this->customer_id,
                "company_name" => $this->company_name,
                "company_cust_discount" => $this->company_cust_discount,
                "home_country_id" => $this->home_country_id,
                "home_country" => $this->home_country,
                "deleted_at" => $this->customer_deleted_at
            ];
            array_push($data, $deleted_department);
        }
        $default_arr = [
            "id" => "",
            "company_name" => "",
            "company_cust_discount" => "",
            "home_country_id" => "",
            "home_country" => "",
            "deleted_at" => ""
        ];
        return (isset($data)) ? $data : $default_arr;
    }
}
