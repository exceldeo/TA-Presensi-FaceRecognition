<?php

use Illuminate\Support\Facades\Route;

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

Route::get('/', function () {
    return view('auth.login');
});

Route::get('login', 'DosenController@login')->name('login');
Route::post('auth', 'DosenController@authenticate')->name('auth');
Route::get('logout', 'DosenController@logout')->name('logout');

Route::prefix('dosen')->name('dosen.')->group(function () { 
    Route::get('/', 'PagesController@index')->name('dashboard');

    Route::prefix('kelas')->name('kelas.')->group(function () { 
        Route::get('/', 'KelasController@index')->name('index');
    });

    Route::prefix('user')->name('user.')->group(function () { 
        Route::get('/', 'UserController@index')->name('index');
    });

    Route::prefix('mahasiswa')->name('mahasiswa.')->group(function () { 
        Route::get('/', 'MahasiswaController@index')->name('index');
    });

    Route::prefix('training')->name('training.')->group(function () { 
        Route::get('/', 'TrainingController@index')->name('index');
    });

    Route::prefix('matkul')->name('matkul.')->group(function () { 
        Route::get('/', 'MatkulController@index')->name('index');
    });
});