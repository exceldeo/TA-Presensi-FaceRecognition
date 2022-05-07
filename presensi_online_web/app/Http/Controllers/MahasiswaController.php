<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Mahasiswa;

class MahasiswaController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $mahasiswas =  Mahasiswa::all();
        return view('dashboard.mahasiswa.index', compact('mahasiswas'));
    }

    public function create()
    {
        return view('dashboard.mahasiswa.create');
    }

    public function store(Request $request)
    {
        $this->validate($request, [
            'nrp' => 'required',
            'nama' => 'required',
            'email' => 'required|email',
        ]);
        
        try {
            $user = Mahasiswa::where('nrp',$request->nrp)->first();
            if($user){
                return redirect()->back()->with('fail','NRP atau Email sudah terdaftar');
            }

            Mahasiswa::insert([
                'nrp' => $request->nrp,
                'nama_mahasiswa' => $request->nama,
                'password' => bcrypt($request->password),
                'img_path' => 'belum',
                'is_verifikasi' => 0,
            ]);
            $message = ["success" => "Mahasiswa berhasil di tambahkan!"];

        } catch (\Throwable $th) {
            dd($th->getMessage());
            $message = ["fail" => $th->getMessage()];
        }

        return redirect()->route('dosen.mahasiswa.index')->with($message);
    }

    public function show($nrp)
    {
        //
    }

    public function edit($nrp)
    {
        $mahasiswa = Mahasiswa::where('nrp',$nrp)->first();
        return view('dashboard.mahasiswa.edit',compact('mahasiswa'));
    }

    public function update(Request $request, $nrp)
    {
        try {
            $user = Mahasiswa::where('nrp',$nrp)->first();

            if($user->email != $request->email){
                $userCheck = Mahasiswa::where('email',$request->email)->first();
                if($userCheck){

                    return redirect()->back()->with('fail','Email sudah terdaftar');
                }
            }

            if($request->password){
                $password = bcrypt($request->password);
            } else{
                $password = $user->password;
            }

            Mahasiswa::where('nrp',$nrp)->update([
                'nama_mahasiswa' => $request->nama,
                'password' => $password,
            ]);
            $message = ["success" => "Mahasiswa berhasil di edit!"];

            
        } catch (\Throwable $th) {
            dd($th->getMessage());
            $message = ["fail" => $th->getMessage()];
        }

        return redirect()->route('dosen.mahasiswa.index')->with($message);
    }

    public function destroy($nrp)
    {
        try {

            Mahasiswa::where('nrp', $nrp)->delete();
            $message = ["success" => "Mahasiswa berhasil di hapus!"];

        } catch (\Throwable $th) {
            dd($th->getMessage());
            $message = ["fail" => $th->getMessage()];
        }

        return redirect()->back()->with($message);
    }
}