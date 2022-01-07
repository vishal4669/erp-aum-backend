<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class Country extends Model
{

    protected $timestamp = false;

    protected $table = 'mst_countries';

    use HasFactory;
    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'country_name',
        'is_active',
    ];

    /**
     * Get all of the comments for the Country
     *
     * @return \Illuminate\Database\Eloquent\Relations\HasMany
     */
    public function country_wise_states()
    {
        return $this->hasMany(State::class, 'mst_countries_id', 'id');
            // ->withDefault([
            //     "id" => "",
            //     "phone_code" => "",
            //     "country_name" => "",
            //     "iso" => "",
            //     "is_active" => "",
            //     "contry_wise_states" => array(
            //         "id" => "",
            //         "state_name" => "",
            //         "mst_countries_id" => "",
            //         "is_active" => ""
            //     )
            // ]);
    }
}
