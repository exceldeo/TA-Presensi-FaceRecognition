<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Dosen;

class UserController extends Controller
{
    public function index()
    {
        $users =  Dosen::all();
        return view('dashboard.user.index',compact('users'));
    }

    public function login()
    {
        
    }

    public function authenticate(Request $request)
    {
        
    }
}
