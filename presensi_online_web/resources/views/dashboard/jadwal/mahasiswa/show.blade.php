@extends('dashboard.layouts.master')
@section('title')
Jadwal Mahasiswa
@endsection
@section('css')
<link rel="stylesheet" href="{{ URL::to('/') }}/template/js/plugins/bootstrap-datepicker/css/bootstrap-datepicker3.min.css">
<link rel="stylesheet" href="{{ URL::to('/') }}/template/js/plugins/dropzonejs/dist/dropzone.css">
<link rel="stylesheet" href="{{ URL::to('/') }}/template/js/plugins/flatpickr/flatpickr.min.css">
<link rel="stylesheet" href="{{ URL::to('/') }}/template/js/plugins/datatables/dataTables.bootstrap4.css">
@endsection
@section('breadcrumb')
<div class="content">
    <nav class="breadcrumb bg-white push">
        <a href="{{route('dosen.dashboard')}}" class="breadcrumb-item">Dashboard</a>
        <a href="{{route('dosen.jadwal.index')}}" class="breadcrumb-item">Managemen Jadwal</a>
        <a href="{{route('dosen.jadwal.mahasiswa.index', ['id' => $jadwal->id_jadwal])}}" class="breadcrumb-item active">Detail Jadwal</a>
        <a href="#" class="breadcrumb-item active">Detail Kehadiran Mahasiswa</a>
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
                <div class="font-size-lg font-w600">&emsp;Detail Kehadiran Mahasiswa</div>
            </div>
        </div>
        <div class="block-content">
            <div class="row py-5">
                <div class="col-12" style="padding: 0px;">
                    <ul style="list-style-type: none; padding-left: 0px;">
                        <li>
                            <div class="content-li" style="padding: 0 20px 0 20px;">
                                <h5 class="font-size-h6 font-w500 mb-5">
                                    Data Mahasiswa
                                </h5>
                                <div class="row">
                                    <div class="col">
                                        <span class="mr-10">
                                            <i class="fa fa-fw fa-book mr-1"></i> {!! $mahasiswa->nrp !!}
                                        </span>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col">
                                        <span class="mr-10">
                                            <i class="fa fa-fw fa-user mr-1"></i> {!! $mahasiswa->nama_mahasiswa !!} 
                                        </span>
                                    </div>
                                </div>
                            </div>
                            <hr>
                            <div class="content-li" style="padding: 0 20px 0 20px;">
                                <h5 class="font-size-h6 font-w500 mb-5">
                                    Data Kelas Mahasiswa
                                </h5>
                                <h5 class="font-size-h6 font-w500 mb-5">
                                    <a href="#">
                                        <span class="badge badge-its-primary mr-2">{!! $jadwal->kode_matakuliah !!} </span>
                                        <br class="d-sm-none mb-1">
                                        {!! $jadwal->nama_matakuliah !!}
                                    </a>
                                </h5>
                                <div class="row">
                                    <div class="col">
                                        <span class="mr-10">
                                            <i class="fa fa-fw fa-clock-o mr-1"></i> {!! $jadwal->hari !!} , {!! $jadwal->jam_mulai !!} sampai {!!
                                            $jadwal->jam_akhir !!}
                                        </span>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col">
                                        <span class="mr-10">
                                            <i class="fa fa-fw fa-building-o mr-1"></i> {!! $jadwal->nama_kelas !!}
                                        </span>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col">
                                        <span class="mr-10">
                                            <i class="fa fa-fw fa-user mr-1"></i> {!! $jadwal->nama_dosen !!} 
                                        </span>
                                    </div>
                                </div>
                            </div>
                            
                        </li>
                    </ul>
                </div>
            </div>
        </div>
        <div class="block-content block-content-full bg-body-light font-size-xs font-italic">
        </div>
    </div>

    <div class="block">
        <div class="block-header block-header-default">
            <div class="row">
                <div class="font-size-lg font-w600">&emsp;List Kehadiran Mahasiswa</div>
            </div>
        </div>
        <div class="block-content">
            <div class="row py-5">
                <div class="col-12" style="padding-left: 20px;padding-right: 20px;">
                    <table id="session_table" class="table table-striped table-bordered">
                        <thead>
                            <tr>
                                <th class="text-center" style="width:10%">Pertemuan Ke-</th>
                                <th class="text-center" >Status</th>
                                <th class="text-center" >Jam</th>
                                <th class="text-center" >Tanggal</th>
                            </tr>
                        </thead>
                        <tbody>
                            @foreach($presensiMahasiswas as $presensiMahasiswa)
                                <tr>
                                    <td class="text-center">{{$loop->iteration}}</td>
                                    <td class="text-center">
                                        @if($presensiMahasiswa->status == '1')
                                            <span class="badge badge-success">Hadir</span>
                                        @elseif($presensiMahasiswa->status == '2')
                                            <span class="badge badge-waring">Ijin</span>
                                        @else
                                            <span class="badge badge-danger">Tidak Hadir</span>
                                        @endif
                                    </td>
                                    <td class="text-center">
                                        @if($presensiMahasiswa->jam)
                                            {{$presensiMahasiswa->jam}}
                                        @endif
                                    </td>
                                    <td class="text-center">
                                        @if($presensiMahasiswa->tanggal)
                                            {{date('m/d/Y', strtotime($presensiMahasiswa->tanggal))}}
                                        @endif
                                    </td>
                                    
                                </tr>
                            @endforeach
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
        <div class="block-content block-content-full bg-body-light font-size-xs font-italic">
        </div>
    </div>
</div>
<!-- END Page Content -->


@endsection
@section('js')
<script src="https://cdn.datatables.net/1.10.21/js/jquery.dataTables.min.js"></script>
<script src="https://cdn.datatables.net/1.10.21/js/dataTables.bootstrap4.min.js"></script>
<script src="{{ URL::to('/') }}/template/js/plugins/bootstrap-datepicker/js/bootstrap-datepicker.min.js"></script>
<script>
    jQuery(function () {
        Codebase.helpers(['flatpickr', 'datepicker', 'colorpicker', 'maxlength', 'select2', 'masked-inputs',
            'rangeslider', 'tags-inputs'
        ]);
    });
</script>
<script>
    $(document).ready(function() {
        var table = $('#session_table').DataTable( {
        } );
        var table2 = $('#kehadiran_table').DataTable( {
        } );
    } );
</script>
@endsection
