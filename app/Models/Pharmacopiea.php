<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;



class Pharmacopiea extends Model
{

    use SoftDeletes;

    protected $table = 'mst_pharmacopeia';

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'mst_companies_id',
        'pharmacopeia_name',
        'vol_no',
        'pharmacopeia_year',
        'pharmacopeia_edition',        
        'selected_year',
        'copied_from_year',
        'is_active',
        'created_by',
        'updated_by',
        'created_at',
        'updated_at',
    ];


}
