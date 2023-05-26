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
                        <button type="button" id="Filter_submit" style="width: 70px" onclick=" Getdata()" class="btn btn-primary">Filter</button>
                        <button type="button" style="width: 70px" title="Refresh Select Box" class="btn btn-secondary ml-2" id="resetBtn" onclick="ResetData()">Reset</button>

                    </div>
                </div>
            </form>
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
                            <th>Date</th>
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

    Getdata();

});
function ResetData()
        {
            $('#date_from').val(''),
            $('#date_to').val(''),
            $('#cat_name').val('')
        }
function Getdata(){

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
            url: "{{route('AllBookShow')}}",
            data:
            {
                from_date: $('#date_from').val(),
                    to_date: $('#date_to').val(),
                    category_name : $('#cat_name').val()
            },
        },
        columns: [{
                        data: 'file_id',
                        'searchable': false,
                        'orderable': false,
                        'class': 'text-center'
                    },
                    {
                        data: 'category.category_name',
                        'searchable': true,
                        'orderable': true,
                        'class': 'text-center'
                    },
                    {
                        data: 'subcategory.sub_category_name',
                        'searchable': true,
                        'orderable': true,
                        'class': 'text-center'
                    },
                    {
                        data: 'ebook_name',
                        'searchable': false,
                        'orderable': false,
                        'class': 'text-center'
                    },
                    {
                        data: 'unique_id',
                        'searchable': false,
                        'orderable': false,
                        'class': 'text-center'
                    },
                    {
                        data: 'no_view',
                        'searchable': false,
                        'orderable': false,
                        'class': 'text-center'
                    },
                    {
            data: 'created_at',
        },
                ]
            });


}
</script>

@endsection
