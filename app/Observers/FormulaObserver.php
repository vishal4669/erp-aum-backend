<?php

namespace App\Observers;

use App\Models\Formula;

class FormulaObserver
{
    public $afterCommit = true;
    /**
     * Handle the Formula "created" event.
     *
     * @param  \App\Models\Formula  $formula
     * @return void
     */
    public function created(Formula $formula)
    {
        //
        dd("from formula observer",$formula);
    }

    /**
     * Handle the Formula "updated" event.
     *
     * @param  \App\Models\Formula  $formula
     * @return void
     */
    public function updated(Formula $formula)
    {
        //
        if($formula->isDirty('formula_name')){
            // email has changed
            $new_formula = $formula->formula_name; 
            $old_formula = $formula->getOriginal('formula_name');
          }
    }

    /**
     * Handle the Formula "deleted" event.
     *
     * @param  \App\Models\Formula  $formula
     * @return void
     */
    public function deleted(Formula $formula)
    {
        //
    }

    /**
     * Handle the Formula "restored" event.
     *
     * @param  \App\Models\Formula  $formula
     * @return void
     */
    public function restored(Formula $formula)
    {
        //
    }

    /**
     * Handle the Formula "force deleted" event.
     *
     * @param  \App\Models\Formula  $formula
     * @return void
     */
    public function forceDeleted(Formula $formula)
    {
        //
    }
}
