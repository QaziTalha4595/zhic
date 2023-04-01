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
                            <div class="h5 mb-0 font-weight-bold text-gray-800">Number Of View</div>
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
                            <th>Id</th>
                            <th>Category</th>
                            <th>Sub Category</th>
                            <th>Name</th>
                            <th>File</th>
                            <th>No:View</th>
                        </tr>
                    </thead>
                </table>
            </div>
        </div>
    </div>
</div>

<script type="text/javascript">
var base_url = "{{url('/')}}";
var DataTable = '';
$(function() {

    DataTable = $("#DataTable").DataTable({
        "processing": true,
        "serverSide": true,
       dom: '<"top"<"left-col"B><"right-col"f>>r<"table table-striped"t>ip',
                lengthMenu: [
                    [10, 25, 50, -1],
                    ['10 rows', '25 rows', '50 rows', 'Show all']
                ],
                "responsive": true,
                buttons: [{
                        extend: 'excelHtml5',
                        text: "Excel"
                    },
                    {
                        extend: 'pdf',
                        text: "pdf"
                    },

                    {
                        extend: 'print',
                        text: "Print"
                    }, 'pageLength'
                ],
        ajax: {
            url: "{{route('EbookShow')}}",
            // data: {
            //   client_id: ""
            // }
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
                        'orderable': true,
                        'class': 'text-center'
                    },
                    {
                        data: 'SubCategory',
                        'searchable': true,
                        'orderable': true,
                        'class': 'text-center'
                    },
                    {
                        data: 'ebook_name',
                        'searchable': true,
                        'orderable': false,
                        'class': 'text-center'
                    },
                    {
                        data: 'unique_id',
                        'searchable': true,
                        'orderable': false,
                        'class': 'text-center'
                    },
                    {
                        data: 'no_view',
                        'searchable': true,
                        'orderable': false,
                        'class': 'text-center'
                    }
                ]
            });

});
</script>

@endsection
