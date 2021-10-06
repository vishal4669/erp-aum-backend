<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class BookingAuditDetail extends Model
{
    use HasFactory;
    use SoftDeletes;
    protected $fillable = [
        "id",
        "booking_id",
        "audit_remarks",
        "reason",
        "comments",
        "is_active",
        "created_by",
        "updated_by",
        "selected_year",
        "copied_from_year",
        "updated_at"
    ];
}
