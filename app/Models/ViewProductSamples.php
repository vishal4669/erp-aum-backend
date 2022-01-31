<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use DB;

class ViewProductSamples extends Model
{
    use HasFactory;
    protected $appends = [];
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
        'parent_name',
        'parameter_name',
        'parent_deleted_at',
        'parameter_deleted_at',
        'pharmacopeia_id',
        'method_name',
        'method_deleted_at'
    ];

    public function getParentDropdownAttribute()
    {
        $data = ViewTest::select('id', 'procedure_name', 'deleted_at')
            ->whereIn('procedure_name', ['Related', 'Assay'])
            ->Orwhere('procedure_name', 'like', 'by%')
            ->where('deleted_at', NULL)
            ->orderBy('id', 'desc')
            ->get()->toarray();

        $is_deleted = $this->parent_deleted_at;
        if ($is_deleted != NULL || $is_deleted != '') {
            $deleted_parent = [
                "id" => $this->parent,
                "procedure_name" => $this->parent_name,
                "deleted_at" => $this->parent_deleted_at
            ];
            array_push($data, $deleted_parent);
        }
        $default_arr = [
            "id" => "",
            "procedure_name" => "",
            "deleted_at" => ""
        ];
        return (isset($data)) ? $data : $default_arr;
    }
    public function getParameterDropdownAttribute()
    {
        $data = ViewTest::select('id', 'procedure_name', 'price', 'deleted_at')
            ->where('procedure_name', '!=', 'Related')
            ->where('procedure_name', '!=', 'Assay')
            ->where('deleted_at', NULL)
            ->where('is_active', 1)
            ->orderBy('id', 'desc')
            ->get()->toarray();

        $is_deleted = $this->parameter_deleted_at;
        if ($is_deleted != NULL || $is_deleted != '') {
            $deleted_parameter = [
                "id" => $this->mst_sample_parameter_id,
                "procedure_name" => $this->parameter_name,
                "deleted_at" => $this->parameter_deleted_at
            ];
            array_push($data, $deleted_parameter);
        }
        $default_arr = [
            "id" => "",
            "procedure_name" => "",
            "deleted_at" => ""
        ];
        return (isset($data)) ? $data : $default_arr;
    }


    /** 
     * Fetch methods where products pharmacopeia & methods pharmacopeia type are equal.
     * request => pharmacopiea_id.
     * response => method dropdown.
     */
    public function getMethodDropdownAttribute()
    {
        $data = ViewMethod::select('id', 'name as method_name', 'deleted_at', 'type')
            ->where('type', $this->pharmacopeia_id)
            ->where('is_active', 1)
            ->where('deleted_at', NULL)
            ->orderBy('id', 'desc')
            ->get()->toarray();

        $is_deleted = $this->method_deleted_at;
        if ($is_deleted != NULL || $is_deleted != '') {
            $deleted_method = [
                "id" => $this->method,
                "method_name" => $this->method_name,
                "deleted_at" => $this->method_deleted_at
            ];
            array_push($data, $deleted_method);
        }
        $default_arr = [
            "id" => "",
            "method_name" => "",
            "deleted_at" => "",
        ];
        return (isset($data)) ? $data : $default_arr;
    }
}
