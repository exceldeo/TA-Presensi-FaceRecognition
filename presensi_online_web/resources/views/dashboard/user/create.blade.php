@extends('dashboard.layouts.master')
@section('title')
Add User
@endsection
@section('css')
<link rel="stylesheet"
    href="{{ URL::to('/') }}/template/js/plugins/bootstrap-datepicker/css/bootstrap-datepicker3.min.css">
@endsection
@section('breadcrumb')
<div class="content">
    <nav class="breadcrumb bg-white push">
        <a href="{{route('dosen.dashboard')}}" class="breadcrumb-item">Dashboard</a>
        <a href="{{route('dosen.user.index')}}" class="breadcrumb-item">Managemen User</a>
        <a href="{{route('dosen.user.create')}}" class="breadcrumb-item active">Tambah User</a>
    </nav>
</div>
@endsection
@section('main')
<!-- Page Content -->
<div class="content">
    <div class="block">
       <div class="block-header block-header-default">
          <div class="row">
            <a href="{{route('dosen.user.index')}}" id="arrow-back" style="padding: 0px 0px 0px 12px;">
                <button type="button" class="btn btn-sm btn-circle btn-secondary mr-5 mb-5">
                    <i class="fa fa-arrow-left"></i>
                </button>
            </a>
            <div class="font-size-lg font-w600">&emsp;Tambah User</div>
          </div>
       </div>

       <form action="{{route('dosen.user.store')}}" method="post" id="question_form">
            {{ csrf_field() }}
            <div class="block-content">
                <div class="row">
                    <div class="col-md-12">
                        <div class="form-group">
                            <label for="">NIP</label>
                            <input autocomplete="off" type="text" class="form-control" id="input-name" name="nip">
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12">
                        <div class="form-group">
                            <label for="">Nama</label>
                            <input autocomplete="off" type="text" class="form-control" id="input-name" name="nama">
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12">
                        <div class="form-group">
                            <label for="">email</label>
                            <input autocomplete="off" type="text" class="form-control" id="input-email" name="email">
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12">
                        <div class="form-group">
                            <label for="">Password</label>
                            <input autocomplete="off" type="password" class="form-control" id="input-name" name="password">
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12">
                        <div class="form-group">
                            <label class="" for="example-select">Departemen</label>
                            <select autocomplete="off" class="form-control" id="example-select" name="departemen">
                                <option value="Fisika">Fisika</option>
                                <option value="Matematika">Matematika</option>
                                <option value="Statistika">Statistika</option>
                                <option value="Kimia">Kimia</option>
                                <option value="Biologi">Biologi</option>
                                <option value="Aktuaria">Aktuaria</option>
                                <option value="Teknik Perkapalan">Teknik Perkapalan</option>
                                <option value="Teknik Sistem Perkapalan">Teknik Sistem Perkapalan</option>
                                <option value="Teknik Kelautan">Teknik Kelautan</option>
                                <option value="Teknik Transportasi Laut">Teknik Transportasi Laut</option>
                                <option value="Teknik Mesin">Teknik Mesin</option>
                                <option value="Teknik Kimia">Teknik Kimia</option>
                                <option value="Teknik Fisika">Teknik Fisika</option>
                                <option value="Teknik Sistem dan Industri">Teknik Sistem dan Industri</option>
                                <option value="Teknik Material">Teknik Material</option>
                                <option value="Teknik Elektro">Teknik Elektro</option>
                                <option value="Teknik Biomedik">Teknik Biomedik</option>
                                <option value="Teknik Komputer">Teknik Komputer</option>
                                <option value="Teknik Informatika">Teknik Informatika</option>
                                <option value="Sistem Informasi">Sistem Informasi</option>
                                <option value="Teknologi Informasi">Teknologi Informasi</option>
                                <option value="Teknik Sipil">Teknik Sipil</option>
                                <option value="Arsitektur">Arsitektur</option>
                                <option value="Teknik Lingkungan">Teknik Lingkungan</option>
                                <option value="Perencanaan Wilayah dan Kota">Perencanaan Wilayah dan Kota</option>
                                <option value="Teknik Geomatika">Teknik Geomatika</option>
                                <option value="Teknik Geofisika">Teknik Geofisika</option>
                                <option value="Desain Produk Industri">Desain Produk Industri</option>
                                <option value="Desain Interior">Desain Interior</option>
                                <option value="Desain Komunikasi Visual">Desain Komunikasi Visual</option>
                                <option value="Manajemen Bisnis">Manajemen Bisnis</option>
                                <option value="Studi Pembangunan">Studi Pembangunan</option>
                                <option value="Manajemen Teknologi">Manajemen Teknologi</option>
                                <option value="Teknik Infrastruktur Sipil">Teknik Infrastruktur Sipil</option>
                                <option value="Teknik Mesin Industri">Teknik Mesin Industri</option>
                                <option value="Teknik Elektro Otomasi">Teknik Elektro Otomasi</option>
                                <option value="Teknik Kimia Industri">Teknik Kimia Industri</option>
                                <option value="Teknik Instrumentasi">Teknik Instrumentasi</option>
                                <option value="Statistika Bisnis">Statistika Bisnis</option>
                            </select>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12">
                        <div class="form-group">
                            <label class="" for="example-select">Role</label>
                            <select autocomplete="off" class="form-control" id="example-select" name="role">
                                <option value="admin">admin</option>
                                <option value="dosen">dosen</option>
                            </select>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-12 mb-10">
                        <div class="form-group">
                            <button type="submit" class="btn btn-sm btn-its-primary pull-right"><i class="fa fa-save mr-5"></i> Simpan</button>
                        </div>
                    </div>
                </div>
            </div>
        </form>
    </div>
 </div>


<!-- END Page Content -->
@endsection
@section('js')
<script src="{{ URL::to('/') }}/template/js/plugins/bootstrap-datepicker/js/bootstrap-datepicker.min.js"></script>
<script>
    jQuery(function () {
        Codebase.helpers(['flatpickr', 'datepicker', 'colorpicker', 'maxlength', 'select2', 'masked-inputs',
            'rangeslider', 'tags-inputs'
        ]);
    });
</script>
@endsection