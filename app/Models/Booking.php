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
        "coa_release_date",
        "block",
        "is_active",
        "selected_year",
        "created_by",
        "updated_by",
        "updated_at"
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
}
