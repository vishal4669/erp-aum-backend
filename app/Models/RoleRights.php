<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class RoleRights extends Model
{
    use HasFactory;
    protected $fillable = [
        "user_id",
        "roll_rights",
        "created_at",
        "updated_at"
    ];

    protected $casts = [
        "roll_rights" => 'array'
    ];
}
