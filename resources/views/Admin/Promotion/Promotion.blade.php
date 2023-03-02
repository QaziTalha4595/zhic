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
                            <div class="h5 mb-0 font-weight-bold text-gray-800">Promotion</div>
                        </div>
                        <div class="col-auto">
                            <button type="button" class="btn btn-primary" data-toggle="modal"
                                data-target="#PromotionStoreModal">Add</button>

                            <div class="modal fade" id="PromotionStoreModal">
                                <div class="modal-dialog modal-dialog-centered">
                                    <div class="modal-content border-primary">
                                        <!-- Modal Header -->
                                        <div class="modal-header">
                                            <h4 class="modal-title">Add Promotion</h4>
                                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                                        </div>
                                        <!-- Modal body -->
                                        <div class="modal-body">
                                            <form id="PromotionStoreForm">
                                                @csrf
                                                <div class="form-group">
                                                    <label>Category</label>
                                                    <select class="form-control select2" name="category_id"
                                                        id="category_id" style="width:100%;">
                                                        <option selected disabled>Select</option>
                                                        @foreach($Categories as $Category)
                                                        <option value="{{ $Category->id }}">{{ $Category->category_name }}</option>
                                                        @endforeach
                                                    </select>
                                                </div>
                                                <div class="form-group">
                                                    <label>Sub Category</label>
                                                    <select class="form-control select2" name="sub_cat_id"
                                                        id="sub_cat_id" style="width:100%;">
                                                        <option selected disabled>Select</option>
                                                    </select>
                                                </div>
                                                <div class="form-group">
                                                    <lable>Promotion Image</lable>
                                                    <input type="file" class="form-control form-control-user required"
                                                        id="promotion_attachment" name="promotion_attachment"
                                                        placeholder="Enter promotion Image">
                                                </div>

                                            </form>
                                        </div>
                                        <div class="form-group text-center">
                                            <span id="show_error" style="display: none;" class="m-auto"></span>
                                        </div>
                                        <!-- Modal footer -->
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-secondary"
                                                data-dismiss="modal">Close</button>
                                            <button type="button" id="btnSubmit" onclick="PromotionStore()"
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
            <h6 class="m-0 font-weight-bold text-primary">Promotion List</h6>
        </div>
        <div class="card-body">
            <div class="table-responsive">
                <table id="DataTable" class="table table-bordered" width="100%" cellspacing="0">
                    <thead>
                        <tr>
                            <th style="width:10%">UID</th>
                            <th style="width:10%">Category</th>
                            <th style="width:10%">Sub Category</th>
                            <th style="width:40%">Promotion Image</th>
                            <th style="width:10%">Action</th>
                        </tr>
                    </thead>
                </table>
            </div>
        </div>
    </div>
</div>

<div class="modal fade" id="PromotionEditModal">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content border-primary">
            <!-- Modal Header -->
            <div class="modal-header">
                <h4 class="modal-title">Category Update</h4>
                <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>
            <!-- Modal body -->
            <div class="modal-body" id="PromotionBody">
            </div>
            <div class="form-group text-center">
                <span id="edit_show_error" style="display: none;" class="m-auto"></span>
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


<style>
.w-25>img {
    width: 50px;
}
</style>
<script src="{{url('public/plugins/jquery/jquery.min.js')}}"></script>
<link href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.13/css/select2.min.css" rel="stylesheet">
<script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.13/js/select2.min.js"></script>
<script>

function alertmsg(msg, type) {
    $("#third_category_error_area").removeClass().html('').show();
    $("#third_category_error_area").addClass(`alert alert-${type} text-center`).html(msg);
    $("#third_category_error_area").fadeOut(3000);
}        


$(function(){
    $("#category_id").change(function(event){

                

    var idCategory = this.value;
    $("#sub_cat_id").html(' <option value="" selected>Select SubCategory</option> ');
    $("#sub_cat_id").attr("disabled", false)

    $.ajax({

    type : "GET",
    url : "{{route('FetchSubCategory')}}",
    dataType : 'json',
    data : {cat_id: idCategory},
    success : function(response)
    {
        $.each(response.data.sub_categories,function(index, val){
            console.log(val);
        $("#sub_cat_id").append('<option value="'+val.id+'">'+val.sub_category_name+'</option>')
        });
    }

    });

    });
});

function PromotionStore() {

$("#btnSubmit").prop("disabled", true);

$.post("{{route('PromotionStore')}}", $('#PromotionStoreForm').serialize())
        .done((res)=>{
            $("#btnSubmit").prop("disabled", false);
             if(res.success){
                $("#btnSubmit").prop("disabled", true);
                alertmsg(res.message,"success");
                window.location.href = "{{route('Promotion')}}";
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


</script>

@endsection