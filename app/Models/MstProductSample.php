<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class MstProductSample extends Model
{
    use HasFactory;
    use SoftDeletes;
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

    public function parameter()
    {
        return $this->hasOne(MstSampleParameter::class, 'id', 'mst_sample_parameter_id');
    }
    public function parent()
    {
        return $this->hasOne(MstProductParent::class, 'id', 'parent');
    }
}