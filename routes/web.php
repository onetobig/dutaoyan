<?php

Auth::routes();
Route::get('posts', 'PostsController@index')->name('posts.index');
Route::redirect('/', url('posts'));

Route::get('posts/{post}', 'PostsController@show')->name('posts.show');
