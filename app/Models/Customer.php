<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Customer extends Model
{
    use SoftDeletes;
    public $table = "mst_customers";
    protected $fillable = [
        'mst_companies_id',//edited
        'company_name',
        'gst_number',
        'contact_person_name',
        'tally_alias_name',
        'user_name',
        'password',
        'birth_date',
        'contact_type',
        'priority',
        'notes',
        'logo',
        'home_street_1',
        'home_street_2',
        'home_area',
        'home_pin',
        'home_city',
        'home_state',
        'home_country',
        'home_landline',
        'home_contact_no',
        'home_qc_contact_no',
        'home_email',
        'home_pan_card',
        'other_street_1',
        'other_street_2',
        'other_area',
        'other_pin',
        'other_city',
        'other_state',
        'other_country',
        'other_website',
        'other_contact_no',
        'other_qc_email',
        'other_qa_email',
        'other_pan_card_copy',
        'education_details',
        'prev_details',
        'company_vat_no',
        'company_tin_no',
        'company_service_tax_no',
        'company_cst_no',
        'company_cust_discount',
        'created_by',
        'updated_by',
        'created_at',
        'updated_at',
        'selected_year',
        'is_active',
    ];

    /**
     * The attributes that should be hidden for arrays.
     *
     * @var array
     */
    protected $hidden = [
        'password'
    ];
}
