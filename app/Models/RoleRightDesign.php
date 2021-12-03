<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class RoleRightDesign extends Model
{
    use HasFactory;
    protected $fillable = [
        'id',
        'section',
        'modules',
        'can_add',
        'can_delete',
        'can_view',
        'can_email',
        'can_print',
        'can_quick_access_tabs',
        'can_sms'
    ];
}
