<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
class Method extends Model
{
    use HasFactory,SoftDeletes;

    protected $fillable = [
        'mst_companies_id',
        'name',
        'type',
        'date',
        'file_1',
        'file_2',
        'file_3',
        'file_4',
        'description',
        'selected_year',
        'copied_from_year',
        'is_active',
        'created_by',
        'updated_by',
        'created_at',
        'updated_at'

    ];
}
