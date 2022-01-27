<?php

namespace App\Models\ModelViews;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use App\Models\ViewTest;
use App\Models\ViewMethod;
use DB;

class ViewQuotationProductInfo extends Model
{
    use HasFactory;
    protected $table = 'view_quotation_product_inofs';
    protected $appends = ['product_dropdown', 'test_dropdown', 'method_dropdown'];
    protected $fillable = [
        "id",
        "mst_companies_id",
        "quotation_id",
        "sample_name",
        "test_required",
        "method_technique",
        "sample_qty",
        "first_sample",
        "sample_in_row",
        "sample_preperation",
        "total",
        "remark",
        "created_by",
        "updated_by",
        "selected_year",
        "copied_from_year",
        "is_active",
        "deleted_at",
        "product_name",
        "pharmacopeia_id",
        "product_deleted_at",
        "procedure_name",
        "test_deleted_at",
        "method_name",
        "method_deleted_at"
    ];


    public function getProductDropdownAttribute()
    {
        $data = DB::table('view_products')
            ->select(
                'id',
                "product_name",
                'deleted_at'
            )
            ->where('is_active', 1)
            ->where('deleted_at', NULL)
            ->orderBy('id', 'desc')
            ->get()->toarray();

        $is_deleted = $this->product_deleted_at;
        if ($is_deleted != NULL || $is_deleted != '') {
            $deleted_product = [
                "id" => $this->sample_name,
                "product_name" => $this->product_name,
                "deleted_at" => $this->product_deleted_at
            ];
            array_push($data, $deleted_product);
        }
        $default_arr = [
            "id" => "",
            "product_name" => "",
            "deleted_at" => "",
        ];
        return (isset($data)) ? $data : $default_arr;
    }
    public function getTestDropdownAttribute()
    {
        $data = ViewTest::select('id', 'procedure_name', 'deleted_at')
            ->where('is_active', 1)
            ->where('deleted_at', NULL)
            ->get()->toarray();

        $is_deleted = $this->test_deleted_at;
        if ($is_deleted != NULL || $is_deleted != '') {
            $deleted_test = [
                "id" => $this->test_required,
                "procedure_name" => $this->procedure_name,
                "deleted_at" => $this->test_deleted_at
            ];
            array_push($data, $deleted_test);
        }
        $default_arr = [
            "id" => "",
            "procedure_name" => "",
            "deleted_at" => "",
        ];
        return (isset($data)) ? $data : $default_arr;
    }
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
                "id" => $this->method_technique,
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
