@extends('dashboard.layouts.master')
@section('title')
Edit Mata Kuliah
@endsection
@section('css')
<link rel="stylesheet"
    href="{{ URL::to('/') }}/template/js/plugins/bootstrap-datepicker/css/bootstrap-datepicker3.min.css">
@endsection
@section('breadcrumb')
<div class="content">
    <nav class="breadcrumb bg-white push">
        <a href="{{route('dosen.dashboard')}}" class="breadcrumb-item">Dashboard</a>
        <a href="{{route('dosen.matkul.index')}}" class="breadcrumb-item">Managemen Mata Kuliah</a>
        <a href="{{route('dosen.matkul.edit', ['id' => $matkul->id])}}" class="breadcrumb-item active">Edit Mata Kuliah</a>
    </nav>
</div>
@endsection
@section('main')
<!-- Page Content -->
<div class="content">
    <div class="block">
       <div class="block-header block-header-default">
          <div class="row">
            <a href="{{route('dosen.matkul.index')}}" id="arrow-back" style="padding: 0px 0px 0px 12px;">
                <button type="button" class="btn btn-sm btn-circle btn-secondary mr-5 mb-5">
                    <i class="fa fa-arrow-left"></i>
                </button>
            </a>
            <div class="font-size-lg font-w600">&emsp;Edit User</div>
          </div>
       </div>

       <form method="post" id="question_form">
            {{ csrf_field() }}
            @method('PATCH')
            <div class="block-content">
                <div class="row">
                    <div class="col-md-12">
                        <div class="form-group">
                            <label for="">Kode Mata Kuliah</label>
                            <input value="{{$matkul->kode_matakuliah}}"
                            autocomplete="off" type="text" class="form-control" id="input-name" name="kode">
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12">
                        <div class="form-group">
                            <label for="">Nama Mata Kuliah</label>
                            <input value="{{$matkul->nama_matakuliah}}"
                            autocomplete="off" type="text" class="form-control" id="input-name" name="nama">
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12">
                        <div class="form-group">
                            <label class="" for="example-select">Departemen</label>
                            <select autocomplete="off" class="form-control" id="example-select" name="departemen">
                                <option <?php if($matkul->departement == "Fisika") echo 'selected'; ?> value="Fisika">Fisika</option>
                                <option <?php if($matkul->departement == "Matematika") echo 'selected'; ?> value="Matematika">Matematika</option>
                                <option <?php if($matkul->departement == "Statistika") echo 'selected'; ?> value="Statistika">Statistika</option>
                                <option <?php if($matkul->departement == "Kimia") echo 'selected'; ?> value="Kimia">Kimia</option>
                                <option <?php if($matkul->departement == "Biologi") echo 'selected'; ?> value="Biologi">Biologi</option>
                                <option <?php if($matkul->departement == "Aktuaria") echo 'selected'; ?> value="Aktuaria">Aktuaria</option>
                                <option <?php if($matkul->departement == "Teknik Perkapalan") echo 'selected'; ?> value="Teknik Perkapalan">Teknik Perkapalan</option>
                                <option <?php if($matkul->departement == "Teknik Sistem Perkapalan") echo 'selected'; ?> value="Teknik Sistem Perkapalan">Teknik Sistem Perkapalan</option>
                                <option <?php if($matkul->departement == "Teknik Kelautan") echo 'selected'; ?> value="Teknik Kelautan">Teknik Kelautan</option>
                                <option <?php if($matkul->departement == "Teknik Transportasi Laut") echo 'selected'; ?> value="Teknik Transportasi Laut">Teknik Transportasi Laut</option>
                                <option <?php if($matkul->departement == "Teknik Mesin") echo 'selected'; ?> value="Teknik Mesin">Teknik Mesin</option>
                                <option <?php if($matkul->departement == "Teknik Kimia") echo 'selected'; ?> value="Teknik Kimia">Teknik Kimia</option>
                                <option <?php if($matkul->departement == "Teknik Fisika") echo 'selected'; ?> value="Teknik Fisika">Teknik Fisika</option>
                                <option <?php if($matkul->departement == "Teknik Sistem dan Industri") echo 'selected'; ?> value="Teknik Sistem dan Industri">Teknik Sistem dan Industri</option>
                                <option <?php if($matkul->departement == "Teknik Material") echo 'selected'; ?> value="Teknik Material">Teknik Material</option>
                                <option <?php if($matkul->departement == "Teknik Elektro") echo 'selected'; ?> value="Teknik Elektro">Teknik Elektro</option>
                                <option <?php if($matkul->departement == "Teknik Biomedik") echo 'selected'; ?> value="Teknik Biomedik">Teknik Biomedik</option>
                                <option <?php if($matkul->departement == "Teknik Komputer") echo 'selected'; ?> value="Teknik Komputer">Teknik Komputer</option>
                                <option <?php if($matkul->departement == "Teknik Informatika") echo 'selected'; ?> value="Teknik Informatika">Teknik Informatika</option>
                                <option <?php if($matkul->departement == "Sistem Informasi") echo 'selected'; ?> value="Sistem Informasi">Sistem Informasi</option>
                                <option <?php if($matkul->departement == "Teknologi Informasi") echo 'selected'; ?> value="Teknologi Informasi">Teknologi Informasi</option>
                                <option <?php if($matkul->departement == "Teknik Sipil") echo 'selected'; ?> value="Teknik Sipil">Teknik Sipil</option>
                                <option <?php if($matkul->departement == "Arsitektur") echo 'selected'; ?> value="Arsitektur">Arsitektur</option>
                                <option <?php if($matkul->departement == "Teknik Lingkungan") echo 'selected'; ?> value="Teknik Lingkungan">Teknik Lingkungan</option>
                                <option <?php if($matkul->departement == "Perencanaan Wilayah dan Kota") echo 'selected'; ?> value="Perencanaan Wilayah dan Kota">Perencanaan Wilayah dan Kota</option>
                                <option <?php if($matkul->departement == "Teknik Geomatika") echo 'selected'; ?> value="Teknik Geomatika">Teknik Geomatika</option>
                                <option <?php if($matkul->departement == "Teknik Geofisika") echo 'selected'; ?> value="Teknik Geofisika">Teknik Geofisika</option>
                                <option <?php if($matkul->departement == "Desain Produk Industri") echo 'selected'; ?> value="Desain Produk Industri">Desain Produk Industri</option>
                                <option <?php if($matkul->departement == "Desain Interior") echo 'selected'; ?> value="Desain Interior">Desain Interior</option>
                                <option <?php if($matkul->departement == "Desain Komunikasi Visual") echo 'selected'; ?> value="Desain Komunikasi Visual">Desain Komunikasi Visual</option>
                                <option <?php if($matkul->departement == "Manajemen Bisnis") echo 'selected'; ?> value="Manajemen Bisnis">Manajemen Bisnis</option>
                                <option <?php if($matkul->departement == "Studi Pembangunan") echo 'selected'; ?> value="Studi Pembangunan">Studi Pembangunan</option>
                                <option <?php if($matkul->departement == "Manajemen Teknologi") echo 'selected'; ?> value="Manajemen Teknologi">Manajemen Teknologi</option>
                                <option <?php if($matkul->departement == "Teknik Infrastruktur Sipil") echo 'selected'; ?> value="Teknik Infrastruktur Sipil">Teknik Infrastruktur Sipil</option>
                                <option <?php if($matkul->departement == "Teknik Mesin Industri") echo 'selected'; ?> value="Teknik Mesin Industri">Teknik Mesin Industri</option>
                                <option <?php if($matkul->departement == "Teknik Elektro Otomasi") echo 'selected'; ?> value="Teknik Elektro Otomasi">Teknik Elektro Otomasi</option>
                                <option <?php if($matkul->departement == "Teknik Kimia Industri") echo 'selected'; ?> value="Teknik Kimia Industri">Teknik Kimia Industri</option>
                                <option <?php if($matkul->departement == "Teknik Instrumentasi") echo 'selected'; ?> value="Teknik Instrumentasi">Teknik Instrumentasi</option>
                                <option <?php if($matkul->departement == "Statistika Bisnis") echo 'selected'; ?> value="Statistika Bisnis">Statistika Bisnis</option>
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