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
                            <a href="{{ route('AudioBookBasic') }}" class="btn btn-primary">Add</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="table col-lg-12">
            <div class="card shadow mb-4">
                <div class="card-body">
                    <form action="" class="mb-3">
                        <div class="row ml-5">
                            <div class="col-md-2">
                                <input type="date" id="date_from" name="date_from" class="form-control">
                            </div>
                            <div class="col-md-2">
                                <input type="date" id="date_to" name="date_to" class="form-control">
                            </div>
                            <div class="col-md-3">
                                <select name="category_id_filter" id="category_id_filter" class="form-control">
                                    <option value="">All Category</option>
                                    @foreach ($Category as $item)
                                        <option value="{{ $item->id }}">{{ $item->category_name }}</option>
                                    @endforeach
                                </select>
                            </div>
                            <div class="col-md-3">
                                <select name="sub_category_id_filter" disabled id="sub_category_id_filter" class="form-control">
                                    <option value="">Sub Category</option>
                                </select>
                            </div>
                            <div class="col-md-2">
                                <button type="button" id="Filter_submit" onclick=" GetData()"
                                    class="btn btn-primary">Filter</button>
                                <button type="button" style="width: 70px" title="Refresh Select Box"
                                    class="btn btn-secondary ml-2" id="resetBtn" onclick="ResetData()">Reset</button>

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
                                    <th>Date</th>
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

            GetData();

            //for Filters
            $("#category_id_filter").change(function(event) {



                var idCategory = this.value;
                $("#sub_category_id_filter").html(
                ' <option value="" selected>Select SubCategory</option> ');
                $("#sub_category_id_filter").attr("disabled", false)

                $.ajax({

                    type: "GET",
                    url: "{{ route('FetchSubCategory') }}",
                    dataType: 'json',
                    data: {
                        cat_id: idCategory
                    },
                    success: function(response) {
                        $.each(response.data.sub_categories, function(index, val) {
                            console.log(val);
                            $("#sub_category_id_filter").append('<option value="' + val
                                .id + '">' + val.sub_category_name + '</option>')
                        });
                    }

                });

            });
        });
        function ResetData()
        {
            $('#date_from').val(''),
             $('#date_to').val(''),
             $('#category_id_filter').val(''),
             $('#sub_category_id_filter').val('').prop('disabled', true);
        }
        function GetData() {
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
                            columns: [0, ':visible'],
                            columns: ':visible:not(:contains(Action))'
                        }
                    }, 'pageLength'

                ],
                ajax: {
                    url: "{{ route('AudioBookShow') }}",
                    data: {
                    from_date: $('#date_from').val(),
                    to_date: $('#date_to').val(),
                    category_name : $('#category_id_filter').val(),
                    sub_category_name : $('#sub_category_id_filter').val()
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
                        data: 'ebookaudio.audio_file',
                        'searchable': false,
                        'orderable': false,
                    },
                    {
                        data: 'created_at',
                    },
                    {
                        data: 'Action',
                        'searchable': false,
                        'orderable': false,
                        'class': 'text-center',
                        render: (id) => {
                            return (`
                <a href="AudioBook-${id}-Basic" class="btn btn-primary btn-md"><i class="fas fa-pencil-alt "></i></a>
                <button class="btn btn-danger btn-md" onclick="AudioBookRemove(${id})"><i class="fa fa-trash"></i></button>
                `)
                        }
                    }
                ]
            });
        }

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
                        }, function(res) {
                            console.log(res);
                            if (res['success'] == true) {
                                swal("Proof! Audio Book Have been Deleted..!", {
                                    title: "Successful...",
                                    text: res.message,
                                    icon: "success"
                                });
                                GetData();
                            }
                        });
                    }
                });
        }
    </script>
@endsection
