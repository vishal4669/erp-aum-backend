<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use App\Helpers\Helper;

class MstProduct extends Model
{
    use HasFactory;
    use SoftDeletes;
    protected $fillable = [
        'mst_companies_id',
        'product_name',
        'product_generic',
        'marker_specification',
        'pharmacopeia_id',
        'generic_product_id',
        'packing_detail',
        'sample_description',
        'hsn_code',
        'is_generic',
        'selected_year',
        'copied_from_year',
        'is_active',
        'created_by',
        'updated_by',
        'created_at',
        'updated_at',
    ];

    public function samples()
    {
        return $this->hasMany(MstProductSample::class);
    }

    public function pharmacopeia()
    {
        return $this->hasOne(Pharmacopeia::class, 'id', 'pharmacopeia_id');
    }

    public function generic()
    {
        return $this->hasOne(MstProduct::class, 'id', 'generic_product_id');
    }
    //generic product for edit generic dropdown
    public function generic_product_id()
    {
        return $this->hasOne(MstProduct::class, 'id', 'generic_product_id')->withTrashed();
    }

    public function created_by()
    {
        return $this->hasOne(User::class, 'id', 'created_by');
    }
    public function updated_by()
    {
        return $this->hasOne(User::class, 'id', 'updated_by');
    }

    // get product detail for edit booking api
    public function all_pharmacopeia()
    {
        return $this->hasOne(Pharmacopeia::class, 'id', 'pharmacopeia_id')->withTrashed();
    }

    public function all_generic()
    {
        return $this->hasOne(MstProduct::class, 'id', 'generic_product_id')->withTrashed();
    }

     /**
     * Get the pharmacopiea detail associated with the BookingSampleDetail for AssignTests table
     *
     * @return \Illuminate\Database\Eloquent\Relations\HasOne
     */
     public function pharmacopiea_detail()
     {
         return $this->hasOne(Pharmacopeia::class, 'id', 'pharmacopeia_id')->withTrashed();
     }

     //Product data for BookingPrintController
     public function generic_product_data()
    {
        return $this->hasOne(MstProduct::class, 'id', 'generic_product_id')
        ->withTrashed()
        ->withDefault([
            "id"=>"",
            "name_of_sample"=> "",
            "product_generic"=> "",
            "generic_product_id"=>"",
            "generic_product_data"=>array(
                "id"=>"",
                "generic_name"=> ""
            )
            
        ]);
    }
}
