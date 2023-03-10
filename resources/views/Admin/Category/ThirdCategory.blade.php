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
                            <button type="button" id="add_btn" class="btn btn-primary" data-toggle="modal"
                                data-target="#ThirdCategoryStoreModal">Add</button>   
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
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
                    <input type="hidden" id="third_cat_id" name="third_cat_id" val="">
                    <div class="form-group">
                        <label>Category</label>
                        <select class="form-control select2" name="category_id"
                            id="category_id" style="width:100%;">
                            <option selected disabled>Select</option>
                            @foreach($Category as $item)
                            <option value="{{ $item->id }}">{{ $item->category_name }}</option>
                            @endforeach
                        </select>
                    </div>
                    <div class="form-group">
                        <label>Sub Category</label>
                        
                        <select class="form-control select2" name="sub_category_id"
                            id="sub_category_id" style="width:100%;">
                            <option selected disabled>Select</option>
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

<div class="container-fluid">
    <div class="card shadow mb-4">
        <div class="card-body">
        <form action="">
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
                            @foreach($Category as $item)
                            <option value="{{ $item->id }}">{{ $item->category_name }}</option>
                            @endforeach
                        </select>
                    </div>
                    <div class="col-md-3">
                        <select name="sub_category_id_filter" id="sub_category_id_filter" class="form-control">
                            <option value="">Sub Category</option>
                        </select>
                    </div>
                    <div class="col-md-2">
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
                            <th>Sub Category</th>
                            <th>Third Category</th>
                            <th>Date </th>
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

Getdata();
   
//Data Table Ends HEre
//For Modal
        $("#category_id").change(function(event){

            

        var idCategory = this.value;
        $("#sub_category_id").html(' <option value="" selected>Select SubCategory</option> ');
        $("#sub_category_id").attr("disabled", false)

        $.ajax({

        type : "GET",
        url : "{{route('FetchSubCategory')}}",
        dataType : 'json',
        data : {cat_id: idCategory},
        success : function(response)
        {
            $.each(response.data.sub_categories,function(index, val){
                console.log(val);
            $("#sub_category_id").append('<option value="'+val.id+'">'+val.sub_category_name+'</option>')
            });
        }

        });

        });
//for Filters
        $("#category_id_filter").change(function(event){

                    

        var idCategory = this.value;
        $("#sub_category_id_filter").html(' <option value="" selected>Select SubCategory</option> ');
        $("#sub_category_id_filter").attr("disabled", false)

        $.ajax({

        type : "GET",
        url : "{{route('FetchSubCategory')}}",
        dataType : 'json',
        data : {cat_id: idCategory},
        success : function(response)
        {
            $.each(response.data.sub_categories,function(index, val){
                console.log(val);
            $("#sub_category_id_filter").append('<option value="'+val.id+'">'+val.sub_category_name+'</option>')
            });
        }

        });

        });        
});
function Getdata(){
    $("#DataTable").DataTable().destroy();
    var DataTable = $("#DataTable").DataTable({

    "processing": true,
    "serverSide": true,
    ajax: {
        url: "{{route('ThirdCategoryShow')}}",
        data: {
                    from_date: $('#date_from').val(),
                    to_date: $('#date_to').val(),
                    category_name : $('#category_id_filter').val(),
                    sub_category_name : $('#sub_category_id_filter').val()
                },
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
            data: 'created_at',
        },
        {
            data: 'action',
        }
    ]
});
$("input[type=date]").val("")
$('#category_id_filter').prop('selectedIndex',0);
$('#sub_category_id_filter').prop('selectedIndex',0);
}

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

  function ThirdCategoryRemove(id)
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
				$.get("{{route('ThirdCategoryRemove')}}",{id:id},function(data){
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
