<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Customer extends Model
{
    use SoftDeletes;
    protected $table = "mst_customers";
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
    ];

    /**
     * The attributes that should be hidden for arrays.
     *
     * @var array
     */
    protected $hidden = [];

    // Customer Contact Info
    public function contact_info()
    {
        return $this->hasMany('App\Models\CustomerContactInfo', 'mst_customer_id');
    }
    // Customer Contact Info
    public function contact_person()
    {
        return $this->hasMany('App\Models\CustomerContactPerson', 'mst_customer_id');
    }

    // Customer Contact Info
    public function customer_contact_data()
    {
        return $this->hasOne(CustomerContactInfo::class, 'mst_customer_id', 'id')->where('contact_info_type', 1)
            ->withTrashed()
            ->withDefault([
                "id" => "",
                "mst_customer_id" => "",
                "street_1" => "",
                "street_2" => "",
                "area" => "",
                "pin" => "",
                "city" => "",
                "state" => "",
                "country" => "",
            ]);
    }

    // Customer Contact Info where contact_info_type == 1 Home
    public function home_contact_no()
    {
        return $this->hasOne('App\Models\CustomerContactInfo', 'mst_customer_id')
            ->where('contact_info_type', 1)
            ->withDefault(array(
                "id" => "",
                "mst_customer_id" => "",
                "account_admin_contact_no" => "",
                "home_qc_contact_no" => "",
                "contact_info_type" => ""
            ));
    }
    // Customer Contact Info where contact_info_type == 2 Other
    public function other_contact_no()
    {
        return $this->hasOne('App\Models\CustomerContactInfo', 'mst_customer_id')
            ->where('contact_info_type', 2)
            ->withDefault(array(
                "id" => "",
                "mst_customer_id" => "",
                "qa_contact_no" => "",
                "contact_info_type" => ""
            ));
    }
}
