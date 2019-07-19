<?php

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

use App\Articles;

Route::get('/', function () {
    return view('app');
});

Route::prefix('auth')->group(function () {
    Route::post('register', 'UserController@register');
    Route::post('login', 'UserController@login');
    Route::post('logout', 'UserController@logout');
    Route::get('init', 'UserController@init');
});

Route::prefix('categories')->group(function () {
    Route::get('/all', 'CategoryController@getCats');
});

Route::prefix('article')->group(function () {
    Route::get('/', 'ArticleController@getArticles');
    //Route::get('/{id}', ['uses' =>'ArticleController@getArticlesByPaginate']);
    Route::get('/all', ['uses' =>'ArticleController@getAllArticles']);
    Route::get('/featured', ['uses' =>'ArticleController@getFeaturedArticles']);
    Route::put('/update-article', 'ArticleController@updateArticle');
    Route::post('/create-article', 'ArticleController@createArticle');
});

Route::prefix('photos')->group(function () {
    Route::get('/all', 'PhotoController@viewPhotos');
    Route::get('/file/{id}', 'PhotoController@viewUploadedPhoto');
    Route::post('/upload', 'PhotoController@uploadPhoto');
});

Route::get('pagination', 'ArticleController@getArticlesByPaginate');

Route::get('storage/{filename}', function ($filename)
{
    $path = storage_path('public/' . $filename);
    if (!File::exists($path)) {
        abort(404);
    }
    $file = File::get($path);
    $type = File::mimeType($path);
    $response = Response::make($file, 200);
    $response->header("Content-Type", $type);
    return $response;
});

