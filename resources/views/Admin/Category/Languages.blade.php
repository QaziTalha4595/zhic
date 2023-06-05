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
                                <div class="h5 mb-0 font-weight-bold text-gray-800">Language</div>
                            </div>
                            <div class="col-auto">
                                <button type="button" class="btn btn-primary" data-toggle="modal"
                                    data-target="#LanguageStoreModal" id="AddBtn">Add</button>

                                <div class="modal fade" id="LanguageStoreModal">
                                    <div class="modal-dialog modal-dialog-centered">
                                        <div class="modal-content">
                                            <!-- Modal Header -->
                                            <div class="modal-header">
                                                <h4 class="modal-title">Add Language</h4>
                                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                                            </div>
                                            <!-- Modal body -->
                                            <div class="modal-body">
                                                <form id="LanguageStoreForm">
                                                    @csrf
                                                    <div class="form-group">
                                                        <input type="hidden" id="lang_id" name="lang_id">
                                                        <label>Language</label>
                                                        <input type="text"
                                                            class="form-control form-control-user required " id="language"
                                                            name="language" placeholder="Enter Language">
                                                    </div>

                                                </form>
                                            </div>
                                            <!-- Modal footer -->
                                            <div class="modal-footer">
                                                <span id="error" style="display: none;" class="m-auto"></span>
                                                <button type="button" class="btn btn-secondary"
                                                    data-dismiss="modal">Close</button>
                                                <button type="button" id="btnSubmit" onclick="LanguageStore()"
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
                <h6 class="m-0 font-weight-bold ">Language List</h6>
            </div>
            <div class="card-body">
                <div class="table-responsive">
                    <table id="DataTable" class="table table-bordered" width="100%" cellspacing="0">
                        <thead>
                            <tr>
                                <th>UID</th>
                                <th>Name</th>
                                <th>Action</th>
                            </tr>
                        </thead>
                    </table>
                </div>
            </div>
        </div>
    </div>

    <script src="{{ url('public/plugins/jquery/jquery.min.js') }}"></script>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.13/css/select2.min.css" rel="stylesheet">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.13/js/select2.min.js"></script>

    <script>
        $(function() {

            Getdata();

            $("#department_supervised_by").select2({
                theme: "classic",
                // width: 'resolve'
            });

        });

        function Getdata() {

            $("#DataTable").DataTable().destroy();
            var DataTable = $("#DataTable").DataTable({
                processing: true, serverSide: true, responsive: true,
                dom: '<"top"<"left-col"B><"right-col"f>>r<"table table-striped"t>ip',
                order: [[0, 'desc']],
                lengthMenu: [[10, 25, 50, -1], ['10 rows', '25 rows', '50 rows', 'Show all']],
                buttons: ['pageLength'],
                ajax: {
                    url: "{{ route('LanguageShow') }}",
                },
                columns: [{
                        data: 'language_id',
                    },
                    {
                        data: 'language',
                    },
                    {
                        data: 'action',
                    }
                ]
            });
        }
        $("#AddBtn").click(function() {
            $('#LanguageStoreForm')[0].reset();
            $('#lang_id').val('');
            $("#btnSubmit").prop("disabled", false);
            $("#error").removeClass().html('').hide();
        });

        function LanguageStore() {
            $("#btnSubmit").prop("disabled", true);
            $.post("{{ route('LanguageStore') }}", $('#LanguageStoreForm').serialize())
                .done((res) => {
                    $("#btnSubmit").prop("disabled", false);
                    if (res.success) {
                        $("#btnSubmit").prop("disabled", false);
                        alertmsg(res.message, "success");
                        Getdata();
                        $("#LanguageStoreModal").modal('hide');
                        $("#LanguageStoreForm")[0].reset();
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

        function LanguageEdit(language_id) {
            $('#LanguageStoreModal').modal('show');
            $.get("{{ route('LanguageEdit') }}", {language_id: language_id}, (data)=>{
                $("#lang_id").val(data.data[0]['id']);
                $("#language").val(data.data[0]['language']);
            });
        }

        function LanguageRemove(id) {
            swal({
                    title: "Are You Sure?",
                    text: "Once Deleted You will not be able to recover this file",
                    icon: "warning",
                    buttons: true,
                    dangerMode: true,

                })
                .then((willDelete) => {
                    if (willDelete) {
                        $.get("{{ route('LanguageRemove') }}", {
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
