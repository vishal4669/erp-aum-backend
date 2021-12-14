<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
//use Illuminate\Database\Eloquent\SoftDeletes;

class UserEduDetail extends Model
{
  //  use SoftDeletes;

    protected $table = 'user_edu_details';


    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'users_id',
        'degree',
        'university',
        'from_year',
        'to_year',        
        'percentage_grade',
        'specialization',
        'is_active',
        'created_by',
        'updated_by',
        'created_at',
        'updated_at',
    ];


}
