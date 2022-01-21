<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use DB;

class ViewTestParameters extends Model
{
  use HasFactory;
  protected $appends = ['unit_dropdown', 'formula_dropdown'];
  protected $fillable = [
    "mst_companies_id",
    "mst_test_id",
    "test_by_pass",
    "test_parameter_name",
    "test_alpha",
    "formula",
    "type",
    "unit",
    "value",
    "sort",
    "is_active",
    "created_by",
    "updated_by",
    "created_at",
    "updated_at",
    "selected_year",
    "formula_name",
    "formula_deleted_at",
    "unit_name",
    "unit_deleted_at",
    "deleted_at"
  ];

  public function getFormulaDropdownAttribute()
  {
    $data = DB::table('view_formulas')
      ->select('id', 'formula_name', 'deleted_at')
      ->where('deleted_at', NULL)
      ->get()->toarray();

    $is_deleted = $this->formula_deleted_at;
    if ($is_deleted != NULL || $is_deleted != '') {
      $deleted_formula = [
        "id" => $this->formula,
        "formula_name" => $this->formula_name,
        "deleted_at" => $this->formula_deleted_at
      ];
      array_push($data, $deleted_formula);
    }
    $default_arr = [
      "id" => "",
      "formula_name" => "",
      "deleted_at" => ""
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
}
