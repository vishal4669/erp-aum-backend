<?php

namespace App\Models\ModelViews;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use DB;

class ViewCustomerPriceList extends Model
{
    use HasFactory;
    protected $table = 'view_customer_price_lists';
    protected $appends = [];
    protected $fillable = [
        'id',
        'mst_companies_id',
        'customer_id',
        'file_1',
        'file_2',
        'file_3',
        'created_by',
        'updated_by',
        'selected_year',
        'copied_from_year',
        'is_active',
        'updated_at',
        'deleted_at',
        'company_name',
        'contact_type',
        'customer_deleted_at'
    ];

    public function getCustomerDropdownAttribute()
    {
        $data = DB::table('view_customers')
            ->select('id', 'company_name', 'contact_type', 'is_active')
            ->where('contact_type', 'Customer')
            ->where('is_active', 1)
            ->where('deleted_at', NULL)
            ->orderBy('id', 'desc')
            ->get()->toarray();

        $is_deleted = $this->customer_deleted_at;
        if ($is_deleted != NULL || $is_deleted != '') {
            $deleted_customerPriceList = [
                "id" => $this->customer_id,
                "company_name" => $this->company_name,
                "deleted_at" => $this->customer_deleted_at
            ];
            array_push($data, $deleted_customerPriceList);
        }
        $default_arr = [
            "id" => "",
            "company_name" => "",
            "deleted_at" => "",
        ];
        return (isset($data)) ? $data : $default_arr;
    }
}
