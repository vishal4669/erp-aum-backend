<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class ViewUser extends Model
{
    use HasFactory;
protected $fillable = [
    'id',
'mst_companies_id',
'is_approved',
'first_name',
'middle_name',
'last_name',
'username',
'machine_code',
'mobile',
'phone',
'attendance',
'is_resigned',
'is_active',
'created_by',
'created_at',
'updated_by',
'updated_at',
'company',
'mst_positions_id',
'mst_departments_id',
'reporting_authority_id',
'email',
'street1',
'street2',
'area',
'city',
'position_title',
'department_name',
'reporting_authority',
'company_name'

];
}
