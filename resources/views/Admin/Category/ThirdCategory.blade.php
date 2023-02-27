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
                            <div class="h5 mb-0 font-weight-bold text-gray-800">Third Category</div>
                        </div>
                        <div class="col-auto">
                            <button type="button" class="btn btn-primary" data-toggle="modal"
                                data-target="#ThirdCategoryStoreModal">Add</button>

                            <div class="modal fade" id="ThirdCategoryStoreModal">
                                <div class="modal-dialog modal-dialog-centered">
                                    <div class="modal-content border-primary">
                                        <!-- Modal Header -->
                                        <div class="modal-header">
                                            <h4 class="modal-title">Add Third Category</h4>
                                        </div>
                                        <!-- Modal body -->
                                        <div class="modal-body">
                                            <form id="ThirdCategoryStoreForm">
                                                @csrf
                                                <input type="text" id="third_cat_id" name="third_cat_id">
                                                <div class="form-group">
                                                    <label>Category</label>
                                                    <select class="form-control select2" name="category_id"
                                                        id="category_id" style="width:100%;">
                                                        <option>Select</option>
                                                        @foreach($Category as $item)
                                                        <option value="{{ $item->id }}">{{ $item->category_name }}</option>      
                                                        @endforeach
                                                    </select>
                                                </div>
                                                <div class="form-group">
                                                    <label>Sub Category</label>
                                                    <select class="form-control select2" name="sub_category_id"
                                                        id="sub_category_id" style="width:100%;">
                                                        <option>Select</option>
                                                        @foreach($SubCategory as $item)
                                                        <option value="{{ $item->id }}">{{ $item->sub_category_name }}</option>      
                                                        @endforeach
                                                    </select>
                                                </div>
                                                <div class="form-group">
                                                    <lable class="text-bold">Third Category Name</lable>
                                                    <input type="text"
                                                        class="form-control form-control-user border-primary required "
                                                        id="third_category_name" name="third_category_name"
                                                        onkeyup="slugGenrator()">
                                                </div>
                                                <div class="form-group">
                                                    <lable class="text-bold">Third Category Slug</lable>
                                                    <input type="text"
                                                        class="form-control form-control-user border-primary required "
                                                        id="slug" name="slug" autocomplete=" off">
                                                </div>

                                            </form>
                                        </div>
                                        <div class="form-row mt-3 mx-auto">
                                            <div class="form-group text-center">
                                                <span id="show_error" style="display: none;" class="m-auto"></span>
                                            </div>
                                        </div>
                                        <!-- Modal footer -->
                                        <div class="modal-footer">
                                            <span id="third_category_error_area" style="display: none;" class="m-auto"></span>
                                            <button type="button" class="btn btn-secondary"
                                                data-dismiss="modal">Close</button>
                                            <button type="button" id="btnSubmit" onclick="ThirdCategoryStore()"
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
            <div class="table-responsive">
                <table id="DataTable" class="table table-bordered" width="100%" cellspacing="0">
                    <thead>
                        <tr>
                            <th>UID</th>
                            <th>Category</th>
                            <th>Sub Category</th>
                            <th>Third Category</th>
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
    $("#third_category_error_area").removeClass().html('').show();
    $("#third_category_error_area").addClass(`alert alert-${type} text-center`).html(msg);
    $("#third_category_error_area").fadeOut(3000);
}        


$(function() {

var DataTable = $("#DataTable").DataTable({
    "processing": true,
    "serverSide": true,
    ajax: {
        url: "{{route('ThirdCategoryShow')}}",
    },
    columns: [{
            data: 'id',
        },
        {
            data: 'Category',
        },
        {
            data: 'Sub Category',
        },
        {
            data: 'third_category_name',
        },
        {
            data: 'action',
        }
    ]
});
});


function ThirdCategoryStore() {

$("#btnSubmit").prop("disabled", true);

$.post("{{route('ThirdCategoryStore')}}", $('#ThirdCategoryStoreForm').serialize())
        .done((res)=>{
            $("#btnSubmit").prop("disabled", false);
             if(res.success){
                $("#btnSubmit").prop("disabled", true);
                alertmsg(res.message,"success");
                window.location.href = "{{route('ThirdCategory')}}";
             }else if(res.validate){
                alertmsg(res.message, "warning")
             }else{
                alertmsg(res.message, "danger")
             }
            })
        .fail((err)=>{
            
            alertmsg("Something went wrong", "danger");
            $("#btnSubmit").prop("disabled", false);
        });
        $("#LoginBtn").prop("disabled", false);
}
function ThirdCategoryEdit(id)
  {
    $.get("{{route('ThirdCategoryEdit')}}", {id:id}, function(data)
    {
      $("#third_cat_id").val(data.data[0]['id']);
      $("#category_id").val(data.data[0]['category_id']);
      $("#sub_category_id").val(data.data[0]['sub_category_id']);
      $("#third_category_name").val(data.data[0]['third_category_name']);
      $("#slug").val(data.data[0]['slug']);
    });
  }
</script>


@endsection
