@extends('dashboard.layouts.master')
@section('title')
MyITS Presensi
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
        <a href="#" class="breadcrumb-item active">Management Matkul</a>
    </nav>
</div>
@endsection
@section('main')
<!-- Page Content -->
<div class="content">
    
    <div class="block">
        <div class="block-header block-header-default">
            <div class="row">
                <a href="{{route('dosen.dashboard')}}" id="arrow-back" style="padding: 0px 0px 0px 12px;">
                    <button type="button" class="btn btn-sm btn-circle btn-secondary mr-5 mb-5">
                        <i class="fa fa-arrow-left"></i>
                    </button>
                </a>
                <div class="font-size-lg font-w600">&emsp;Management Matkul</div>
            </div>
            <div class="block-options">
                <form class="pull-right mr-5 mb-5" action="{{route('dosen.matkul.create')}}" method="GET">
                    <button type="submit" class="btn btn-sm btn-its-primary">
                        <i class="fa fa-plus"></i> Tambah Matkul
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
                                <th class="text-center" >Kode Mata Kuliah</th>
                                <th class="text-center" >Nama Mata Kuliah</th>
                                <th class="text-center" >Departemen</th>
                                <th class="text-center" style="width:18%">Aksi</th>
                            </tr>
                        </thead>
                        <tbody>
                            @foreach($matkuls as $matkul)
                                <tr>
                                    <td>{{$matkul->kode_matakuliah}}</td>
                                    <td>{{$matkul->nama_matakuliah}}</td>
                                    <td>{{$matkul->departement}}</td>
                                    <td>
                                    <form action="{{route('dosen.matkul.delete', ['id' => $matkul->id])}}" 
                                            onclick="return confirm('Apakah anda yakin?')"
                                            method="POST">
                                            @csrf
                                            @method('DELETE')
                                            <button class="btn btn-sm btn-danger pull-right mr-3"><i
                                                    class="fa fa-trash mr-1"></i> Hapus</button>
                                        </form>
                                        <a href="{{route('dosen.matkul.edit', ['id' => $matkul->id])}}">
                                            <button class="btn btn-sm btn-its-primary pull-right mr-3"><i
                                                    class="fa fa-pencil mr-1"></i> Edit</button>
                                        </a>
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
