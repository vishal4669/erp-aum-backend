<?php

namespace App\Models;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use App\Helpers\Helper;

class Employee extends Model
{
    use HasFactory;
    use SoftDeletes;

    protected $table = 'users';


    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'mst_companies_id',
        'title',
        'first_name',
        'middle_name',
        'last_name',
        'email',        
        'username',
        'password',
        'blood_group',
        'gender',
        'birth_date',
        'marital_status',
        'photo',
        'machine_code',
        'phone',
        'mobile',
        'notes',
        'attendance',
        'signature',
        'booking_action',
        'booking_sms',
        'booking_email',
        'is_resigned',
        'booking_copy',
        'nationality',
        'religion',
        'caste',
        'is_reporting_authority',
        'deposit',
        'booking_rate',
        'booking_ratetiny',
        'selected_year',
        'copied_from_year',
        'is_approved',
        'is_active',
        'created_by',
        'updated_by',
        'created_at',
        'updated_at',
    ];

    /**
     * The attributes that should be hidden for arrays.
     *
     * @var array
     */
    protected $hidden = [
        'password'
    ];

    /*
    * Get user address details
    */
    public function address(){
          return $this->hasMany('App\Models\UserAddressDetail', 'users_id');
    }

    /*
    * Get user address details
    */
    public function right(){
          return $this->hasMany('App\Models\UserAssignRight', 'users_id');
    }

    /*
    * Get user address details
    */
    public function company(){
          return $this->hasMany('App\Models\UserCompanyInfo', 'users_id');
    }

    /*
    * Get user address details
    */
    public function document(){
          return $this->hasMany('App\Models\UserDocDetail', 'users_id');
    }

    /*
    * Get user address details
    */
    public function education(){
          return $this->hasMany('App\Models\UserEduDetail', 'users_id');
    }

    /*
    * Get user address details
    */
    public function employment(){
          return $this->hasMany('App\Models\UserEmpDetail', 'users_id');
    }

    /*
    * Get user position details
    */

  
}
