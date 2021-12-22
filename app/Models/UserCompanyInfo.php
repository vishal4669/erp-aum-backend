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

    protected $appends = ['position_title', 'department_name','company_name','first_name','last_name'];


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
        'username',
        'password',
        'in_time',
        'out_time',
        'email_username',
        'email_password',
        'incoming_mail_type',
        'incoming_mail_server',
        'incoming_mail_server_port',
        'outgoing_mail_server',
        'outgoing_mail_server_port',
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

    public function getCompanyNameAttribute()
    {
        $comp_data = Company::where('id', $this->mst_companies_id)->select('company_name')->first();
        return (isset($comp_data->company_name)) ? $comp_data->company_name : '';
    }

    public function getFirstNameAttribute()
    {
        $first_data = Employee::where('id', $this->users_id)->select('first_name')->first();
        return (isset($first_data->first_name)) ? $first_data->first_name : '';
    }

    public function getLastNameAttribute()
    {
        $last_data = Employee::where('id', $this->users_id)->select('last_name')->first();
        return (isset($last_data->last_name)) ? $last_data->last_name : '';
    }

      /*
    * Get user address details
    */
    public function reporting_authority_name (){
        return $this->hasOne(User::class, 'id','reporting_authority_id')->withTrashed()
            ->withDefault([
                "id"=> "",
                "first_name"=> "",
                "middle_name"=> "",
                "last_name"=> ""
            ]);
  }

}
