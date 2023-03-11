@extends('Admin.AdminLayout')

@section('content')
<div class="container-fluid">
    <!-- Page Heading -->
    <div class="row">
        <div class="col-lg-12 mb-2">
            <div class="card shadow">
                <div class="card-body">
                    <div class="row no-gutters align-items-center">
                        <div class="col mr-2">
                            <div class="h5 mb-0 font-weight-bold text-gray-800">E-Book Upload</div>
                        </div>
                        <div class="col-auto">
                            <a href="{{ url('ControlPanel/EbookUpload') }}" class="btn btn-primary">Add</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<div class="container-fluid">
    <div class="card shadow mb-4">
        <div class="card-body">
            <div class="table-responsive">
                <table id="DataTable" class="table table-bordered" width="100%" cellspacing="0">
                    <thead>
                        <tr>
                            <th>UID</th>
                            <th>Category</th>
                            <th>Sub Category</th>
                            <th>Third Category</th>
                            <th>Title</th>
                            <th>Book ISBN</th>
                            <th>Book Author</th>
                            <th>Thumbnail</th>
                            <!-- <th>File</th> -->
                            <th>Action</th>
                        </tr>
                    </thead>
                </table>
            </div>
        </div>
    </div>
</div>
<script>

$(function() {

DataTable = $("#DataTable").DataTable({
    "processing": true,
    "serverSide": true,
    ajax: {
        url: "{{route('EbookShow')}}",
    },
    columns: [{
            data: 'file_id',
            'searchable': false,
            'orderable': false,
            'class': 'text-center'
        },
        {
            data: 'Category',
            'searchable': true,
            'orderable': false,
            'class': 'text-center'
        },
        {
            data: 'SubCategory',
            'searchable': true,
            'orderable': false,
            'class': 'text-center'
        },
        {
            data: 'ThirdCategory',
            'searchable': true,
            'orderable': false,
            'class': 'text-center'
        },
        {
            data: 'ebook_name',
            'searchable': true,
            'orderable': false,
            'class': 'text-center'
        },
        {
            data: 'ebook_isbn',
            'searchable': true,
            'orderable': false,
            'class': 'text-center'
        },
        {
            data: 'ebook_author',
            'searchable': true,
            'orderable': false,
            'class': 'text-center'
        },
        {
            data : 'Thumbnail',
                    render : function(data)
                    {
                        return '<img src="{{url("public/Files/E_Book_CoverImg")}}/'+data+'" style="width:40px;height:auto">';
                    }
        },
        
        // {
        //     data: 'unique_id',
        //     render: function(data) {
        //         let book_url = "{{config('global.main_url')}}EBook/" + data;
        //         return '<a target="_blank" href="' + book_url + '">' + data + '</a>';
        //     },
        //     'searchable': true,
        //     'orderable': false,
        //     'class': 'text-center'
        // },
        // {
        //     data: 'no_view',
        //     'searchable': true,
        //     'orderable': false,
        //     'class': 'text-center'
        // },
        // {
        //     data: 'view_duration',
        //     'searchable': true,
        //     'orderable': false,
        //     'class': 'text-center'
        // },
        {
            data: 'Action',
            'searchable': false,
            'orderable': false,
            'class': 'text-center'
        }
    ]
});
});

</script>
@endsection