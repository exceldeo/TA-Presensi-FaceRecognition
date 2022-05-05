<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Dosen;
use Illuminate\Support\Facades\Auth;

class UserController extends Controller
{
    public function index()
    {
        $users =  Dosen::all();
        return view('dashboard.user.index',compact('users'));
    }

    public function create()
    {
        return view('dashboard.user.create');
    }

    public function store(Request $request)
    {
        $this->validate($request, [
            'nip' => 'required',
            'nama' => 'required',
            'email' => 'required|email',
            'password' => 'required',
            'departemen' => 'required',
            'role' => 'required',
        ]);
        
        try {
            $user = Dosen::where('nip',$request->nip)->orWhere('email',$request->email)->first();
            if($user){
                return redirect()->back()->with('fail','NIP atau Email sudah terdaftar');
            }

            Dosen::insert([
                'nip' => $request->nip,
                'nama_dosen' => $request->nama,
                'password' => bcrypt($request->password),
                'email' => $request->email,
                'departement' => $request->departemen,
                'role' => $request->role,
            ]);
            $message = ["success" => "User berhasil di tambahkan!"];

        } catch (\Throwable $th) {
            dd($th->getMessage());
            $message = ["fail" => $th->getMessage()];
        }

        return redirect()->route('dosen.user.index')->with($message);
    }

    public function show($nip)
    {
        //
    }

    public function edit($nip)
    {
        $user = Dosen::where('nip',$nip)->first();
        return view('dashboard.user.edit',compact('user'));
    }

    public function update(Request $request, $nip)
    {
        try {
            $user = Dosen::where('nip',$nip)->first();

            if($user->email != $request->email){
                $userCheck = Dosen::where('email',$request->email)->first();
                if($userCheck){

                    return redirect()->back()->with('fail','Email sudah terdaftar');
                }
            }

            if($request->password){
                $password = bcrypt($request->password);
            } else{
                $password = $user->password;
            }

            Dosen::where('nip',$nip)->update([
                'nama_dosen' => $request->nama,
                'password' => $password,
                'email' => $request->email,
                'departement' => $request->departemen,
                'role' => $request->role,
            ]);
            $message = ["success" => "User berhasil di edit!"];

            
        } catch (\Throwable $th) {
            dd($th->getMessage());
            $message = ["fail" => $th->getMessage()];
        }
        
        if(Auth::user()->nip == $nip){
            $userLogin = Dosen::where('nip',$nip)->first();
            Auth::login($userLogin);
        }

        return redirect()->route('dosen.user.index')->with($message);
    }

    public function destroy($nip)
    {
        try {
            if(Auth::user()->nip == $nip){
                return redirect()->back()->with('fail','User sedang digunakan');
            }

            Dosen::where('nip', $nip)->delete();
            $message = ["success" => "User berhasil di hapus!"];

        } catch (\Throwable $th) {
            dd($th->getMessage());
            $message = ["fail" => $th->getMessage()];
        }

        return redirect()->back()->with($message);
    }
}
