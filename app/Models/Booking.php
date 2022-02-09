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
        "deleted_at"
    ];
}
