<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Booking extends Model
{
    use HasFactory;
    use SoftDeletes;
    protected $fillable =
    [
        "mst_companies_id",
        "booking_type",
        "invoice_no",
        "report_type",
        "invoice_date",
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
        "cancel",
        "cancel_remarks",
        "priority",
        "discipline",
        "booking_group",
        "statement_ofconformity",
        "coa_print",
        "coa_print_count",
        "roa_print_count",
        "coa_release_date",
        "block",
        "is_active",
        "selected_year",
        "created_by",
        "updated_by",
        "updated_at"
    ];

    protected $casts = [
        "coa_print" => 'array'
    ];
    /**
     * Get all of the comments for the booking
     *
     * @return \Illuminate\Database\Eloquent\Relations\HasMany
     */
    public function samples()
    {
        return $this->hasMany(BookingSampleDetail::class);
    }
    public function tests()
    {
        return $this->hasMany(BookingTest::class);
    }
    public function tests_status()
    {
        return $this->hasMany(BookingTest::class);
    }
    public function audit()
    {
        return $this->hasMany(BookingAuditDetail::class);
    }

    public function customer_id()
    {
        return $this->hasOne(Customer::class, 'id', 'customer_id')->withTrashed();
    }
    public function manufacturer_id()
    {
        return $this->hasOne(Customer::class, 'id', 'manufacturer_id')->withTrashed();
    }
    public function supplier_id()
    {
        return $this->hasOne(Customer::class, 'id', 'supplier_id')->withTrashed();
    }

    public function created_by()
    {
        return $this->hasOne(User::class, 'id', 'created_by');
    }
    public function updated_by()
    {
        return $this->hasOne(User::class, 'id', 'updated_by');
    }

    /**
     * Get the tests where chemist name is null or blank ''
     *where condition = return only tests data where chemist_name == NULL for AssignTests table
     * @return \Illuminate\Database\Eloquent\Relations\HasOne
     */
    public function tests_detail()
    {
        // return $this->hasMany(BookingTest::class)->where('chemist_name',NULL)->orwhere('chemist_name',0)->withTrashed();
        return $this->hasMany(BookingTest::class)->where('approved', 'Pending')->withTrashed();
    }



    //BookingPrintController "original_manufacturer == manufacturer_id"
    public function customer_data()
    {
        return $this->hasOne(Customer::class, 'id', 'customer_id')
            ->withTrashed()
            ->withDefault([
                "id" => "",
                "company_name" => "",
                "user_name" => "",
                "customer_contact_data" => array(
                    "id" => "",
                    "mst_customer_id" => "",
                    "street_1" => "",
                    "street_2" => "",
                    "area" => "",
                    "pin" => "",
                    "city" => "",
                    "state" => 0,
                    "country" => 0
                )
            ]);
    }

    public function original_manufacturer()
    {
        return $this->hasOne(Customer::class, 'id', 'original_manufacturer')
            ->withTrashed()
            ->withDefault([
                "id" => "",
                "company_name" => ""
            ]);
    }
    public function supplier()
    {
        return $this->hasOne(Customer::class, 'id', 'supplier')
            ->withTrashed()
            ->withDefault([
                "id" => "",
                "company_name" => ""
            ]);
    }
    //booking samples for BookingPrintController here "original_manufacturer == manufacturer_id"
    public function sample_data()
    {
        return $this->hasMany(BookingSampleDetail::class)->withTrashed();;
    }
    //booking tests_data for BookingPrintController
    public function tests_data()
    {
        return $this->hasMany(BookingTest::class, 'booking_id', 'id')->withTrashed();
    }
}
