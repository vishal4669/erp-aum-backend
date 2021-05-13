<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;


class Company extends Model
{

    use SoftDeletes;

    protected $table = 'mst_companies';

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'company_name',      
        'current_year',
        'copied_from_year',
        'is_active',
        'created_by',
        'updated_by',
        'created_at',
        'updated_at',
    ];


}
