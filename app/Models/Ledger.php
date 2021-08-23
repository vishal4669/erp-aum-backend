<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;



class Ledger extends Model
{

    use SoftDeletes;

    protected $table = 'mst_ledgers';

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'mst_companies_id',
        'ledger_name',
        'ledger_opening_balance',
        'ledger_contact_type',
        'mst_groups_id',  
        'balance_type',
        'selected_year',
        'copied_from_year',
        'is_active',
        'created_by',
        'updated_by',
        'created_at',
        'updated_at',
    ];


}
