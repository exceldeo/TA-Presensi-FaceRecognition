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
            ], 401);
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
            ], 401);
        }
    }

    public function getMahasiswaByNrp($nrp)
    {
        $mahasiswa = Mahasiswa::where('nrp', $nrp)->select('nrp', 'nama_mahasiswa', 'tahun_masuk', 'email', 'departement')->first();
        if (is_null($mahasiswa) ) {
            return response()->json([
                'status' => 'error',
                'message' => 'NRP tidak ditemukan'
            ], 404);
        }
        else{
            return response()->json([
                'status' => 'success',
                'data' => $mahasiswa
            ], 200);
        } 
    }

    public function readKelasByNrp($nrp)
    {
        $jadwals = array();
        $jadwalMahasiswas = JadwalMahasiswa::where('nrp_mahasiswa', $nrp)->get();
        foreach($jadwalMahasiswas as $jadwalMahasiswa){
            $jadwal = Jadwal::where('jadwal.id', $jadwalMahasiswa->id_jadwal)
                    ->where('jadwal_mahasiswa.nrp_mahasiswa', $nrp)
                    ->join('dosen', 'dosen.nip', '=', 'jadwal.id_dosen')
                    ->join('matakuliah', 'matakuliah.id', '=', 'jadwal.id_matakuliah')
                    ->join('kelas', 'kelas.id', '=', 'jadwal.id_kelas')
                    ->join('jadwal_mahasiswa', 'jadwal_mahasiswa.id_jadwal', '=', 'jadwal.id')
                    ->select('jadwal.id as id_jadwal', 'jadwal.hari', 'jadwal.jam_mulai', 'jadwal.jam_akhir', 'jadwal.id_kelas', 'jadwal.id_matakuliah', 'dosen.nip', 'dosen.nama_dosen', 'matakuliah.kode_matakuliah', 'matakuliah.nama_matakuliah', 'kelas.nama_kelas', 'kelas.lokasi_kelas','jadwal_mahasiswa.id as id_jadwal_mahasiswa')->first();
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
                        ->select('presensi_mahasiswa.tanggal as tanggal_absen', 'presensi.tanggal as tanggal_presensi', 'presensi.jam_mulai', 'presensi.jam_akhir', 'presensi_mahasiswa.jam', 'presensi_mahasiswa.status')->first();
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

    public function getJadwalByJadwalId($id_jadwal)
    {

        $jadwal = Jadwal::where('jadwal.id', $id_jadwal)
                ->join('dosen', 'dosen.nip', '=', 'jadwal.id_dosen')
                ->join('matakuliah', 'matakuliah.id', '=', 'jadwal.id_matakuliah')
                ->join('kelas', 'kelas.id', '=', 'jadwal.id_kelas')
                ->join('jadwal_mahasiswa', 'jadwal_mahasiswa.id_jadwal', '=', 'jadwal.id')
                ->select('jadwal.id as id_jadwal', 'jadwal.*', 'dosen.*', 'matakuliah.*', 'kelas.*','jadwal_mahasiswa.id as id_jadwal_mahasiswa')->first();


        if ($jadwal) {
            return response()->json([
                'status' => 'success',
                'data' => $jadwal
            ], 200);
        } else {
            return response()->json([
                'status' => 'error',
                'message' => 'Tidak ada kelas'
            ], 401);
        }
    }

    public function absensi($nrp, $kodePresensi){
        $presensi = JadwalMahasiswa::join('presensi_mahasiswa','presensi_mahasiswa.id_jadwal_mahasiswa', '=', 'jadwal_mahasiswa.id')
                    ->join('presensi', 'presensi.id' ,'=',  'presensi_mahasiswa.id_presensi')
                    ->where('jadwal_mahasiswa.nrp_mahasiswa', $nrp)
                    ->where('presensi.kode_presensi', $kodePresensi)
                    ->select('presensi_mahasiswa.status', 'presensi.id_jadwal','presensi_mahasiswa.id')
                    ->first();

                    // dd($presensi);

        if (is_null($presensi) || $presensi->status == 1) {
            return response()->json([
                'status' => 'error',
                'message' => 'Kode Presensi tidak ditemukan atau anda sudah absen'
            ], 401);
        }
        else{
            $jadwal = Jadwal::where('jadwal.id', $presensi->id_jadwal)
            ->join('dosen', 'dosen.nip', '=', 'jadwal.id_dosen')
            ->join('matakuliah', 'matakuliah.id', '=', 'jadwal.id_matakuliah')
            ->join('kelas', 'kelas.id', '=', 'jadwal.id_kelas')
            ->join('jadwal_mahasiswa', 'jadwal_mahasiswa.id_jadwal', '=', 'jadwal.id')
            ->select('jadwal.id as id_jadwal', 'jadwal.*', 'dosen.*', 'matakuliah.*', 'kelas.*','jadwal_mahasiswa.id as id_jadwal_mahasiswa')->first();
            
            $data["hari"] = $jadwal->hari;
            $data["jam_mulai"] = $jadwal->jam_mulai;
            $data["nama_dosen"] = $jadwal->nama_dosen;
            $data["kode_matakuliah"] = $jadwal->kode_matakuliah;
            $data["nama_matakuliah"] = $jadwal->nama_matakuliah;
            $data["nama_kelas"] = $jadwal->nama_kelas;
            $data["id_presensi_mahasiswa"] = $presensi->id;
            
            return response()->json([
                'status' => 'success',
                'data' => $data
            ], 200);
        }     
    }
    
    public function updateAbsensi($idPresensi, Request $request){
        $presensi = PresensiMahasiswa::where('id', $idPresensi)
                    ->update([
                        'tanggal' => date('Y-m-d'),
                        'jam'   => date('H:i:s'),
                        'status' => 1
                    ]);
                    
        $base64_string = $request->img; 
        $image_name = "D:\\excel deo\\SMT 8\\TA\\TA-Presensi-FaceRecognition\\presensi_online_flask_masker\\";

        $image    = "/cek.png";
        $fullName = $image_name.$image;
        $ifp = fopen($fullName, "wb");
        fwrite($ifp, base64_decode($base64_string));
        fclose($ifp);

        $check_mask = file_get_contents("http://127.0.0.1:5000/predict_mask");
        //cek pemakaian masker
        if (is_null($presensi) ) {
            return response()->json([
                'status' => 'error',
                'message' => 'Kode Presensi tidak ditemukan'
            ], 401);
        }
        else if($check_mask == "no_mask"){
            return response()->json([
                'status' => 'error',
                'message' => 'Anda tidak memakai masker'
            ], 401);
        }
        else{
            return response()->json([
                'status' => 'success',
                'data' => $check_mask
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
