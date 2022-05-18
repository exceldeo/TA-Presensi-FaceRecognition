<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

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
Route::post('login', 'api\ApiController@login');
Route::get('dosen', 'api\ApiController@readDosen');
Route::get('{nrp}/kelas', 'api\ApiController@readKelasByNrp');
Route::get('{nrp}/mahasiswa', 'api\ApiController@getMahasiswaByNrp');
Route::get('{jadwalMahasiswa}/presensi', 'api\ApiController@getPresensiByJadwalMahasiswa');
