@extends('dashboard.layouts.master')
@section('title')
Edit Jadwal Kehadiran
@endsection
@section('css')
    <link rel="stylesheet" href="{{ URL::to('/') }}/template/js/plugins/bootstrap-datepicker/css/bootstrap-datepicker3.min.css">
    <link rel="stylesheet" href="{{ URL::to('/') }}/template/js/plugins/dropzonejs/dist/dropzone.css">
    <link rel="stylesheet" href="{{ URL::to('/') }}/template/js/plugins/flatpickr/flatpickr.min.css">
@endsection
@section('breadcrumb')
<div class="content">
    <nav class="breadcrumb bg-white push">
        <a href="{{route('dosen.dashboard')}}" class="breadcrumb-item">Dashboard</a>
        <a href="{{route('dosen.jadwal.index')}}" class="breadcrumb-item">Managemen Jadwal</a>
        <a href="{{route('dosen.jadwal.mahasiswa.index', ['id' => $id])}}" class="breadcrumb-item">Detail Jadwal</a>
        <a href="{{route('dosen.jadwal.mahasiswa.kehadiran.edit', ['id' => $id, 'id_presensi' => $presensi->id])}}" class="breadcrumb-item active">Tambah Jadwal Kehadiran</a>
    </nav>
</div>
@endsection
@section('main')
<!-- Page Content -->
<div class="content">
    <div class="block">
       <div class="block-header block-header-default">
          <div class="row">
            <a href="{{route('dosen.jadwal.mahasiswa.index', ['id' => $id])}}" id="arrow-back" style="padding: 0px 0px 0px 12px;">
                <button type="button" class="btn btn-sm btn-circle btn-secondary mr-5 mb-5">
                    <i class="fa fa-arrow-left"></i>
                </button>
            </a>
            <div class="font-size-lg font-w600">&emsp;Edit Jadwal Kehadiran</div>
          </div>
       </div>

       <form method="post" id="question_form">
            {{ csrf_field() }}
            @method('PATCH')
            <div class="block-content">

                <div class="form-row">
                    <div class="form-group col-lg-12">
                        <label for="example-flatpickr-default">Tanggal</label>
                        
                        <div id="sandbox-container">
                            <input autocomplete="off" type="text" type="text" class="form-control" name="tanggal" id="tanggal" value="<?php echo date('m/d/Y', strtotime($presensi->tanggal)) ?>"/>
                        </div>
                    </div>
                </div>
                
                <div class="row">
                    <div class="form-group col-lg-6">
                        <label for="example-flatpickr-time-standalone-24">Jam Mulai</label>
                        <input autocomplete="off" type="time" class="js-flatpickr form-control bg-white"
                            id="example-flatpickr-time-standalone-24" name="jam_mulai"
                            data-enable-time="true" data-no-calendar="true" data-date-format="H:i"
                            data-time_24hr="true" required value="{!! substr($presensi->jam_mulai,0,5) !!}">
                    </div>
                    <div class="form-group col-lg-6">
                        <label for="example-flatpickr-time-standalone-24">Jam Akhir</label>
                        <input autocomplete="off" type="time" class="js-flatpickr form-control bg-white"
                            id="example-flatpickr-time-standalone-24" name="jam_akhir"
                            data-enable-time="true" data-no-calendar="true" data-date-format="H:i"
                            data-time_24hr="true" required value="{!! substr($presensi->jam_akhir,0,5) !!}">
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
<script src="{{ URL::to('/') }}/template/js/plugins/bootstrap-datepicker/js/bootstrap-datepicker.min.js"></script>

<script src="{{ URL::to('/') }}/template/js/plugins/dropzonejs/dropzone.min.js"></script>
<script src="{{ URL::to('/') }}/template/js/plugins/flatpickr/flatpickr.min.js"></script>

<script>jQuery(function(){ Codebase.helpers(['flatpickr', 'colorpicker', 'maxlength', 'select2', 'masked-inputs', 'rangeslider', 'tags-inputs']); });</script>

<script>
    $(function() {
        $('#sandbox-container input').datepicker({
            dateFormat: 'dd/mm/yyyy',
            todayHighlight: true
        });
    });
</script>
@endsection