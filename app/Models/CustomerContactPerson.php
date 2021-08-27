<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class CustomerContactPerson extends Model
{
    use HasFactory;
    use HasFactory;
    protected $table = "mst_customers_contact_person";
    protected $fillable = [
        'mst_customer_id',
        'name',
        'mobile',
        'email',
        'department',
        'position',
        'created_by',
        'updated_by',
    ];
}
