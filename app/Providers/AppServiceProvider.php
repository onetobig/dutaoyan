<?php

namespace App\Providers;

use App\Models\Post;
use App\Observers\PostObserver;
use Carbon\Carbon;
use Illuminate\Support\ServiceProvider;

class AppServiceProvider extends ServiceProvider
{
    /**
     * Bootstrap any application services.
     *
     * @return void
     */
    public function boot()
    {
        \TCG\Voyager\Models\Post::observe(PostObserver::class);
        Carbon::setLocale("zh");
    }

    /**
     * Register any application services.
     *
     * @return void
     */
    public function register()
    {
        //
    }
}
