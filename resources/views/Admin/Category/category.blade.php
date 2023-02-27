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
                    data-target="#CategoryStoreModal">Add</button>

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
                                    <input type="text" id="cat_id" name="cat_id">
                                    <div class="form-group">
                                    <lable>Category Name</lable>
                                    <input type="text" class="form-control form-control-user required " name="category_name"
                                        id="category_name" placeholder="Enter category">
                                        <div id="category_name_error" style="display:none"></div>
                                    </div>

                                </form>
                            </div>
    
                            <!-- Modal footer -->
                            <div class="modal-footer">
                            <span id="category_error_area" style="display: none;" class="m-auto"></span>
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
            <h6 class="m-0 font-weight-bold text-primary">Category List</h6>
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


<script src="{{url('public/plugins/jquery/jquery.min.js')}}"></script>
<link href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.13/css/select2.min.css" rel="stylesheet">
<script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.13/js/select2.min.js"></script>

<script>

function alertmsg(msg, type) {
            $("#category_name_error").removeClass().html('').show();
            $("#category_name_error").css('color : red').html(msg);
        }

function alertmsg(msg, type) {
    $("#category_error_area").removeClass().html('').show();
    $("#category_error_area").addClass(`alert alert-${type} text-center`).html(msg);
    $("#category_error_area").fadeOut(3000);
}        

$(function() {

var DataTable = $("#DataTable").DataTable({
    "processing": true,
    "serverSide": true,
    ajax: {
        url: "{{route('CategoryShow')}}",
        // data: {
        //   client_id: ""
        // }
    },
    columns: [{
            data: 'id',
        },
        {
            data: 'category_name',
        },
        {
            data: 'action',
        }
    ]
});

$("#department_supervised_by").select2({
    theme: "classic",
    // width: 'resolve'
});

});

function CategoryStore() {

$("#btnSubmit").prop("disabled", true);

$.post("{{route('CategoryStore')}}", $('#CategoryStoreForm').serialize())
        .done((res)=>{
            $("#btnSubmit").prop("disabled", false);
             if(res.success){
                alertmsg(res.message,"success");
                window.location.href = "{{route('Category')}}";
             }else if(res.validate){
                alertmsg(res.message, "warning")
             }else{
                alertmsg(res.message, "danger")
             }
            })
        .fail((err)=>{
            alertmsg("Something went wrong", "danger")
        });
        $("#LoginBtn").prop("disabled", false);
}

function CategoryEdit(id)
  {
    $.get("{{route('CategoryEdit')}}", {id:id}, function(data)
    {
      $("#cat_id").val(data.data[0]['id']);
      $("#category_name").val(data.data[0]['category_name']);
    });
  }
</script>

@endsection
