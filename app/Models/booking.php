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
        "signature",
        "verified_by",
        "nabl_scope",
        "cancel",
        "cancel_remarks",
        "priority",
        "discipline",
        "booking_group",
        "statement_ofconformity",
        "is_active",
        "selected_year",
        "created_by",
        "updated_by"
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
    public function customer_id()
    {
        return $this->hasOne(Customer::class, 'id', 'customer_id');
    }
}
