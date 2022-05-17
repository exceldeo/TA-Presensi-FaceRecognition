<?php

namespace App\Http\Controllers\api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Mahasiswa;

class ApiController extends Controller
{
    public function login(Request $request)
    {
        $mahasiswa = Mahasiswa::where('nrp', $request->nrp)->where('password', $request->password)->first();

        if ($mahasiswa) {
            return response()->json(['user' => $mahasiswa], 200);
        } else {
            return response()->json(['error' => 'Unauthorised'], 401);
        }
    }

    public function readUserById($nrp)
    {
        $mahasiswa = Mahasiswa::where('nrp', $nrp)->first();

        if ($mahasiswa) {
            return response()->json(['user' => $mahasiswa], 200);
        } else {
            return response()->json(['error' => 'Mahasiswa tidak ditemukan'], 401);
        }
    }
    
}
