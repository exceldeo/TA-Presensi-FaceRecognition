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
        <a href="#" class="breadcrumb-item active">Management Kelas</a>
    </nav>
</div>
@endsection
@section('main')
<!-- Page Content -->
<div class="content">
    
    <div class="block">
        <div class="block-header block-header-default">
            <div class="row">
                <div class="font-size-lg font-w600">&emsp;Management Kelas</div>
            </div>
            <div class="block-options">
                <form class="pull-right mr-5 mb-5" action="#" method="GET">
                    <button type="submit" class="btn btn-sm btn-its-primary">
                        <i class="fa fa-plus"></i> Tambah Kelas
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
                                <th class="text-center" >Nama</th>
                                <th class="text-center" >Lokasi</th>
                                <th class="text-center" style="width:18%">Aksi</th>
                            </tr>
                        </thead>
                        <tbody>
                            @foreach($classes as $class)
                                <tr>
                                    <td>{{$class->nama_kelas}}</td>
                                    <td>{{$class->lokasi_kelas}}</td>
                                    <td>
                                        <a href="#" >
                                            <button class="btn btn-sm btn-danger pull-right mr-3"><i
                                                    class="fa fa-trash mr-1"></i> Hapus</button>
                                        </a>
                                        <a href="#">
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
