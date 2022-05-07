@extends('dashboard.layouts.master')
@section('title')
Tambah Jadwal
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
        <a href="{{route('dosen.jadwal.create')}}" class="breadcrumb-item active">Tambah Jadwal</a>
    </nav>
</div>
@endsection
@section('main')
<!-- Page Content -->
<div class="content">
    <div class="block">
       <div class="block-header block-header-default">
          <div class="row">
            <a href="{{route('dosen.jadwal.index')}}" id="arrow-back" style="padding: 0px 0px 0px 12px;">
                <button type="button" class="btn btn-sm btn-circle btn-secondary mr-5 mb-5">
                    <i class="fa fa-arrow-left"></i>
                </button>
            </a>
            <div class="font-size-lg font-w600">&emsp;Tambah Jadwal</div>
          </div>
       </div>

       <form action="{{route('dosen.jadwal.store')}}" method="post" id="question_form">
            {{ csrf_field() }}
            <div class="block-content">
                <div class="row">
                    <div class="col-md-12">
                        <div class="form-group">
                            <label for="">Tahun Ajaran</label>
                            <input required autocomplete="off" type="text" class="form-control" id="input-name" name="tahun_ajaran">
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="form-group col-lg-6">
                        <label for="example-flatpickr-time-standalone-24">Jam Mulai</label>
                        <input autocomplete="off" type="time" class="js-flatpickr form-control bg-white"
                            id="example-flatpickr-time-standalone-24" name="jam_mulai"
                            data-enable-time="true" data-no-calendar="true" data-date-format="H:i"
                            data-time_24hr="true" required>
                    </div>
                    <div class="form-group col-lg-6">
                        <label for="example-flatpickr-time-standalone-24">Jam Akhir</label>
                        <input autocomplete="off" type="time" class="js-flatpickr form-control bg-white"
                            id="example-flatpickr-time-standalone-24" name="jam_akhir"
                            data-enable-time="true" data-no-calendar="true" data-date-format="H:i"
                            data-time_24hr="true" required>
                    </div>
                </div>
                <div class="form-group row" onsubmit="return false;">
                    <label class="col-12" for="example-select2">Hari</label>
                    <div class="col-lg-12">
                        <select class="js-select2 form-control" id="example-select2"
                            name="hari" style="width: 100%;" data-placeholder="pilih hari" required>
                            <option value="senin">Senin</option>
                            <option value="selasa">Selasa</option>
                            <option value="rabu">Rabu</option>
                            <option value="kamis">Kamis</option>
                            <option value="jumat">Jumat</option>
                        </select>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-4">
                        <div class="form-group">
                            <label for="">Semester</label>
                            <input required autocomplete="off" type="text" class="form-control" id="input-name" name="semester">
                        </div>
                    </div>

                    <div class="col-md-4">
                        <div class="form-group">
                            <label for="">Kelas</label>
                            <select class="js-select2 form-control" id="example-select2"
                                name="kelas" style="width: 100%;" data-placeholder="pilih kelas" required>
                                    @foreach ($kelass as $kelas)
                                        <option value="{{$kelas->id}}">{{$kelas->nama_kelas}} - {{$kelas->lokasi_kelas}}</option>
                                    @endforeach
                            </select>
                        </div>
                    </div>

                    <div class="col-md-4">
                        <div class="form-group">
                            <label for="">Matakuliah</label>
                            <select class="js-select2 form-control" id="example-select2"
                                name="matakuliah" style="width: 100%;" data-placeholder="pilih matakuliah" required>
                                    @foreach ($matakuliahs as $matakuliah)
                                        <option value="{{$matakuliah->id}}">{{$matakuliah->nama_matakuliah}}</option>
                                    @endforeach
                            </select>
                        </div>
                    </div>
                </div>

                <div class="form-group row" onsubmit="return false;">
                    <label class="col-12" for="example-select2">Dosen</label>
                    <div class="col-lg-12">
                        <select class="js-select2 form-control" id="example-select2"
                            name="dosen" style="width: 100%;" data-placeholder="pilih dosen" required>
                                @foreach ($dosens as $dosen)
                                    <option value="{{$dosen->nip}}">{{$dosen->nama_dosen}} - {{$dosen->departement}}</option>
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