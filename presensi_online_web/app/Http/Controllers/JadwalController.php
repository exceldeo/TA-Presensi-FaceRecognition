<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Dosen;
use App\Models\Kelas;
use App\Models\Matakuliah;
use App\Models\Jadwal;
use App\Models\Mahasiswa;
use App\Models\JadwalMahasiswa;

class JadwalController extends Controller
{
    public function index()
    {
        $jadwals = array();

        foreach(Jadwal::all() as $jadwal){
            array_push($jadwals, Jadwal::where('jadwal.id', $jadwal->id)->join('dosen', 'dosen.nip', '=', 'jadwal.id_dosen')
                        ->join('matakuliah', 'matakuliah.id', '=', 'jadwal.id_matakuliah')
                        ->join('kelas', 'kelas.id', '=', 'jadwal.id_kelas')
                        ->select('jadwal.id as id_jadwal', 'jadwal.*', 'dosen.*', 'matakuliah.*', 'kelas.*')->first());
        }
        
        return view('dashboard.jadwal.index', compact('jadwals'));
    }

    public function create()
    {
        $dosens = Dosen::where('role', '=', 'dosen')->get();
        $matakuliahs = Matakuliah::all();
        $kelass = Kelas::all();
        return view('dashboard.jadwal.create', compact('dosens', 'matakuliahs', 'kelass'));
        
    }

    public function store(Request $request)
    {
        $this->validate($request, [
            'tahun_ajaran' => 'required',
            'jam_mulai' => 'required',
            'jam_akhir' => 'required',
            'hari' => 'required',
            'semester' => 'required',
            'kelas' => 'required',
            'matakuliah' => 'required',
            'dosen' => 'required',
        ]);
        
        try {

            Jadwal::insert([
                'tahun_ajaran' => $request->tahun_ajaran,
                'jam_mulai' => $request->jam_mulai,
                'jam_akhir' => $request->jam_akhir,
                'hari' => $request->hari,
                'semester' => $request->semester,
                'id_kelas' => $request->kelas,
                'id_matakuliah' => $request->matakuliah,
                'id_dosen' => $request->dosen,
            ]);
            $message = ["success" => "Jadwal berhasil di tambahkan!"];

        } catch (\Throwable $th) {
            dd($th->getMessage());
            $message = ["fail" => $th->getMessage()];
        }

        return redirect()->route('dosen.jadwal.index')->with($message);
    }

    public function show($id)
    {
        $jadwal = Jadwal::where('jadwal.id', $id)->join('dosen', 'dosen.nip', '=', 'jadwal.id_dosen')
                        ->join('matakuliah', 'matakuliah.id', '=', 'jadwal.id_matakuliah')
                        ->join('kelas', 'kelas.id', '=', 'jadwal.id_kelas')
                        ->select('jadwal.id as id_jadwal', 'jadwal.*', 'dosen.*', 'matakuliah.*', 'kelas.*')->first();
        
        $mahasiswas = JadwalMahasiswa::where('jadwal_mahasiswa.id_jadwal', $id)
                        ->join('mahasiswa', 'mahasiswa.nrp', '=', 'jadwal_mahasiswa.nrp_mahasiswa')
                        ->get();

        return view('dashboard.jadwal.mahasiswa.index', compact('jadwal', 'mahasiswas'));
    }

    public function edit($id)
    {
        $dosens = Dosen::where('role', '=', 'dosen')->get();
        $matakuliahs = Matakuliah::all();
        $kelass = Kelas::all();

        $jadwal = Jadwal::where('jadwal.id', $id)->join('dosen', 'dosen.nip', '=', 'jadwal.id_dosen')
                        ->join('matakuliah', 'matakuliah.id', '=', 'jadwal.id_matakuliah')
                        ->join('kelas', 'kelas.id', '=', 'jadwal.id_kelas')
                        ->select('jadwal.id as id_jadwal', 'jadwal.*', 'dosen.*', 'matakuliah.*', 'kelas.*')->first();

        return view('dashboard.jadwal.edit', compact('dosens', 'matakuliahs', 'kelass','jadwal'));
    }

    public function update(Request $request, $id)
    {
        try {
            Jadwal::where('id',$id)->update([
                'tahun_ajaran' => $request->tahun_ajaran,
                'jam_mulai' => $request->jam_mulai,
                'jam_akhir' => $request->jam_akhir,
                'hari' => $request->hari,
                'semester' => $request->semester,
                'id_kelas' => $request->kelas,
                'id_matakuliah' => $request->matakuliah,
                'id_dosen' => $request->dosen,
            ]);

            $message = ["success" => "Jadwal berhasil di edit!"];

            
        } catch (\Throwable $th) {
            dd($th->getMessage());
            $message = ["fail" => $th->getMessage()];
        }

        return redirect()->route('dosen.jadwal.index')->with($message);
    }

    public function createMahasiswa($id)
    {
        $jadwal = Jadwal::where('jadwal.id', $id)->join('dosen', 'dosen.nip', '=', 'jadwal.id_dosen')
                        ->join('matakuliah', 'matakuliah.id', '=', 'jadwal.id_matakuliah')
                        ->join('kelas', 'kelas.id', '=', 'jadwal.id_kelas')
                        ->select('jadwal.id as id_jadwal', 'jadwal.*', 'dosen.*', 'matakuliah.*', 'kelas.*')->first();

        $jadwalMahasiswa = JadwalMahasiswa::where('id_jadwal', $jadwal->id_jadwal)->select("nrp_mahasiswa")->get();
        $mahasiswas = Mahasiswa::whereNotIn('nrp', $jadwalMahasiswa)->get();

        return view('dashboard.jadwal.mahasiswa.create', compact('mahasiswas', 'jadwal'));
    }

    public function storeMahasiswa(Request $request, $id)
    {

        $this->validate($request, [
            'nrp_mahasiswa' => 'required',
        ]);
        
        try {

            JadwalMahasiswa::insert([
                'id_jadwal' => $id,
                'nrp_mahasiswa' => $request->nrp_mahasiswa,
            ]);

            $message = ["success" => "Jadwal Mahasiswa berhasil di tambahkan!"];

        } catch (\Throwable $th) {
            dd($th->getMessage());
            $message = ["fail" => $th->getMessage()];
        }

        return redirect()->route('dosen.jadwal.mahasiswa.index', ['id' => $id])->with($message);
    }

    public function destroyMahasiswa($id, $id_jadwal_mahasiswa)
    {
        try {

            JadwalMahasiswa::where('id', $id_jadwal_mahasiswa)->delete();
            $message = ["success" => "Jadwal Mahasiswa berhasil di hapus!"];

        } catch (\Throwable $th) {
            dd($th->getMessage());
            $message = ["fail" => $th->getMessage()];
        }

        return redirect()->back()->with($message);
    }
}
