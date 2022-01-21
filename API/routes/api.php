<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
  
use App\Http\Controllers\RegisterController;
use App\Http\Controllers\StatusController;
use App\Http\Controllers\EventController;
use App\Http\Controllers\DivisionController;
use App\Http\Controllers\UserController;
use App\Http\Controllers\QuoteController;
use App\Http\Controllers\UploadController;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/
// Route::post('register', [RegisterController::class, 'register']);
Route::post('login', [RegisterController::class, 'login']);
Route::get('event/active', [EventController::class, 'active']);

Route::middleware('auth:api')->group( function () {
    Route::post('event/activated/{id}', [EventController::class, 'setActive']);
    Route::post('event/inactivated/{id}', [EventController::class, 'setInActive']);
    Route::get('event', [EventController::class, 'index']);
    Route::get('event/detail/{id}', [EventController::class, 'show']);
    Route::get('event/list', [EventController::class, 'list']);
    Route::post('event/create', [EventController::class, 'store']);
    Route::post('event/update', [EventController::class, 'update']);
    Route::delete('event/delete/{id}', [EventController::class, 'delete']);

    Route::get('division', [DivisionController::class, 'index']);
    Route::get('division/detail/{id}', [DivisionController::class, 'show']);
    Route::get('division/list', [DivisionController::class, 'list']);
    Route::post('division/create', [DivisionController::class, 'store']);
    Route::post('division/update', [DivisionController::class, 'update']);
    Route::delete('division/delete/{id}', [DivisionController::class, 'delete']);

    Route::post('user/import', [UserController::class, 'import']);
    Route::get('user', [UserController::class, 'index']);
    Route::get('user/detail/{id}', [UserController::class, 'show']);
    Route::get('user/list', [UserController::class, 'list']);
    Route::post('user/create', [UserController::class, 'store']);
    Route::post('user/update', [UserController::class, 'update']);
    Route::delete('user/delete/{id}', [UserController::class, 'delete']);
    Route::delete('user/empty', [UserController::class, 'empty']);

    Route::get('quote', [QuoteController::class, 'index']);
    Route::get('quote/detail/{id}', [QuoteController::class, 'show']);
    Route::get('quote/list', [QuoteController::class, 'list']);
    Route::post('quote/create', [QuoteController::class, 'store']);
    Route::post('quote/update', [QuoteController::class, 'update']);
    Route::delete('quote/delete/{id}', [QuoteController::class, 'delete']);
    Route::delete('quote/empty', [QuoteController::class, 'empty']);
    
    Route::get('status', [StatusController::class, 'show']);
    Route::post('upload', [UploadController::class, 'index']);
});