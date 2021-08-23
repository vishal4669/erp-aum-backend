<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;



class Branch extends Model
{

    use SoftDeletes;

    protected $table = 'mst_branches';

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'mst_companies_id',
        'branch_name',
        'branch_type',
        'branch_code',        
        'branch_office_no',
        'branch_complex_name',
        'branch_street_name',
        'branch_land_mark',
        'branch_area',
        'branch_city',
        'branch_state',
        'branch_country',
        'branch_pin',
        'branch_phone',
        'branch_fax',
        'branch_mobile',
        'branch_email',
        'branch_establish_year',
        'selected_year',
        'copied_from_year',
        'is_active',
        'created_by',
        'updated_by',
        'created_at',
        'updated_at',
    ];


}
