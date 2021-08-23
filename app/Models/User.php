<?php

namespace App\Models;

use Illuminate\Contracts\Auth\MustVerifyEmail;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;
use Tymon\JWTAuth\Contracts\JWTSubject;

class User extends Authenticatable implements JWTSubject
{
    use HasFactory, Notifiable;

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'mst_companies_id',
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
        'booking_copy',
        'nationality',
        'religion',
        'reporting_authority',
        'deposit',
        'booking_ratetiny',
        'postal_address',
        'emergency_contact_name',
        'emergency_contact_number',
        'selected_year',
        'copied_from_year',
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
        'password',
        'remember_token',
    ];

    /**
     * The attributes that should be cast to native types.
     *
     * @var array
     */
    protected $casts = [
        'email_verified_at' => 'datetime',
    ];

    public function getJWTIdentifier()
    {
        return $this->getKey();
    }
        
    public function getJWTCustomClaims()
    {
        return [];
    }

}
