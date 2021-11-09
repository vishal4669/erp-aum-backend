<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;



class Test extends Model
{

    use SoftDeletes;

    protected $table = 'mst_tests';

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'mst_companies_id',
        'procedure_name',
        'price',
        'test_code',
        'test_category',
        'test_procedure',
        'parent_id',
        'selected_year',
        'copied_from_year',
        'is_active',
        'created_by',
        'updated_by',
        'created_at',
        'updated_at',
    ];


}
