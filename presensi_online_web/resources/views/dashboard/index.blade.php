@extends('dashboard.layouts.master')
@section('title')
Dashboard
@endsection
@section('breadcrumb')
<div class="content">
    <nav class="breadcrumb bg-white push" >
        <a href="#">Dashboard</a>
    </nav>
</div>
@endsection
@section('main')
<div class="content">
    <div class="row push" style="margin-bottom: 0px">
        <div class="col-md d-md-flex align-items-md-center text-center">
            <h2 class="text-white mb-0">
                <span class="font-w300 text-primary d-md-inline-block">Selamat datang, <strong>{{Auth::user()->nama_dosen}}</strong></span>
            </h2>
        </div>
    </div>
    <h2 class="text-white mb-0">
        <span class="font-w300 text-primary d-md-inline-block" style="font-size: 70%">Masuk Sebagai
            <strong>
					<span>
                    {{Auth::user()->role}}
                    </span>
            </strong>
        </span>
    </h2>
</div>
<div class="content">
    {{-- <h2 class="content-heading">Selamat Datang</h2> --}}
    <div class="block block-transparent">
        <div class="block-content">
            <div class="row gutters-tiny push">
                <div class="col-6 col-md-3 col-xl-2 mt-2">
                    <a class="h-100 block block-rounded block-bordered block-link-shadow text-center" href="{{route('dosen.user.index')}}">
                        <div class="my-5 block-content">
                            <p><i class="fa fa-3x fa fa-user-circle" style="color: #013880"></i></p>
                            <p class="" style="color: #013880">User</p>
                        </div>
                    </a>
                </div>  
                <div class="col-6 col-md-3 col-xl-2 mt-2">
                    <a class="h-100 block block-rounded block-bordered block-link-shadow text-center" href="{{route('dosen.mahasiswa.index')}}">
                        <div class="my-5 block-content">
                            <p><i class="fa fa-3x fa-graduation-cap" style="color: #013880"></i></p>
                            <p class="" style="color: #013880">Mahasiswa</p>
                        </div>
                    </a>
                </div>  

                <div class="col-6 col-md-3 col-xl-2 mt-2">
                    <a class="h-100 block block-rounded block-bordered block-link-shadow text-center" href="{{route('dosen.kelas.index')}}">
                        <div class="my-5 block-content">
                            <p><i class="fa fa-3x fa-building" style="color: #013880"></i></p>
                            <p class="" style="color: #013880">Kelas</p>
                        </div>
                    </a>
                </div> 
                
                <div class="col-6 col-md-3 col-xl-2 mt-2">
                    <a class="h-100 block block-rounded block-bordered block-link-shadow text-center" href="{{route('dosen.matkul.index')}}">
                        <div class="my-5 block-content">
                            <p><i class="fa fa-3x fa-book" style="color: #013880"></i></p>
                            <p class="" style="color: #013880">Mata Kuliah</p>
                        </div>
                    </a>
                </div> 
                 
                <div class="col-6 col-md-3 col-xl-2 mt-2">
                    <a class="h-100 block block-rounded block-bordered block-link-shadow text-center" href="{{route('dosen.jadwal.index')}}">
                        <div class="my-5 block-content">
                            <p><i class="fa fa-3x fa-list" style="color: #013880"></i></p>
                            <p class="" style="color: #013880">Jadwal</p>
                        </div>
                    </a>
                </div> 
            </div>
        </div>
    </div>
</div>
@endsection