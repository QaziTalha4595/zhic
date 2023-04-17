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
                            <div class="h5 mb-0 font-weight-bold text-gray-800">Book Request</div>
                        </div>
                        <div class="col-auto">
                            <!-- <button type="button" class="btn btn-primary" data-toggle="modal"
                                data-target="#CategoryStoreModal">Add</button> -->

                            <div class="modal fade" id="CategoryStoreModal">
                                <div class="modal-dialog modal-dialog-centered">
                                    <div class="modal-content border-primary">
                                        <!-- Modal Header -->
                                        <div class="modal-header">
                                            <h4 class="modal-title">Add Category</h4>
                                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                                        </div>
                                        <!-- Modal body -->
                                        <div class="modal-body">
                                            <form id="CategoryStoreForm">
                                                @csrf
                                                <div class="form-group">
                                                    <lable>Name</lable>
                                                    <input type="text"
                                                        class="form-control form-control-user border-primary required "
                                                        id="category_name" name="category_name" autocomplete=" off">
                                                </div>

                                            </form>
                                        </div>
                                        <div class="modal-footer ">
                                            <div class="form-row mt-3 mx-auto">
                                                <div class="form-group text-center">
                                                    <span id="show_error" style="display: none;" class="m-auto"></span>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- Modal footer -->
                                        <div class="modal-footer">
                                            <span id="visitor_error_area" style="display: none;" class="m-auto"></span>
                                            <button type="button" class="btn btn-secondary"
                                                data-dismiss="modal">Close</button>
                                            <button type="button" id="btnSubmit" onclick="CategoryStore()"
                                                class="btn btn-primary">Submit</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<div class="container-fluid">
    <div class="card shadow mb-4">
        <div class="card-header py-3">
            <h6 class="m-0 font-weight-bold">Book Request List</h6>
        </div>
        <div class="card-body">
            <div class="table-responsive">
                <table id="DataTable" class="table table-bordered" width="100%" cellspacing="0">
                    <thead>
                        <tr>
                            <th>UID</th>
                            <th>Book Title</th>
                            <th>Name</th>
                            <th>Email</th>
                            <th>Address</th>
                            <th>Spoken</th>
                            <th>Message</th>
                            <th>Date</th>
                        </tr>
                    </thead>
                </table>
            </div>
        </div>
    </div>
</div>

<div class="modal fade" id="CategoryEditModal">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <!-- Modal Header -->
            <div class="modal-header">
                <h4 class="modal-title">Category Update</h4>
                <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>
            <!-- Modal body -->
            <div class="modal-body">
                <form id="CategoryEditForm">
                    @csrf
                    <input type="hidden" id="categorys_id" name="category_id">
                    <div class="form-group">
                        <lable>Name</lable>
                        <input type="text" class="form-control form-control-user border-primary category_input "
                            id="categorys_name" name="category_name" autocomplete=" off">
                    </div>
                </form>
            </div>
            <div class="modal-footer ">
                <div class="form-row mt-3 mx-auto">
                    <div class="form-group text-center">
                        <span id="edit_show_error" style="display: none;" class="m-auto"></span>
                    </div>
                </div>
            </div>
            <!-- Modal footer -->
            <div class="modal-footer">
                <span id="visitor_error_area" style="display: none;" class="m-auto"></span>
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                <button type="button" id="btnUpdate" onclick="CategoryUpdate()" class="btn btn-primary">Update</button>
            </div>
        </div>
    </div>
</div>


<script src="{{url('public/plugins/jquery/jquery.min.js')}}"></script>
<link href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.13/css/select2.min.css" rel="stylesheet">
<script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.13/js/select2.min.js"></script>

<script type="text/javascript">
var base_url = "{{url('/')}}";
$(function() {

    var DataTable = $("#DataTable").DataTable({
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
            url: "{{route('BookRequestShow')}}",
            // data: {
            //   client_id: ""
            // }
        },
        columns: [{
                data: 'request_id',
                'searchable': false,
                'orderable': false,
                'class': 'text-center'
            },
            {
                data: 'book_name',
                'searchable': true,
                'orderable': false,
                'class': 'text-center'
            },
            {
                data: 'user_name',
                'searchable': true,
                'orderable': false,
                'class': 'text-center'
            },
            {
                data: 'user_email',
                'searchable': true,
                'orderable': false,
                'class': 'text-center'
            },
            {
                data: 'user_nationality',
                'searchable': true,
                'orderable': false,
                'class': 'text-center'
            },
            {
                data: 'user_spoken',
                'searchable': true,
                'orderable': false,
                'class': 'text-center'
            },
            {
                data: 'user_message',
                'searchable': true,
                'orderable': false,
                'class': 'text-center'
            },
            {
                data: 'request_date',
                'searchable': true,
                'orderable': false,
                'class': 'text-center'
            },
        ]
    });

    $("#department_supervised_by").select2({
        theme: "classic",
        // width: 'resolve'
    });

});
</script>

@endsection
