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
                            <div class="h5 mb-0 font-weight-bold text-gray-800">Main Slider</div>
                        </div>
                        <div class="col-auto">
                            <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#SliderStoreModal">Add</button>

                            <div class="modal fade" id="SliderStoreModal">
                                <div class="modal-dialog modal-dialog-centered">
                                    <div class="modal-content">
                                        <!-- Modal Header -->
                                        <div class="modal-header">
                                            <h4 class="modal-title">Add Slider</h4>
                                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                                        </div>
                                        <!-- Modal body -->
                                        <div class="modal-body">
                                            <form id="SliderStoreForm" enctype="multipart/form-data">
                                                @csrf
                                                <input type="hidden" id="slider_id" name="slider_id">
                                                <div class="form-group">
                                                    <lable>Heading</lable>
                                                    <input type="text" class="form-control form-control-user required " id="slider_heading" name="slider_heading" placeholder="Enter Slider Heading">
                                                </div>
                                                <div class="form-group">
                                                    <lable>Caption</lable>
                                                    <input type="text" class="form-control form-control-user required " id="slider_caption" name="slider_caption" placeholder="Enter Slider Caption">
                                                </div>
                                                <div class="form-group">
                                                    <lable>Link</lable>
                                                    <input type="text" class="form-control form-control-user required " id="slider_link" name="slider_link" placeholder="Enter Slider Link">
                                                </div>
                                                <div class="form-group">
                                                    <lable>Slider Background Colour</lable>
                                                    <input type="text" class="form-control form-control-user required " id="slider_bg_color" name="slider_bg_color" placeholder="Enter Slider Background Color">
                                                </div>
                                                <div class="form-group">
                                                    <lable>Slider Position</lable>
                                                    <select name="slider_position" id="slider_position" class="form-control form-control-user">
                                                        <option disabled selected>select</option>
                                                        <option value="1">1</option>
                                                        <option value="2">2</option>
                                                        <option value="3">3</option>
                                                    </select>
                                                </div>
                                                <div class="form-group">
                                                    <lable>Slider Image</lable>
                                                    <input type="file" class="form-control form-control-user required " id="slider_image" name="slider_image" placeholder="Enter Slider Link">
                                                    <img id="image_id" style="width:100px; height: 100px;">
                                                </div>

                                            </form>
                                        </div>
                                        <!-- <div class="form-group text-center">
                                            <span id="show_error" style="display: none;" class="m-auto"></span>
                                        </div> -->
                                        <!-- Modal footer -->
                                        <div class="modal-footer">
                                            <span id="error" style="display: none;" class="m-auto"></span>
                                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                            <button type="button" id="btnSubmit" onclick="SliderStore()" class="btn btn-primary">Submit</button>
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
            <h6 class="m-0 font-weight-bold">Slider List</h6>
        </div>
        <div class="card-body">
            <div class="table-responsive">
                <table id="DataTable" class="table table-bordered" width="100%" cellspacing="0">
                    <thead>
                        <tr>
                            <th>UID</th>
                            <th>Heading</th>
                            <th>Caption</th>
                            <th>Image</th>
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

<style>
    .w-auto>img {
        width: 72px;

    }
</style>
<script>
    function alertmsg(msg, type) {
    $("#slider_error_area").removeClass().html('').show();
    $("#slider_error_area").addClass(`alert alert-${type} text-center`).html(msg);
    $("#slider_error_area").fadeOut(3000);
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
                buttons: ['pageLength'
                ],
        ajax: {
            url: "{{route('EbookShow')}}",
            // data: {
            //   client_id: ""
            // }
        },
    ajax: {
        url: "{{route('SliderShow')}}",
        // data: {
        //   client_id: ""
        // }
    },
    columns: [{
            data: 'id',
            'searchable': false,
            'orderable': false,
            'class': 'text-center'
        },
        {
            data: 'slider_heading',
            'searchable': true,
            'orderable': false,
            'class': 'text-center'
        },
        {
            data: 'slider_caption',
            'searchable': true,
            'orderable': false,
            'class': 'text-center'
        },
        {
            data: 'slider_image',

                render : function(data)
                {
                    return '<img src="{{url("public/Slider")}}/'+data+'" style="width:35px; height:auto;">';
                }
            },
        {
            data: 'Action'
        }
    ]
});
});
function SliderStore() {

    let slider_form_data = document.getElementById("SliderStoreForm");
    let form_data = new FormData(slider_form_data);

$("#btnSubmit").prop("disabled", true);

$.ajax({
        type: "POST",
        url: "{{route('SliderStore')}}",
        data: form_data,
        processData: false,
        contentType: false,
        success : (res)=>
        {
            $("#btnSubmit").prop("disabled", false);
             if(res.success){
                $("#btnSubmit").prop("disabled", true);
                alertmsg(res.message,"success");
                window.location.href = "{{route('Slider')}}";
             }else if(res.validate){
                alertmsg(res.message, "warning")
             }else{
                alertmsg(res.message, "danger")
             }
        },
        error : (err)=>{

            alertmsg("Something went wrong", "danger");
            $("#btnSubmit").prop("disabled", false);
        }

});
}
  function SliderEdit(id)
  {
      $.get("{{route('SliderEdit')}}",{id:id}, function(data){
          $("#slider_id").val(data.data[0]['id']);
          $("#slider_heading").val(data.data[0]['slider_heading']);
          $("#slider_caption").val(data.data[0]['slider_caption']);
          $("#slider_link").val(data.data[0]['slider_link']);
          $("#slider_bg_color").val(data.data[0]['slider_bg_color']);
          $("#slider_position").val(data.data[0]['slider_position']);
          $("#image_id").attr("src", "{{url('public/Slider')}}/"+data.data[0]['slider_image']);

      })
  }
  function SliderRemove(id)
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
				$.get("{{route('SliderRemove')}}",{id:id},function(data){
				console.log(data);
					if(data['success'] == true)
					{
						swal("Proof! Slider Have been Deleted..!",
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
