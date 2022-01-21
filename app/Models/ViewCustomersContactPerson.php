<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class ViewCustomersContactPerson extends Model
{
    use HasFactory;
    protected $table = "view_customers_contact_persons";
    protected $fillable = [
        'mst_customer_id',
        'name',
        'mobile',
        'email',
        'department',
        'position',
        'created_by',
        'updated_by',
        'deleted_at'
    ];
}
