<?php

Auth::routes();
Route::get('/', 'PagesController@root')->name('home');

