<?php

namespace App\Providers;

use App\Events\FormulaCreated;
use App\Listeners\FormulaCreatedListener;
use Illuminate\Auth\Events\Registered;
use Illuminate\Auth\Listeners\SendEmailVerificationNotification;
use Illuminate\Foundation\Support\Providers\EventServiceProvider as ServiceProvider;
use Illuminate\Support\Facades\Event;
use App\Models\Formula;
use App\Observers\FormulaObserver;

class EventServiceProvider extends ServiceProvider
{
    /**
     * The event listener mappings for the application.
     *
     * @var array
     */
    protected $listen = [
        Registered::class => [
            SendEmailVerificationNotification::class,
        ],
        FormulaCreated::class => [
            FormulaCreatedListener::class
        ],
    ];

    /**
     * Register any events for your application.
     *
     * @return void
     */
    public function boot()
    {
        //
        Formula::observe(FormulaObserver::class);
        Formula::observe(FormulaObserver::class);
    }
}
