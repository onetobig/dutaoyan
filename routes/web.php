<?php

Auth::routes();
Route::get('posts', 'PostsController@index')->name('posts.index');

Route::get('posts/{post}/{slug?}', 'PostsController@show')->name('posts.show');


Route::group(['prefix' => 'admin'], function () {
    Voyager::routes();
});

Route::redirect('/', url('posts'));
