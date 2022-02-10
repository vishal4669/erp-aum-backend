<?php

namespace App\Models\ModelViews;

use App\Models\ViewMethod;
use App\Models\ViewTest;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use DB;

class ViewBookingTests extends Model
{
    use HasFactory;
    protected $fillable = [
        "mst_companies_id",
        "booking_id",
        "parent_child",
        "p_sr_no",
        "by_pass",
        "parent",
        "product_details",
        "test_id",
        "label_claim",
        "label_claim_percentage",
        "min_limit",
        "max_limit",
        "amount",
        "result",
        "result2",
        "label_claim_result",
        "label_claim_unit",
        "mean",
        "unit",
        "na_content",
        "final_na_content",
        "expanded_uncertainty",
        "division",
        "method",
        "test_time",
        "test_date_time",
        "approval_date_time",
        "approved",
        "chemist_id",
        "assigned_date",
        "created_by",
        "updated_by",
        "created_at",
        "updated_at",
        "selected_year",
        "copied_from_year",
        "is_active",
        "deleted_at",
        "parent_name",
        "parent_deleted_at",
        "test_name",
        "test_deleted_at",
        "method_name",
        "method_deleted_at",
        "unit_name",
        "unit_deleted_at",
        "chemist_name",
        "chemist_deleted_at",
        "pharmacopeia_id"
    ];

    public function getParentNameAttribute()
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

    public function getTestDropdownAttribute()
    {
        $data = ViewTest::select('id', 'procedure_name', 'price', 'deleted_at')
            ->where('procedure_name', '!=', 'Related')
            ->where('procedure_name', '!=', 'Assay')
            ->where('deleted_at', NULL)
            ->where('is_active', 1)
            ->orderBy('id', 'desc')
            ->get()->toarray();

        $is_deleted = $this->test_deleted_at;
        if ($is_deleted != NULL || $is_deleted != '') {
            $deleted_testname = [
                "id" => $this->test_id,
                "procedure_name" => $this->test_name,
                "deleted_at" => $this->test_deleted_at
            ];
            array_push($data, $deleted_testname);
        }
        $default_arr = [
            "id" => "",
            "procedure_name" => "",
            "deleted_at" => ""
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

    public function getUnitDropdownAttribute()
    {
        $data = DB::table('view_units')
            ->select('id', 'unit_name', 'deleted_at')
            ->where('deleted_at', NULL)
            ->get()->toarray();

        $is_deleted = $this->unit_deleted_at;
        if ($is_deleted != NULL || $is_deleted != '') {
            $deleted_unit = [
                "id" => $this->unit,
                "unit_name" => $this->unit_name,
                "deleted_at" => $this->unit_deleted_at
            ];
            array_push($data, $deleted_unit);
        }
        $default_arr = [
            "id" => "",
            "unit_name" => "",
            "deleted_at" => ""
        ];
        return (isset($data)) ? $data : $default_arr;
    }

    public function getChemistDropdownAttribute()
    {
        $data = DB::table('view_users')
            ->select('id', 'chemist_full_name as chemist_name', 'department_name', 'deleted_at')
            ->whereIn('department_name', ['QA', 'QC', 'QAQC'])
            ->where('deleted_at', NULL)
            ->get()->toarray();

        $is_deleted = $this->chemist_deleted_at;
        if ($is_deleted != NULL || $is_deleted != '') {
            $deleted_chemist = [
                "id" => $this->chemist_id,
                "chemist_name" => $this->chemist_name,
                "deleted_at" => $this->chemist_deleted_at
            ];
            array_push($data, $deleted_chemist);
        }
        $default_arr = [
            "id" => "",
            "chemist_name" => "",
            "deleted_at" => ""
        ];
        return (isset($data)) ? $data : $default_arr;
    }
}
