<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use App\Events\FormulaCreated;

class Formula extends Model
{
    use HasFactory;
    use SoftDeletes;
    // protected $dispatchesEvents = [
    //     'created' => FormulaCreated::class
    // ];
    protected $fillable = [
        "mst_companies_id",
        "formula_name",
        "formula_type",
        "created_by",
        "updated_by",
        "created_at",
        "selected_year",
        "copied_from_year",
        "is_active",
        "updated_at",
    ];

    // public static function boot()
    // {
    //     parent::boot();

    //     static::created(function ($formula) {
    //         dd("from boot method", $formula);
    //     });
    //     static::updated(function ($formula) {
    //         dd("from boot method", $formula);
    //     });
    // }
}
