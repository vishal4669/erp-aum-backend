<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
//use Illuminate\Database\Eloquent\SoftDeletes;

class UserEmpDetail extends Model
{
    //use SoftDeletes;

    protected $table = 'user_emp_details';


    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'users_id',
        'organisation',
        'designation',
        'emp_from_year',
        'emp_to_year',        
        'annual_ctc',
        'is_active',
        'created_by',
        'updated_by',
        'created_at',
        'updated_at',
    ];


}
