<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class UserAssignRight extends Model
{
    use SoftDeletes;

    protected $table = 'user_assign_rights';


    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'users_id',
        'software',
        'modules',
        'add_module',
        'edit_module',        
        'delete_module',
        'view_module',
        'email_module',
        'created_by',
        'updated_by',
        'created_at',
        'updated_at',
    ];


}
