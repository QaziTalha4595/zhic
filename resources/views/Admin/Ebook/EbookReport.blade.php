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
                            <div class="h5 mb-0 font-weight-bold text-gray-800">Ebook Report</div>
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
                            <th>E-Book</th>
                            <th>Total Reads</th>
                            <th>Location</th>
                        </tr>
                    </thead>
                </table>
            </div>
        </div>
    </div>
</div>


<script src="{{url('public/plugins/jquery/jquery.min.js')}}"></script>
<link href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.13/css/select2.min.css" rel="stylesheet">
<script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.13/js/select2.min.js"></script>

<script type="text/javascript">
var base_url = "{{url('/')}}";
var DataTable = '';
$(function() {

    DataTable = $("#DataTable").DataTable({
        "processing": true,
        "serverSide": true,
        "ordering": false,
        dom: '<"top"<"left-col"B><"right-col"f>>r<"table table-striped"t>ip',
                lengthMenu: [
                    [10, 25, 50, -1],
                    ['10 rows', '25 rows', '50 rows', 'Show all']
                ],
                "responsive": true,
                buttons: [{
                        extend: 'colvis',
                        text: "Show/Hide"
                    },{
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
            url: "{{route('EbookReportView')}}",
        },
        columns: [{
                data: 'file_id',
                'searchable': true,
                'orderable': false,
                'class': 'text-center'
            },
            {
                data: 'ebook.ebook_name',
                'searchable': true,
                'orderable': false,
                'class': 'text-center'
            },
            {
                data: 'ebook.no_view',
                'searchable': false,
                'orderable': false,
                'class': 'text-center'
            },
            {
                data: 'location',
                'searchable': true,
                'orderable': false,
                'class': 'text-center'
            },

        ]
    });
});
</script>
<style>
    .dataTables_filter{
        float: right !important;
    }
    </style>
@endsection
