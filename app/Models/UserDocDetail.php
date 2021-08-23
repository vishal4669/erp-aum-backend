<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class UserDocDetail extends Model
{
    use SoftDeletes;

    protected $table = 'user_doc_details';


    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'users_id',
        'aadhar_card_photo',
        'aadhar_number',
        'election_card_photo',
        'election_card_number',        
        'pan_card_photo',
        'pan_card_number',
        'passport_photo',
        'passport_number',
        'driving_license_photo',
        'driving_license_number',
        'is_active',
        'created_by',
        'updated_by',
        'created_at',
        'updated_at',
    ];


}
