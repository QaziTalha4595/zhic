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
                                data-target="#LanguageStoreModal">Add</button>

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
                                                    <input type="text" id="lang_id" name="lang_id">
                                                    <label>Language</label>
                                                    <input type="text"
                                                        class="form-control form-control-user required "
                                                        id="language" name="language" placeholder="Enter Language">
                                                </div>

                                            </form>
                                        </div>
                                        <!-- Modal footer -->
                                        <div class="modal-footer">
                                            <span id="language_error_area" style="display: none;" class="m-auto"></span>
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

<script src="{{url('public/plugins/jquery/jquery.min.js')}}"></script>
<link href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.13/css/select2.min.css" rel="stylesheet">
<script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.13/js/select2.min.js"></script>

<script>
    function alertmsg(msg, type) {
    $("#language_error_area").removeClass().html('').show();
    $("#language_error_area").addClass(`alert alert-${type} text-center`).html(msg);
    $("#language_error_area").fadeOut(3000);
}        

$(function() {

var DataTable = $("#DataTable").DataTable({
    "processing": true,
    "serverSide": true,
    ajax: {
        url: "{{route('LanguageShow')}}",
        // data: {
        //   client_id: ""
        // }
    },
    columns: [{
            data: 'id',
        },
        {
            data: 'language',
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

function LanguageStore() {

$("#btnSubmit").prop("disabled", true);

$.post("{{route('LanguageStore')}}", $('#LanguageStoreForm').serialize())
        .done((res)=>{
            $("#btnSubmit").prop("disabled", false);
             if(res.success){
                alertmsg(res.message,"success");
                window.location.href = "{{route('Language')}}";
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

function LanguageEdit(id)
  {
    $.get("{{route('LanguageEdit')}}", {id:id}, function(data)
    {
      $("#lang_id").val(data.data[0]['id']);
      $("#language").val(data.data[0]['language']);
    });
  }

  function LanguageRemove(id)
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
				$.get("{{route('LanguageRemove')}}",{id:id},function(data){
				console.log(data);	
					if(data['success'] == true)
					{
						swal("Proof! Language Have been Deleted..!",
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