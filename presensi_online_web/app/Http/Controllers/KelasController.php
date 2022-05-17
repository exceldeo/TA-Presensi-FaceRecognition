<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Kelas;

class KelasController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $classes =  Kelas::all();
        return view('dashboard.kelas.index', compact('classes'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        return view('dashboard.kelas.create');
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $this->validate($request, [
            'nama' => 'required',
            'lokasi' => 'required',
        ]);
        
        try {
            $user = Kelas::where('nama_kelas',$request->nama)->first();
            if($user){
                return redirect()->back()->with('fail','Kelas sudah ada');
            }

            Kelas::insert([
                'nama_kelas' => $request->nama,
                'lokasi_kelas' => $request->lokasi,
            ]);
            $message = ["success" => "Kelas berhasil di tambahkan!"];

        } catch (\Throwable $th) {
            dd($th->getMessage());
            $message = ["fail" => $th->getMessage()];
        }

        return redirect()->route('dosen.kelas.index')->with($message);
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        $kelas = Kelas::where('id',$id)->first();
        return view('dashboard.kelas.edit',compact('kelas'));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        try {
            $kelas = Kelas::where('id',$id)->first();

            Kelas::where('id',$id)->update([
                'nama_kelas' => $request->nama,
                'lokasi_kelas' => $request->lokasi,
            ]);
            $message = ["success" => "Kelas berhasil di edit!"];

            
        } catch (\Throwable $th) {
            dd($th->getMessage());
            $message = ["fail" => $th->getMessage()];
        }

        return redirect()->route('dosen.kelas.index')->with($message);
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        try {

            Kelas::where('id', $id)->delete();
            $message = ["success" => "Kelas berhasil di hapus!"];

        } catch (\Throwable $th) {
            dd($th->getMessage());
            $message = ["fail" => $th->getMessage()];
        }

        return redirect()->back()->with($message);
    }
}
