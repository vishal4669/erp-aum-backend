<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;



class Group extends Model
{

    use SoftDeletes;

    protected $table = 'mst_groups';

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'company_id',
        'group_name',
        'group_code',
        'parent_group',        
        'current_year',
        'copied_from_year',
        'is_active',
        'created_by',
        'updated_by',
        'created_at',
        'updated_at',
    ];


}
