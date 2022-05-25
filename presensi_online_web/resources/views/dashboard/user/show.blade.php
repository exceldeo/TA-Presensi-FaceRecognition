@extends('dashboard.layouts.master')
@section('title')
Show Dosen
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
        <a href="{{route('dosen.user.index')}}" class="breadcrumb-item">Managemen User</a>
        <a href="" class="breadcrumb-item active">Detail User</a>
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
                <div class="font-size-lg font-w600">&emsp;Detail User</div>
            </div>
        </div>
        <div class="block-content">
            <div class="row py-5">
                <div class="col-12" style="padding: 0px;">
                    <ul style="list-style-type: none; padding-left: 0px;">
                        <li>
                            <div class="content-li h3" style="padding: 0 20px 0 20px;">
                                <div class="row">
                                    <div class="col-3">
                                        NIP
                                    </div>
                                    <div class="col-1">
                                        :
                                    </div>
                                    <div class="col-8">
                                        {{$dosen->nip}}
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-3">
                                        Nama
                                    </div>
                                    <div class="col-1">
                                        :
                                    </div>
                                    <div class="col-8">
                                        {{$dosen->nama_dosen}}
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-3">
                                        Email
                                    </div>
                                    <div class="col-1">
                                        :
                                    </div>
                                    <div class="col-8">
                                        {{$dosen->email}}
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-3">
                                        Departemen
                                    </div>
                                    <div class="col-1">
                                        :
                                    </div>
                                    <div class="col-8">
                                        {{$dosen->departement}}
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-3">
                                        Role
                                    </div>
                                    <div class="col-1">
                                        :
                                    </div>
                                    <div class="col-8">
                                        {{$dosen->role}}
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
