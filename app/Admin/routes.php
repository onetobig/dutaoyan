<?php

use Illuminate\Routing\Router;

Admin::registerAuthRoutes();

Route::group([
    'prefix'        => config('admin.route.prefix'),
    'namespace'     => config('admin.route.namespace'),
    'middleware'    => config('admin.route.middleware'),
], function (Router $router) {

    $router->get('/', 'HomeController@index');
    $router->get('/posts', 'PostsController@index');
    $router->get('/posts/create', 'PostsController@create');
    $router->post('/posts', 'PostsController@store');
    $router->get('/posts/{id}/edit', 'PostsController@edit');
    $router->put('/posts/{id}', 'PostsController@update');
    $router->post('/upload', 'UploadsController@store');

});
