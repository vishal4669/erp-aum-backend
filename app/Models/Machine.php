<?php

namespace App\Models;

use Illuminate\Database\Eloquent\SoftDeletes;
use Illuminate\Database\Eloquent\Model;

class Machine extends Model
{
    use SoftDeletes;

    protected $table = 'mst_machines';

    protected $fillable = [
        'mst_companies_id',
        'machine_name',
        'selected_year',
        'copied_from_year',
        'is_active',
        'created_by',
        'updated_by',
        'created_at',
        'updated_at',
        'deleted_at',
    ];
}
