<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class CustomerContactInfo extends Model
{
    use HasFactory;
    protected $table = "mst_customers_contact_info";
    protected $fillable = [
        'mst_customer_id',
        'street_1',
        'street_2',
        'area',
        'pin',
        'city',
        'state',
        'country',
        'home_landline',
        'other_website',
        'other_qc_email',
        'home_pan_card',
        'other_pan_card_copy',
        'contact_info_type',
        'contact_no',
        'home_qc_contact_no',
        'other_contact_no',
        'email',
        'created_by',
        'updated_by',
    ];
}
        