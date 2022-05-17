@extends('dashboard.layouts.master')
@section('title')
Edit Kelas
@endsection
@section('css')
<link rel="stylesheet"
    href="{{ URL::to('/') }}/template/js/plugins/bootstrap-datepicker/css/bootstrap-datepicker3.min.css">
@endsection
@section('breadcrumb')
<div class="content">
    <nav class="breadcrumb bg-white push">
        <a href="{{route('dosen.dashboard')}}" class="breadcrumb-item">Dashboard</a>
        <a href="{{route('dosen.kelas.index')}}" class="breadcrumb-item">Managemen Kelas</a>
        <a href="{{route('dosen.kelas.edit', ['id' => $kelas->id])}}" class="breadcrumb-item active">Edit Kelas</a>
    </nav>
</div>
@endsection
@section('main')
<!-- Page Content -->
<div class="content">
    <div class="block">
       <div class="block-header block-header-default">
          <div class="row">
            <a href="{{route('dosen.kelas.index')}}" id="arrow-back" style="padding: 0px 0px 0px 12px;">
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
                            <label for="">Nama Kelas</label>
                            <input value="{{$kelas->nama_kelas}}"
                            autocomplete="off" type="text" class="form-control" id="input-name" name="nama">
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12">
                        <div class="form-group">
                            <label for="">Lokasi</label>
                            <input value="{{$kelas->lokasi_kelas}}"
                            autocomplete="off" type="text" class="form-control" id="input-name" name="lokasi">
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