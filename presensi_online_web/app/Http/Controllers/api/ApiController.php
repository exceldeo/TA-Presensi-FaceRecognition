<?php

namespace App\Http\Controllers\api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Mahasiswa;
use Illuminate\Support\Facades\Hash;
use App\Models\Jadwal;
use App\Models\Dosen;
use App\Models\JadwalMahasiswa;
use App\Models\Presensi;
use App\Models\PresensiMahasiswa;

class ApiController extends Controller
{
    public function login(Request $request)
    {
        $mahasiswa = Mahasiswa::where('nrp', $request->nrp)->first();
        if (is_null($mahasiswa) ) {
            return response()->json([
                'status' => 'error',
                'message' => 'NRP tidak ditemukan'
            ], 200);
        }
        $check = Hash::check(request('password'), $mahasiswa->password);
        if ($check ) {
            return response()->json([
                'status' => 'success',
                'data' => $mahasiswa
            ], 200);
        } else {
            return response()->json([
                'status' => 'error',
                'message' => 'Password salah'
            ], 200);
        }
    }

    public function getMahasiswaByNrp($nrp)
    {
        $mahasiswa = Mahasiswa::where('nrp', $nrp)->first();
        if (is_null($mahasiswa) ) {
            return response()->json([
                'status' => 'error',
                'message' => 'NRP tidak ditemukan'
            ], 200);
        }
        else{
            return response()->json([
                'status' => 'success',
                'data' => $mahasiswa
            ], 401);
        } 
    }

    public function readKelasByNrp($nrp)
    {
        $jadwals = array();
        $jadwalMahasiswas = JadwalMahasiswa::where('nrp_mahasiswa', $nrp)->get();
        foreach($jadwalMahasiswas as $jadwalMahasiswa){
            $jadwal = Jadwal::where('jadwal.id', $jadwalMahasiswa->id_jadwal)
                    ->join('dosen', 'dosen.nip', '=', 'jadwal.id_dosen')
                    ->join('matakuliah', 'matakuliah.id', '=', 'jadwal.id_matakuliah')
                    ->join('kelas', 'kelas.id', '=', 'jadwal.id_kelas')
                    ->join('jadwal_mahasiswa', 'jadwal_mahasiswa.id_jadwal', '=', 'jadwal.id')
                    ->select('jadwal.id as id_jadwal', 'jadwal.*', 'dosen.*', 'matakuliah.*', 'kelas.*','jadwal_mahasiswa.id as id_jadwal_mahasiswa')->first();
            array_push($jadwals, $jadwal);
        }

        if ($jadwals) {
            return response()->json([
                'status' => 'success',
                'data' => $jadwals
            ], 200);
        } else {
            return response()->json([
                'status' => 'error',
                'message' => 'Tidak ada kelas'
            ], 401);
        }
    }

    public function getPresensiByJadwalMahasiswa($jadwalMahasiswa)
    {
        $presensis = array();
        $presensiMahasiswas = PresensiMahasiswa::where('id_jadwal_mahasiswa', $jadwalMahasiswa)->get();

        foreach($presensiMahasiswas as $presensiMahasiswa){
            $presensi = PresensiMahasiswa::where('presensi_mahasiswa.id', $presensiMahasiswa->id)
                        ->join('presensi','presensi.id','=', 'presensi_mahasiswa.id_presensi')
                        ->select('presensi_mahasiswa.tanggal as tanggal_absen', 'presensi.tanggal as tanggal_presensi', 'presensi.*', 'presensi_mahasiswa.*')->first();
            array_push($presensis, $presensi);
        }

        // $mahasiswa = Mahasiswa::where('nrp', $nrp)->first();
        if (is_null($presensis) ) {
            return response()->json([
                'status' => 'error',
                'message' => 'Presensi tidak ditemukan'
            ], 401);
        }
        else{
            return response()->json([
                'status' => 'success',
                'data' => $presensis
            ], 200);
        } 
    }

    public function absensi($nrp, $kodePresensi){
        $presensi = JadwalMahasiswa::join('presensi_mahasiswa','presensi_mahasiswa.id_jadwal_mahasiswa', '=', 'jadwal_mahasiswa.id')
                    ->join('presensi', 'presensi.id' ,'=',  'presensi_mahasiswa.id_presensi')
                    ->where('jadwal_mahasiswa.nrp_mahasiswa', $nrp)
                    ->where('presensi.kode_presensi', $kodePresensi)
                    ->select('presensi_mahasiswa.*')
                    ->first();

        if (is_null($presensi) ) {
            return response()->json([
                'status' => 'error',
                'message' => 'Kode Presensi tidak ditemukan'
            ], 401);
        }
        else{
            return response()->json([
                'status' => 'success',
                'data' => $presensi
            ], 200);
        } 
        
    }

    public function readDosen()
    {
        $dosen = Dosen::all();

        if ($dosen) {
            return response()->json(['data' => $dosen], 200);
        } else {
            return response()->json(['error' => 'Mahasiswa tidak ditemukan'], 401);
        }
    }
    
}
