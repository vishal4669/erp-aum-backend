<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class MstProductParent extends Model
{
    use HasFactory;
    protected $fillable = [
        'id',
        'parent_name'
    ];
}
