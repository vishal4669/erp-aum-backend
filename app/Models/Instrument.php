<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;



class Instrument extends Model
{

    use SoftDeletes;

    protected $table = 'mst_instruments';

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'mst_companies_id',
        'make',
        'instrument_name',
        'instrument_code',
        'model',
        'last_service_date',
        'service_due_date',
        'last_calibration_date',
        'calibration_due_date', 
        'selected_year',
        'copied_from_year',
        'is_active',
        'created_by',
        'updated_by',
        'created_at',
        'updated_at',
    ];


}
