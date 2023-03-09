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
                            <div class="h5 mb-0 font-weight-bold text-gray-800">Sub Category</div>
                        </div>
                        <div class="col-auto">
                            <button type="button" class="btn btn-primary" data-toggle="modal"
                                data-target="#SubCategoryStoreModal">Add</button>

                            <div class="modal fade" id="SubCategoryStoreModal">
                                <div class="modal-dialog modal-dialog-centered">
                                    <div class="modal-content border-primary">
                                        <!-- Modal Header -->
                                        <div class="modal-header">
                                            <h4 class="modal-title">Add Sub Category</h4>
                                        </div>
                                        <!-- Modal body -->
                                        <div class="modal-body">
                                            <form id="SubCategoryStoreForm">
                                                @csrf
                                                <input type="hidden" id="sub_cat_id" name="sub_cat_id">
                                                <div class="form-group">
                                                    <label>Category</label>
                                                    <select class="form-control select2" name="category_id"
                                                        id="category_id" style="width:100%;">
                                                       @foreach($categories as $category)
                                                       <option value="{{ $category->id }}">{{ $category->category_name }}</option>
                                                       @endforeach
                                                    </select>
                                                </div>
                                                <div class="form-group">
                                                    <lable class="text-bold">Sub Category Name</lable>
                                                    <input type="text"
                                                        class="form-control form-control-user border-primary required"
                                                        id="sub_category_name" name="sub_category_name"
                                                        autocomplete=" off">
                                                </div>

                                            </form>
                                        </div>
                                        <!-- Modal footer -->
                                        <div class="modal-footer">
                                            <span id="sub_category_error_area" style="display: none;" class="m-auto"></span>
                                            <button type="button" class="btn btn-secondary"
                                                data-dismiss="modal">Close</button>
                                            <button type="button" id="btnSubmit" onclick="SubCategoryStore()"
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
        <form action="">
                <div class="row ml-5">
                    <div class="col-md-3">
                        <input type="date" id="date_from" name="date_from" class="form-control">
                    </div>
                    <div class="col-md-3">
                        <input type="date" id="date_to" name="date_to" class="form-control">
                    </div>
                    <div class="col-md-3">
                        <select name="cat_name" id="cat_name" class="form-control">
                            <option value="">All Sub Category</option>
                            @foreach($categories as $item)
                            <option value="{{ $item->id }}">{{ $item->category_name }}</option>
                            @endforeach
                        </select>
                    </div>
                    <div class="col-md-3">
                        <button type="button" id="Filter_submit" onclick=" Getdata()" class="btn btn-primary">Filter</button>
                    </div>
                </div>
            </form>
            <div class="table-responsive">
                <table id="DataTable" class="table table-bordered" width="100%" cellspacing="0">
                    <thead>
                        <tr>
                            <th>UID</th>
                            <th>Category</th>
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



<script src="{{url('public/plugins/jquery/jquery.min.js')}}"></script>
<link href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.13/css/select2.min.css" rel="stylesheet">
<script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.13/js/select2.min.js"></script>

<script>
function alertmsg(msg, type) {
    $("#sub_category_error_area").removeClass().html('').show();
    $("#sub_category_error_area").addClass(`alert alert-${type} text-center`).html(msg);
    $("#sub_category_error_area").fadeOut(3000);
}        

$(function() {

    Getdata();


$("#department_supervised_by").select2({
    theme: "classic",
    // width: 'resolve'
});

});
function Getdata()
{

    $("#DataTable").DataTable().destroy();
    var DataTable = $("#DataTable").DataTable({
    "processing": true,
    "serverSide": true,
    ajax: {
        url: "{{route('SubCategoryShow')}}",
        data: {
                    from_date: $('#date_from').val(),
                    to_date: $('#date_to').val(),
                    category_name : $('#cat_name').val()
                },
    },
    columns: [{
            data: 'id',
        },
        {
            data: 'Category',
        },
        {
            data: 'sub_category_name',
        },
        {
            data: 'created_at',
        },
        {
            data: 'action',
        }
    ]

});

$("input[type=date]").val("")
$('#cat_name').prop('selectedIndex',0);
// var $dates = $('#date_from, #date_to').datepicker();
// $dates.datepicker('setDate', null);
// $("#cat_name").val("")


}

function SubCategoryStore() {

$("#btnSubmit").prop("disabled", true);

$.post("{{route('SubCategoryStore')}}", $('#SubCategoryStoreForm').serialize())
        .done((res)=>{
            $("#btnSubmit").prop("disabled", false);
             if(res.success){
                $("#btnSubmit").prop("disabled", true);
                alertmsg(res.message,"success");
                window.location.href = "{{route('SubCategory')}}";
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
function SubCategoryEdit(id)
  {
    $.get("{{route('SubCategoryEdit')}}", {id:id}, function(data)
    {
      $("#sub_cat_id").val(data.data[0]['id']);
      $("#category_id").val(data.data[0]['category_id']);
      $("#sub_category_name").val(data.data[0]['sub_category_name']);
    });
  }
  
  function SubCategoryRemove(id)
  {
    swal({
			title : "Are You Sure?",
			text : "Once Deleted You will not be able to recover this file",
			icon : "warning",
			buttons : true,
			dangerMode : true,

		})
    .then((willDelete) => {
			if(willDelete)
			{
				$.get("{{route('SubCategoryRemove')}}",{id:id},function(data){
				console.log(data);	
					if(data['success'] == true)
					{
						swal("Proof! Sub Category Have been Deleted..!",
						{
							icon: "success",
						});
						tables = $("#DataTable").dataTable();
						tables.fnPageChange('first',1);
					}
				});
			} 
	        else 
	        {
	            swal("Your file is safe!");
	        }
		});
  }

</script>

@endsection