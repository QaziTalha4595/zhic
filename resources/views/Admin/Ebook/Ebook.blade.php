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
                <form action="" class="mb-3">
                    <div class="row">
                        <div class="col-md-4">
                            <select name="cat_name" id="cat_name" class="form-control">
                                <option value="">All Category</option>
                                @foreach($categories as $item)
                                <option value="{{ $item->id }}">{{ $item->category_name }}</option>
                                @endforeach
                            </select>
                        </div>
                        <div class="col-md-6">
                            <div class="row">
                                <div class="col-6"><input type="date" id="date_from" name="date_from" class="form-control"></div>
                                <div class="col-6"><input type="date" id="date_to" name="date_to" class="form-control"></div>
                            </div>
                        </div>
                        <div class="col-md-2">
                            <button type="button"  style="width: 70px" id="Filter_submit" onclick=" GetData()" class="btn btn-primary">Filter</button>
                            <button type="button" style="width: 70px" title="Refresh Select Box" class="btn btn-secondary ml-2" id="resetBtn" onclick="ResetData()">Reset</button>

                        </div>
                    </div>
                </form>
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
                                <th>Date</th>
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

            GetData();

        });
        function ResetData()
        {
            $('#date_from').val(''),
            $('#date_to').val(''),
            $('#cat_name').val('')
        }
        function GetData()
        {
            $("#DataTable").DataTable().destroy();
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
                        text: "Print",

                        exportOptions: {
                    columns: [ 0, ':visible' ],
                    columns: ':visible:not(:contains(Action))'
                }
                    }, 'pageLength'
                ],
                ajax: {
                    url: "{{ route('EbookShow') }}",
                    data: {
                    from_date: $('#date_from').val(),
                    to_date: $('#date_to').val(),
                    category_name : $('#cat_name').val()
                },
                },
                columns: [{
                    data: 'file_id',
                    'searchable': false,
                    'orderable': true,
                    'class': 'text-center'
                },
                {
                    data: 'ebookcover.ebook_cover',
                    'searchable': false,
                    'orderable': false,
                    render: function(data, type) {

                        return `<center><img src="{{ url('public/Files/E_Book_CoverImg') }}/${data}"  onerror="this.onerror=null;this.src='{{ url('public/imgerror.png') }}';" style="height: 100px; width:auto; margin-auto"><span style="display:none;  ">{{ url('public/Files/E_Book_CoverImg') }}/${data}</span></center>`;

                        }
                    },
                    {

                        data: 'category.category_name',
                        'searchable': true,
                        'orderable': true,
                        'class': 'text-center'

                    },
                    {
                        data: 'subcategory.sub_category_name',
                        'searchable': false,
                        'orderable': false,
                        'class': 'text-center'
                    },
                    {
                        data: 'thirdcategory.third_category_name',
                        'searchable': false,
                        'orderable': false,
                        'class': 'text-center'
                    },
                    {
                        data: 'ebook_name',
                        'searchable': false,
                        'orderable': false,
                        'class': 'text-center'
                    },
                    {
                        data: 'ebook_isbn',
                        'searchable': false,
                        'orderable': false,
                        'class': 'text-center'
                    },
                    {
                        data: 'ebook_author',
                        'searchable': false,
                        'orderable': false,
                        'class': 'text-center'
                    },
                    {
                        data: 'created_at'
                    },

                    {
                        data: 'action',
                        'searchable': false,
                        'orderable': false,

                        'class': 'text-center',
                        render: (id)=>{
                            return(`<a href="Ebook-${id}-Basic" class="btn btn-primary btn-md   "><i class="fas fa-pencil-alt "></i></a>
                            <button class="btn  btn-danger btn-md    mt-1" onclick="EbookRemove(${id})"><i class="fa fa-trash"></i></button>
                            `)
                        }
                    }
                ]

            });
        }
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
                        }, function(res) {
                            if (res['success']) {
                                swal({
                                    title: "Successful...",
                                    text: res.message,
                                    icon: "success"
                                })
                                GetData();
                            }
                        });
                    }
        });
    }
    </script>
@endsection
