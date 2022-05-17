<?php

namespace App\Http\Controllers\api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Mahasiswa;
use Illuminate\Support\Facades\Hash;
use App\Models\Jadwal;
use App\Models\Dosen;


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

    // public function readKelasByNrp($nrp)
    // {
    //     $jadwalMahasiswa
    //     $jadwal = Jadwal::where('jadwal.id', $jadwal->id)->join('dosen', 'dosen.nip', '=', 'jadwal.id_dosen')
    //             ->join('matakuliah', 'matakuliah.id', '=', 'jadwal.id_matakuliah')
    //             ->join('kelas', 'kelas.id', '=', 'jadwal.id_kelas')
    //             ->select('jadwal.id as id_jadwal', 'jadwal.*', 'dosen.*', 'matakuliah.*', 'kelas.*')->first();

    //     if ($mahasiswa) {
    //         return response()->json(['user' => $mahasiswa], 200);
    //     } else {
    //         return response()->json(['error' => 'Mahasiswa tidak ditemukan'], 401);
    //     }
    // }

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
