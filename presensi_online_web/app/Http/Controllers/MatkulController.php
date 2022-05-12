<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Matakuliah;

class MatkulController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $matkuls =  Matakuliah::all();
        return view('dashboard.matkul.index', compact('matkuls'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        return view('dashboard.matkul.create');
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
            'kode' => 'required',
            'nama' => 'required',
            'departemen' => 'required',
        ]);
        
        try {
            $matkul = Matakuliah::where('kode_matakuliah',$request->kode)->first();
            if($matkul){
                return redirect()->back()->with('fail','Mata Kuliah sudah ada');
            }

            Matakuliah::insert([
                'kode_matakuliah' => $request->kode,
                'nama_matakuliah' => $request->nama,
                'departement' => $request->departemen,
            ]);
            $message = ["success" => "Mata Kuliah berhasil di tambahkan!"];

        } catch (\Throwable $th) {
            dd($th->getMessage());
            $message = ["fail" => $th->getMessage()];
        }

        return redirect()->route('dosen.matkul.index')->with($message);
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
        $matkul = Matakuliah::where('id',$id)->first();
        return view('dashboard.matkul.edit',compact('matkul'));
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
            $matkul = Matakuliah::where('id',$id)->first();

            Matakuliah::where('id',$id)->update([
                'kode_matakuliah' => $request->kode,
                'nama_matakuliah' => $request->nama,
                'departement' => $request->departemen,
            ]);
            $message = ["success" => "Mata Kuliah berhasil di edit!"];

            
        } catch (\Throwable $th) {
            dd($th->getMessage());
            $message = ["fail" => $th->getMessage()];
        }

        return redirect()->route('dosen.matkul.index')->with($message);
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

            Matakuliah::where('id', $id)->delete();
            $message = ["success" => "Mata Kuliah berhasil di hapus!"];

        } catch (\Throwable $th) {
            dd($th->getMessage());
            $message = ["fail" => $th->getMessage()];
        }

        return redirect()->back()->with($message);
    }
}
