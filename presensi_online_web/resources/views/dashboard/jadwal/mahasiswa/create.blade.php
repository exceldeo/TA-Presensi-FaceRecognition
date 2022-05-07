@extends('dashboard.layouts.master')
@section('title')
Tambah Jadwal Mahasiswa
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
        <a href="{{route('dosen.jadwal.mahasiswa.index', ['id' => $jadwal->id_jadwal])}}" class="breadcrumb-item">Detail Jadwal</a>
        <a href="{{route('dosen.jadwal.mahasiswa.create', ['id' => $jadwal->id_jadwal])}}" class="breadcrumb-item active">Tambah Jadwal Mahasiswa</a>
    </nav>
</div>
@endsection
@section('main')
<!-- Page Content -->
<div class="content">
    <div class="block">
       <div class="block-header block-header-default">
          <div class="row">
            <a href="{{route('dosen.jadwal.mahasiswa.index', ['id' => $jadwal->id_jadwal])}}" id="arrow-back" style="padding: 0px 0px 0px 12px;">
                <button type="button" class="btn btn-sm btn-circle btn-secondary mr-5 mb-5">
                    <i class="fa fa-arrow-left"></i>
                </button>
            </a>
            <div class="font-size-lg font-w600">&emsp;Tambah Jadwal Mahasiswa</div>
          </div>
       </div>

       <form action="{{route('dosen.jadwal.mahasiswa.store', ['id' => $jadwal->id_jadwal])}}" method="post" id="question_form">
            {{ csrf_field() }}
            <div class="block-content">
                
                <div class="row">
                    <div class="col-md-12">
                        <div class="form-group">
                            <label for="">Matakuliah</label>
                            <input disabled autocomplete="off" type="text" class="form-control" id="input-name" 
                            value="{!! $jadwal->nama_matakuliah !!}">
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-12">
                        <div class="form-group">
                            <label for="">Dosen</label>
                            <input disabled autocomplete="off" type="text" class="form-control" id="input-name" 
                            value="{!! $jadwal->nama_dosen !!}">
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-12">
                        <div class="form-group">
                            <label for="">Kelas</label>
                            <input disabled autocomplete="off" type="text" class="form-control" id="input-name" 
                            value="{!! $jadwal->nama_kelas !!}">
                        </div>
                    </div>
                </div>
                
                <div class="form-group row" onsubmit="return false;">
                    <label class="col-12" for="example-select2">Mahasiswa</label>
                    <div class="col-lg-12">
                        <select class="js-select2 form-control" id="example-select2"
                            name="nrp_mahasiswa" style="width: 100%;" data-placeholder="pilih mahasiswa" required>
                                @foreach ($mahasiswas as $mahasiswa)
                                    <option value="{{$mahasiswa->nrp}}">{{$mahasiswa->nrp}} - {{$mahasiswa->nama_mahasiswa}}</option>
                                @endforeach
                        </select>
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
        let start_date = $('#date_start').val();
        let end_date= $('#date_end').val();
        console.log(new Date(start_date) + " " + new Date(end_date));
        $('#sandbox-container input').datepicker({
            startDate: new Date(start_date),
            endDate: new Date(end_date),
            dateFormat: 'mm/dd/yyyy'
        });
    });
</script>
@endsection