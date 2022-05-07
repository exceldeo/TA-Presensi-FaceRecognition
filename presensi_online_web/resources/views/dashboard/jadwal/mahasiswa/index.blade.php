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
                <div class="font-size-lg font-w600">&emsp;Detail Jadwal</div>
            </div>
        </div>
        <div class="block-content">
            <div class="row py-5">
                <div class="col-12" style="padding: 0px;">
                    <ul style="list-style-type: none; padding-left: 0px;">
                        <li>
                            <div class="content-li" style="padding: 0 20px 0 20px;">
                                <h5 class="font-size-h6 font-w500 mb-5">
                                    <a href="#">
                                        <span class="badge badge-its-primary mr-2">kode matakuliah </span>
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
                            <hr>
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
                <div class="font-size-lg font-w600">&emsp;List Mahasiswa</div>
            </div>
            <div class="block-options">
                <form class="pull-right mr-5 mb-5" action="{{route('dosen.jadwal.mahasiswa.create', ['id' => $jadwal->id_jadwal])}}" method="GET">
                    <button type="submit" class="btn btn-sm btn-its-primary">
                        <i class="fa fa-plus"></i> Tambah Jadwal Mahasiswa
                    </button>
                </form>
            </div>
        </div>
        <div class="block-content">
            <div class="row py-5">
                <div class="col-12" style="padding-left: 20px;padding-right: 20px;">
                    <table id="session_table" class="table table-striped table-bordered">
                        <thead>
                            <tr>
                                <th class="text-center" >NRP</th>
                                <th class="text-center" >Nama</th>
                                <th class="text-center" >departement</th>
                                <th class="text-center" style="width:10%">Aksi</th>
                            </tr>
                        </thead>
                        <tbody>
                            @foreach($mahasiswas as $mahasiswa)
                                <tr>
                                    <td>{{$mahasiswa->nrp_mahasiswa}}</td>
                                    <td>{{$mahasiswa->nama_mahasiswa}}</td>
                                    <td>Nama Departement</td>
                                    <td>
                                        <a href="#">
                                            <button class="btn btn-sm btn-warning pull-right mr-3"><i
                                                    class="fa fa-pencil mr-1"></i> Edit</button>
                                        </a>
                                        <form action="{{route('dosen.jadwal.mahasiswa.delete', ['id' => $jadwal->id_jadwal, 'id_jadwal_mahasiswa' => $mahasiswa->id])}}" 
                                            onclick="return confirm('Apakah anda yakin?')"
                                            method="POST">
                                            @csrf
                                            @method('DELETE')
                                            <button class="btn btn-sm btn-danger pull-right mr-3"><i
                                                    class="fa fa-trash mr-1"></i> Hapus</button>
                                        </form>
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
    } );
</script>
@endsection
