<?php

namespace App\Models\ModelViews;

use App\Models\ViewCustomer;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class ViewBooking extends Model
{
    use HasFactory;
    protected $fillable =
    [
        "mst_companies_id",
        "booking_type",
        "report_type",
        "receipte_date",
        "booking_no",
        "customer_id",
        "reference_no",
        "remarks",
        "manufacturer_id",
        "supplier_id",
        "mfg_date",
        "mfg_options",
        "exp_date",
        "exp_options",
        "analysis_date",
        "aum_serial_no",
        "d_format",
        "d_format_options",
        "grade",
        "grade_options",
        "project_name",
        "project_options",
        "mfg_lic_no",
        "is_report_dispacthed",
        "dispatch_date_time",
        "dispatch_mode",
        "dispatch_details",
        "signature",
        "verified_by",
        "nabl_scope",
        "ulr_no",
        "cancel",
        "cancel_remarks",
        "priority",
        "discipline",
        "booking_group",
        "statement_of_conformity",
        "invoice_no",
        "invoice_date",
        "coa_release_date",
        "block",
        "created_by",
        "updated_by",
        "created_at",
        "updated_at",
        "selected_year",
        "copied_from_year",
        "is_active",
        "deleted_at",
        "customer_company_name",
        "customer_home_street_1",
        "customer_home_street_2",
        "customer_other_street_1",
        "customer_other_street_2",
        "customer_other_area",
        "customer_home_area",
        "customer_contact_type",
        "customer_is_active",
        "customer_deleted_at",
        "manufaturer_company_name",
        "manufaturer_deleted_at",
        "supplier_company_name",
        "supplier_deleted_at"
    ];

    /**
     * Get the samples associated with the ViewBooking
     *
     * @return \Illuminate\Database\Eloquent\Relations\HasOne
     */
    public function samples()
    {
        return $this->hasOne(ViewBookingSampleDetails::class, 'booking_id', 'id');
    }

    /**
     * Get the tests associated with the ViewBooking
     *
     * @return \Illuminate\Database\Eloquent\Relations\HasManny
     */
    public function tests()
    {
        return $this->hasMany(ViewBookingTests::class, 'booking_id', 'id');
    }

    /**
     * Get the customer dropdown associated with the ViewBooking 
     * with deleted scenario :ambed customer who is associated with this booking and is deleted:
     * @return \Illuminate\Database\Eloquent\Relations\HasManny
     */
    public function getCustomerDropdownAttribute()
    {
        $data = ViewCustomer::select(
            'id',
            'home_street_1',
            'home_street_2',
            'other_street_1',
            'other_street_2',
            'other_area',
            'home_area',
            'company_name',
            'contact_type',
            'is_active',
            'deleted_at'
        )
            ->where('deleted_at', NULL)
            ->get()->toarray();

        $is_deleted = $this->customer_deleted_at;
        if ($is_deleted != NULL || $is_deleted != '') {
            $deleted_customer = [
                "id" => $this->customer_id,
                "company_name" => $this->customer_company_name,
                "home_street_1" => $this->customer_home_street_1,
                "home_street_2" => $this->customer_home_street_2,
                "other_street_1" => $this->customer_other_street_1,
                "other_street_2" => $this->customer_other_street_2,
                "other_area" => $this->customer_other_area,
                "home_area" => $this->customer_home_area,
                "contact_type" => $this->customer_contact_type,
                "is_active" => $this->customer_is_active,
                "deleted_at" => $this->customer_deleted_at
            ];
            array_push($data, $deleted_customer);
        }
        $default_arr = [
            "id" => "",
            "company_name" => "",
            "home_street_1" => "",
            "home_street_2" => "",
            "other_street_1" => "",
            "other_street_2" => "",
            "other_area" => "",
            "home_area" => "",
            "contact_type" => "",
            "is_active" => "",
            "deleted_at" => ""
        ];
        return (isset($data)) ? $data : $default_arr;
    }
    /**
     * Get the customer dropdown associated with the ViewBooking 
     * with deleted scenario :ambed customer who is associated with this booking and is deleted:
     * @return \Illuminate\Database\Eloquent\Relations\HasManny
     */
    public function getManufacturerDropdownAttribute()
    {
        $data = ViewCustomer::select(
            'id',
            'company_name',
            'is_active',
            'deleted_at'
        )
            ->where('contact_type', 'Manufacturer')
            ->where('is_active', 1)
            ->where('deleted_at', NULL)
            ->get()->toarray();

        $is_deleted = $this->manufaturer_deleted_at;
        if ($is_deleted != NULL || $is_deleted != '') {
            $deleted_manufacturer = [
                "id" => $this->manufacturer_id,
                "company_name" => $this->manufaturer_company_name,
                "is_active" => '',
                "deleted_at" => $this->manufaturer_deleted_at
            ];
            array_push($data, $deleted_manufacturer);
        }
        $default_arr = [
            "id" => "",
            "company_name" => "",
            "is_active" => "",
            "deleted_at" => ""
        ];
        return (isset($data)) ? $data : $default_arr;
    }
    /**
     * Get the customer dropdown associated with the ViewBooking 
     * with deleted scenario :ambed customer who is associated with this booking and is deleted:
     * @return \Illuminate\Database\Eloquent\Relations\HasManny
     */
    public function getSupplierDropdownAttribute()
    {
        $data = ViewCustomer::select(
            'id',
            'company_name',
            'is_active',
            'deleted_at'
        )
            ->where('contact_type', 'Supplier')
            ->where('is_active', 1)
            ->where('deleted_at', NULL)
            ->get()->toarray();

        $is_deleted = $this->supplier_deleted_at;
        if ($is_deleted != NULL || $is_deleted != '') {
            $deleted_supplier = [
                "id" => $this->supplier_id,
                "company_name" => $this->supplier_company_name,
                "is_active" => '',
                "deleted_at" => $this->supplier_deleted_at
            ];
            array_push($data, $deleted_supplier);
        }
        $default_arr = [
            "id" => "",
            "company_name" => "",
            "is_active" => "",
            "deleted_at" => ""
        ];
        return (isset($data)) ? $data : $default_arr;
    }
}
