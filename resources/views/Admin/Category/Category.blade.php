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
                                <div class="h5 mb-0 font-weight-bold text-gray-800">Category</div>
                            </div>
                            <div class="col-auto">
                                <button type="button" class="btn btn-primary" data-toggle="modal"
                                    data-target="#CategoryStoreModal" id="AddBtn">Add</button>

                                <div class="modal fade" id="CategoryStoreModal">
                                    <div class="modal-dialog modal-dialog-centered">
                                        <div class="modal-content">
                                            <!-- Modal Header -->
                                            <div class="modal-header">
                                                <h4 class="modal-title">Add Category</h4>
                                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                                            </div>
                                            <!-- Modal body -->
                                            <div class="modal-body">
                                                <form id="CategoryStoreForm">
                                                    @csrf
                                                    <input type="hidden" id="cat_id" name="cat_id">
                                                    <div class="form-group">
                                                        <label>Category Name</label>
                                                        <input type="text"
                                                            class="form-control form-control-user required "
                                                            name="category_name" id="category_name"
                                                            placeholder="Enter Category">
                                                    </div>

                                                    <div class="form-group">
                                                        <label>Category Name in Arabic</label>
                                                        <input type="text"
                                                            class="form-control form-control-user required "
                                                            name="category_name_in_ar" id="category_name_in_ar"
                                                            placeholder="Enter Category in Arabic">
                                                    </div>

                                                </form>
                                            </div>

                                            <!-- Modal footer -->
                                            <div class="modal-footer">
                                                <span id="error" style="display: none;" class="m-auto"></span>
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

            <div class="card-body">
                <div class="row my-3 d-flex justify-content-right">
                    <div class="col-md-4 mt-2">
                    </div>
                    <div class="col-md-6">
                        <div class="row">
                            <div class="col-6"><input type="date" id="date_from" name="date_from" class="form-control">
                            </div>
                            <div class="col-6"><input type="date" id="date_to" name="date_to" class="form-control">
                            </div>
                        </div>
                    </div>
                    <div class="col-md-2">
                        <button type="button" id="Filter_submit" style="width: 100%"  onclick="Getdata()"
                            class="btn btn-primary">Filter</button>
                    </div>
                </div>
                <div class="table-responsive">
                    <table id="DataTable" class="table table-bordered" width="100%" cellspacing="0">
                        <thead>
                            <tr>
                                <th>UID</th>
                                <th>Name</th>
                                <th>Date</th>
                                <th>Action</th>
                            </tr>
                        </thead>
                    </table>
                </div>
            </div>
        </div>
    </div>


    <link href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.13/css/select2.min.css" rel="stylesheet">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.13/js/select2.min.js"></script>

    <script>
        $(function() {

            Getdata();

        });


        $("#AddBtn").click(function(){
        $('#CategoryStoreForm')[0].reset();
        $('#cat_id').val('');
        $("#error").removeClass().html('').hide();
    });

        function Getdata() {

            $("#btnSubmit").prop("disabled", false);
            $("#DataTable").DataTable().destroy();
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
                    url: "{{ route('CategoryShow') }}",
                    data: {
                        from_date: $('#date_from').val(),
                        to_date: $('#date_to').val(),
                        category_name: $('#cat_name').val()
                    },
                },
                columns: [{
                        data: 'id',
                    },
                    {
                        data: 'category_name',
                    },
                    {
                        data: 'created_at',
                    },
                    {
                        data: 'action',
                    },

                ]
            });
        }

        function CategoryStore() {

            $("#btnSubmit").prop("disabled", true);

            $.post("{{ route('CategoryStore') }}", $('#CategoryStoreForm').serialize())
                .done((res) => {
                    $("#btnSubmit").prop("disabled", false);
                    if (res.success) {
                    alertmsg(res.message, "success");
                    Getdata();
                    $("#CategoryStoreModal").modal('hide');
                    $('#CategoryStoreForm')[0].reset();
                    } else if (res.validate) {
                        alertmsg(res.message, "warning")
                    } else {
                        alertmsg(res.message, "danger")
                    }
                })
                .fail((err) => {
                    alertmsg("Something went wrong", "danger");
                });
        }

        function CategoryEdit(id) {
            $.get("{{ route('CategoryEdit') }}", {
                id: id
            }, function(data) {
                $("#cat_id").val(data.data[0]['id']);
                $("#category_name").val(data.data[0]['category_name']);
            });
        }

        function CategoryRemove(id) {
            swal({
                    title: "Are You Sure?",
                    text: "Once Deleted You will not be able to undo this",
                    icon: "warning",
                    buttons: true,
                    dangerMode: true,

                })
                .then((willDelete) => {
                    if (willDelete) {
                        $.get("{{ route('CategoryRemove') }}", {
                            id: id
                        }, function(res) {
                            if (res['success']) {
                                swal({
                                    title: "Successful...",
                                    text: res.message,
                                    icon: "success"
                                })
                                Getdata();
                            }
                        });
                    }
                });
        }
    </script>
@endsection
