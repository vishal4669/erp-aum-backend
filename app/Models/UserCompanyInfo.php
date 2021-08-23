<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use App\Models\Position;
use App\Models\Department;

class UserCompanyInfo extends Model
{
    use SoftDeletes;

    protected $table = 'user_company_info';

    protected $appends = ['position_title', 'department_name'];


    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'users_id',
        'mst_companies_id',
        'reporting_authority_id',
        'mst_departments_id',
        'mst_positions_id',
        'join_date',        
        'resign_date',
        'bank_name',
        'bank_branch_name',
        'salary_per_month',
        'bank_acc_number',
        'is_active',
        'created_by',
        'updated_by',
        'created_at',
        'updated_at',
    ];

    public function getPositionTitleAttribute()
    {
        $position_data = Position::where('id', $this->mst_positions_id)->select('position_title')->first();
        return (isset($position_data->position_title)) ? $position_data->position_title : '';
    }

    public function getDepartmentNameAttribute()
    {
        $dept_data = Department::where('id', $this->mst_departments_id)->select('department_name')->first();
        return (isset($dept_data->department_name)) ? $dept_data->department_name : '';
    }

}
