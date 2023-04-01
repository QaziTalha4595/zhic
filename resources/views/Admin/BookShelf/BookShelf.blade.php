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
                            <div class="h5 mb-0 font-weight-bold text-gray-800">Bookshelf</div>
                        </div>
                        <div class="col-auto">
                            <button type="button" class="btn btn-primary" data-toggle="modal"
                                data-target="#BookshelfStoreModal">Add</button>

                            <div class="modal fade" id="BookshelfStoreModal">
                                <div class="modal-dialog modal-dialog-centered">
                                    <div class="modal-content">
                                        <!-- Modal Header -->
                                        <div class="modal-header">
                                            <h4 class="modal-title">Add Bookshelf</h4>
                                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                                        </div>
                                        <!-- Modal body -->
                                        <div class="modal-body">
                                            <form id="BookshelfStoreForm">
                                                @csrf
                                                <div class="form-group">
                                                    <input type="hidden" id="book_shelf_id" name="book_shelf_id">
                                                    <label>Book</label>
                                                    <select class="form-control select2" name="book_name" id="book_name"
                                                        style="width:100%;">
                                                        <option selected disabled>select book </option>
                                                        @foreach($Ebook as $item)
                                                        <option value="{{$item->file_id ?? ''}}">
                                                            {{$item->ebook_name ?? ''}}</option>
                                                        @endforeach
                                                    </select>
                                                </div>
                                                <div class="form-group">
                                                    <label>Book</label>
                                                    <select class="form-control select2" name="book_position" id="book_position"
                                                        style="width:100%;">
                                                        <option selected disabled>select position </option>
                                                        <option value="1">1</option>
                                                        <option value="2">2</option>
                                                        <option value="3">3</option>
                                                        <option value="4">4</option>
                                                        <option value="5">5</option>
                                                        <option value="6">6</option>
                                                        <option value="7">7</option>
                                                        <option value="8">8</option>
                                                        <option value="9">9</option>
                                                        <option value="10">10</option>
                                                    </select>
                                                </div>

                                            </form>
                                        </div>

                                        <!-- Modal footer -->
                                        <div class="modal-footer">
                                            <span id="error" style="display: none;" class="m-auto"></span>
                                            <button type="button" class="btn btn-secondary"
                                                data-dismiss="modal">Close</button>
                                            <button type="button" id="btnSubmit" onclick="BookshelfStore()"
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
            <h6 class="m-0 font-weight-bold text-primary">Book Shelf List</h6>
        </div>
        <div class="card-body">
            <div class="table-responsive">
                <table id="DataTable" class="table table-bordered" width="100%" cellspacing="0">
                    <thead>
                        <tr>
                            <th style="width:10%">UID</th>
                            <th style="width:10%">Book Name</th>
                            <th style="width:40%">Promotion Image</th>
                            <th style="width:10%">Action</th>
                        </tr>
                    </thead>
                </table>
            </div>
        </div>
    </div>
</div>

<script>
  function alertmsg(msg, type) {

        $("#book_error_area").removeClass().html('').show();
        $("#book_error_area").addClass(`alert alert-${type} text-center`).html(msg);
        $("#book_error_area").fadeOut(3000);
    }

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
    buttons: ['pageLength'],
    ajax: {
        url: "{{route('BookShelfShow')}}",
        // data: {
        //   client_id: ""
        // }
    },
    columns: [{
            data: 'book_shelf_id',
            'searchable': false,
            'orderable': false,
            'class': 'text-center'
        },
        {
            data: 'ebook',
            'searchable': true,
            'orderable': true,
            'class': 'text-center'
        },
        {
            data: 'ebook__cover',

                render: function(data) {
                            return `<img src="{{url("public/Files/E_Book_CoverImg")}}/${data}"  onerror="this.onerror=null;this.src='{{ url('public/imgerror.png') }}';" style="width:100px;height:auto">`;
                        }
        },
        {
            data: 'Action',
                    'searchable': false,
                    'orderable': false,
                    'class': 'text-center',
                    render: function(id){

                        return(`<button class="btn btn-primary" data-toggle="modal" data-target="#BookshelfStoreModal"
            onclick="BookShelfEdit('${id}')">
            <i class="fa fa-edit"></i></button>
            <button class="btn btn-danger" onclick="BookShelfRemove('${id}')"><i class="fa fa-trash"></i>
            </button>`)
        }
        }
    ]
});
});




function BookshelfStore() {

    $("#btnSubmit").prop("disabled", true);

    $.post("{{route('BookShelfStore')}}", $('#BookshelfStoreForm').serialize())
        .done((res) => {
            $("#btnSubmit").prop("disabled", false);
            if (res.success) {
                $("#btnSubmit").prop("disabled", true);
                alertmsg(res.message, "success");
                window.location.href = "{{route('BookShelf')}}";
            } else if (res.validate) {
                alertmsg(res.message, "warning")
            } else {
                alertmsg(res.message, "danger")
            }
        })
        .fail((err) => {
            alertmsg("Something went wrong", "danger")
        });
    $("#LoginBtn").prop("disabled", false);
    }
    function BookShelfEdit(id) {
        $.get("{{route('BookShelfEdit')}}", {
            id: id
        }, function(data) {

            $("#book_shelf_id").val(data.data[0]['book_shelf_id']);
            $("#book_name").val(data.data[0]['file_id']);
            $("#book_position").val(data.data[0]['book_position']);
        });
    }
    function BookShelfRemove(id) {
        swal({
                title: "Are You Sure?",
                text: "Once Deleted You will not be able to recover this file",
                icon: "warning",
                buttons: true,
                dangerMode: true,

            })
            .then((willDelete) => {
                if (willDelete) {
                    $.get("{{route('BookShelfRemove')}}", {
                        id: id
                    }, function(data) {
                        console.log(data);
                        if (data['success'] == true) {
                            swal("Proof! Book Shelf Have been Deleted..!", {
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
