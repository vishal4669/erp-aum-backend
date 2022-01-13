<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class ViewCustomer extends Model
{
  
    use HasFactory;
    protected $fillable = [
        'id',
        'mst_companies_id',
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
        'home_contact_no',
        'other_contact_no',
        'home_qc_contact_no',
        'home_landline',
        'home_email',
        'other_email',
        'other_qc_email',
        'home_street_1',
        'home_street_2',
        'other_street_1',
        'other_street_2',
        'home_city',
        'other_city',
        'home_country',
        'other_country',
        'home_state',
        'other_state',
        'home_area',
        'other_area'
    ];
}
