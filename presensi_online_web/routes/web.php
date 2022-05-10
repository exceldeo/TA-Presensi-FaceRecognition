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
        Route::get('create', 'UserController@create')->name('create');
        Route::post('store', 'UserController@store')->name('store');
        Route::get('{nip}/show', 'UserController@show')->name('show');
        Route::get('{nip}/edit', 'UserController@edit')->name('edit');
        Route::patch('{nip}/edit', 'UserController@update');
        Route::delete('{nip}/delete', 'UserController@destroy')->name('delete');
    });

    Route::prefix('mahasiswa')->name('mahasiswa.')->group(function () { 
        Route::get('/', 'MahasiswaController@index')->name('index');
        Route::get('create', 'MahasiswaController@create')->name('create');
        Route::post('store', 'MahasiswaController@store')->name('store');
        Route::get('{nrp}/show', 'MahasiswaController@show')->name('show');
        Route::get('{nrp}/edit', 'MahasiswaController@edit')->name('edit');
        Route::patch('{nrp}/edit', 'MahasiswaController@update');
        Route::delete('{nrp}/delete', 'MahasiswaController@destroy')->name('delete');
    });

    Route::prefix('training')->name('training.')->group(function () { 
        Route::get('/', 'TrainingController@index')->name('index');
    });

    Route::prefix('matkul')->name('matkul.')->group(function () { 
        Route::get('/', 'MatkulController@index')->name('index');
    });

    Route::prefix('jadwal')->name('jadwal.')->group(function () { 
        Route::get('/', 'JadwalController@index')->name('index');
        Route::get('create', 'JadwalController@create')->name('create');
        Route::post('store', 'JadwalController@store')->name('store');
        // Route::get('{id}/show', 'JadwalController@show')->name('show');
        Route::get('{id}/edit', 'JadwalController@edit')->name('edit');
        Route::patch('{id}/edit', 'JadwalController@update');
        Route::delete('{id}/delete', 'JadwalController@destroy')->name('delete');

        Route::prefix('{id}/mahasiswa')->name('mahasiswa.')->group(function () { 
            Route::get('/', 'JadwalController@show')->name('index');
            Route::get('create', 'JadwalController@createMahasiswa')->name('create');
            Route::post('store', 'JadwalController@storeMahasiswa')->name('store');
            Route::delete('{id_jadwal_mahasiswa}/delete', 'JadwalController@destroyMahasiswa')->name('delete');
            Route::get('{nrp}/show', 'JadwalController@showMahasiswa')->name('show');
            
            Route::prefix('kehadiran')->name('kehadiran.')->group(function () { 
                Route::get('create', 'JadwalController@createKehadiran')->name('create');
                Route::post('store', 'JadwalController@storeKehadiran')->name('store');
                Route::get('{id_presensi}/edit', 'JadwalController@editKehadiran')->name('edit');
                Route::patch('{id_presensi}/edit', 'JadwalController@updateKehadiran');
                Route::delete('{id_presensi}/delete', 'JadwalController@destroyKehadiran')->name('delete');
            });
        });
    });
});