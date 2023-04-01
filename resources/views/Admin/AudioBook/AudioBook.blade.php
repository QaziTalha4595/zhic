@extends('Admin.AdminLayout')
@section('content')
<div class="main_div">
    <div class="col-lg-12">
        <div class="card shadow">
            <div class="card-body">
                <div class="row no-gutters align-items-center">
                    <div class="col mr-2">
                        <div class="h5 mb-0 font-weight-bold text-gray-800">Audio-book Upload</div>
                    </div>
                    <div class="col-auto">
                        <a href="{{route('AudioBookBasic')}}" class="btn btn-primary">Add</a>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="table col-lg-12">
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
                                <th>Action</th>
                            </tr>
                        </thead>
                    </table>
                </div>
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
        url: "{{route('AudioBookShow')}}",
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
            data: 'Audio File',
            'searchable': false,
            'orderable': false,
        },

        {
            data: 'Action',
            'searchable': false,
            'orderable': false,
            'class': 'text-center',
            render: (id)=>{
                return(`
                <a href="AudioBook-${id}-Basic" class="btn btn-primary btn-circle"><i class="fas fa-pencil-alt "></i></a>
                <button class="btn btn-danger btn-circle" onclick="AudioBookRemove(${id})"><i class="fa fa-trash"></i></button>
                `)
            }
        }
    ]
});
});
function AudioBookRemove(id) {
            swal({
                    title: "Are You Sure?",
                    text: "Once Deleted You will not be able to recover this file",
                    icon: "warning",
                    buttons: true,
                    dangerMode: true,

                })
                .then((willDelete) => {
                    if (willDelete) {
                        $.get("{{ route('AudioBookRemove') }}", {
                            id: id
                        }, function(data) {
                            console.log(data);
                            if (data['success'] == true) {
                                swal("Proof! Audio Book Have been Deleted..!", {
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
