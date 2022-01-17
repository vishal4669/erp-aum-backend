<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class MstProductSample extends Model
{
    use HasFactory;
    use SoftDeletes;
    // protected $appends = ['parent_name'];
    protected $fillable = [
        'mst_companies_id',
        'mst_product_id',
        'by_pass',
        'parent',
        'mst_sample_parameter_id',
        'label_claim',
        'min_limit',
        'max_limit',
        'amount',
        'method',
        'description',
        'division',
        'nabl',
        'formula',
        'created_by',
        'updated_by',
        'created_at',
        'updated_at',
    ];

    // public function getParentNameAttribute()
    // {
    //     $data = ViewTest::select('id', 'procedure_name', 'deleted_at')->where('id', $this->parent)->get();
    //     $default_arr = [
    //         "id" => "",
    //         "procedure_name" => "",
    //         "deleted_at" => ""
    //     ];
    //     return (isset($data[0])) ? $data : $default_arr;
    // }
    // public function parameter()
    // {
    //     return $this->hasOne(MstSampleParameter::class, 'id', 'mst_sample_parameter_id');
    // }

    //here parameters are tests data
    // public function parameter()
    // {
    //     return $this->hasOne(Test::class, 'id', 'mst_sample_parameter_id')->withTrashed();
    // }
    // public function parent()
    // {
    //     return $this->hasOne(Machine::class, 'id', 'parent');
    // }
}
