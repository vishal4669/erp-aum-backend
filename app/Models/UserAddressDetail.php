<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use App\Models\Country;
use App\Models\State;

class UserAddressDetail extends Model
{
    use SoftDeletes;

    protected $table = 'user_address_details';

    protected $appends = ['state_name', 'country_name'];


    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'users_id',
        'mst_countries_id',
        'mst_states_id',
        'street1',
        'street2',        
        'area',
        'city',
        'pincode',
        'email',
        'emergency_contact_number',
        'emergency_contact_name',
        'website',
        'address_type',
        'created_by',
        'updated_by',
        'created_at',
        'updated_at',
    ];

    public function getStateNameAttribute()
    {
        $st_data = State::where('id', $this->mst_states_id)->select('state_name')->first();
        return (isset($st_data->state_name)) ? $st_data->state_name : '';
    }

    public function getCountryNameAttribute()
    {
        $data = Country::where('id', $this->mst_countries_id)->select('country_name')->first();
        return (isset($data->country_name)) ? $data->country_name : '';
    }


}
