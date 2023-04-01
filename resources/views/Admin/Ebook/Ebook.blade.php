@extends('Admin.AdminLayout')

@section('content')
    <style>
        td.text-center {
            vertical-align: middle;
        }

        .left-col {
            float: left;
            width: 50%;
            padding-bottom: 10px
        }

        .right-col {
            float: left;
            width: 50%;
            padding-bottom: 10px
        }
        .dropdown-menu{
            width: 150px!important;
        }
    </style>
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
                            <div id="btncontainer"></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="container-fluid">
        <div class="card shadow mb-4">
            <div class="card-body">
                <div class="table-responsive" style="    padding: 10px;">
                    <table id="DataTable" class="table table-bordered" width="100%" cellspacing="0">
                        <thead>
                            <tr>
                                <th>Id</th>
                                <th>Thumbnail</th>
                                <th>Category</th>
                                <th>Sub Category</th>
                                <th>Third Category</th>
                                <th>Title</th>
                                <th>Book ISBN</th>
                                <th>Book Author</th>
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
                dom: '<"top"<"left-col"B><"right-col"f>>r<"table table-striped"t>ip',
                lengthMenu: [
                    [10, 25, 50, -1],
                    ['10 rows', '25 rows', '50 rows', 'Show all']
                ],
                "responsive": true,
                buttons: [{
                        extend: 'colvis',
                        text: "Show/Hide"
                    },
                    {
                        extend: 'excelHtml5',
                        text: "Export to excel"
                    },
                    {
                        extend: 'print',
                        text: "Print"
                    }, 'pageLength'
                ],
                ajax: {
                    url: "{{ route('EbookShow') }}",
                },
                columns: [{
                        data: 'file_id',
                        'searchable': false,
                        'orderable': false,
                        'class': 'text-center'
                    },
                    {
                        data: 'Thumbnail',
                        'searchable': false,
                        'orderable': false,
                        render: function(data) {
                            return `<img src="{{ url('public/Files/E_Book_CoverImg') }}/${data}"  onerror="this.onerror=null;this.src='{{ url('public/imgerror.png') }}';" style="width:100px;height:auto">`;
                        }
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
                        data: 'ThirdCategory',
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
                        data: 'Action',
                        'searchable': false,
                        'orderable': false,
                        'class': 'text-center',
                        render: (id)=>{
                            return(`<button class="btn  btn-danger btn-circle mb-1" onclick="EbookRemove(${id})"><i class="fa fa-trash"></i></button>
                                    <a href="Ebook-${id}-Basic" class="btn btn-primary btn-circle"><i class="fas fa-pencil-alt "></i></a>`)
                        }
                    }
                ]
            });
        });
        function EbookRemove(id) {
            swal({
                    title: "Are You Sure?",
                    text: "Once Deleted You will not be able to recover this file",
                    icon: "warning",
                    buttons: true,
                    dangerMode: true,

                })
                .then((willDelete) => {
                    if (willDelete) {
                        $.get("{{ route('EbookRemove') }}", {
                            id: id
                        }, function(data) {
                            console.log(data);
                            if (data['success'] == true) {
                                swal("Proof! Ebook Have been Deleted..!", {
                                    icon: "success",
                                });
                                tables = $("#DataTable").dataTable();
                                tables.fnPageChange('first', 1);
                            }
                        });
                    } else {
                        swal("Your file is safe!");
                    }
                });
        }
    </script>
@endsection
