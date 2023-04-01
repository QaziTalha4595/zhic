@extends('Admin.AdminLayout')

@section('content')

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/croppie/2.6.5/croppie.css"/>
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
                                                <input type="hidden" id="promo_id" name="promo_id">
                                                <div class="form-row justify-content-center mt-3">
                                                    <div class="form-group col-md-4 mt-3">
                                                        <div id="image-preview" class="mt-3"></div>
                                                    </div>
                                                </div>
                                                <div class="form-group row justify-content-center">
                                                    <input type="file" id="promotion_attachment" name="promotion_attachment"
                                                        placeholder="Enter promotion Image">
                                                        <img id="image_id" style="width:100px; height: 100px; display:none">

                                                </div>
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
                                                        @foreach($SubCategories as $SubCategory)
                                                        <option value="{{ $SubCategory->id }}">{{ $SubCategory->sub_category_name }}</option>
                                                        @endforeach
                                                    </select>
                                                </div>


                                            </form>
                                        </div>
                                        <!-- Modal footer -->
                                        <div class="modal-footer">
                                            <span id="error" style="display: none;" class="m-auto"></span>
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



<style>
.w-25>img {
    width: 50px;
}
</style>
<script src="https://cdnjs.cloudflare.com/ajax/libs/croppie/2.6.5/croppie.min.js"></script>
<script>

function alertmsg(msg, type) {
    $("#promotion_error_area").removeClass().html('').show();
    $("#promotion_error_area").addClass(`alert alert-${type} text-center`).html(msg);
    $("#promotion_error_area").fadeOut(3000);
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
                buttons: [
                    'pageLength'
                ],
        ajax: {
            url: "{{route('EbookShow')}}",
            // data: {
            //   client_id: ""
            // }
        },
    ajax: {
        url: "{{route('PromotionShow')}}",
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
            data: 'promotion_attachment',
            render : function(data)
                {
                    return '<img src="{{url("public/Promotion")}}/'+data+'" style="width:35px; height:auto;">';
                }
        },
        {
            data: 'action',
        }
    ]
});
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
        $image_crop = $('#image-preview').croppie({
        enableExif:true,
        viewport:{
        width:100,
        height:100,
        type:'circle'
        },
        boundary:{
        width:200,
        height:200
        }
    });

    $('#promotion_attachment').change(function(event){
        var reader = new FileReader();

        reader.onload = function(event){
        $image_crop.croppie('bind', {
            url:event.target.result
        }).then(function(){
            console.log('jQuery bind complete');
        });
        }
        reader.readAsDataURL(this.files[0]);
    });
});

function PromotionStore() {


//     $("#promotion_attachment").ijaboCropTool({

// //  preview : '.image-previewer',
// //   setRatio:1,
// //   allowedExtensions: ['jpg', 'jpeg','png'],
// //   buttonsText:['CROP','QUIT'],
// //   buttonsColor:['#30bf7d','#ee5155', -15],
//     processUrl:'{{ route("PromotionStore") }}',
//     onSuccess:function(message, element, status){
//         alert(message);
//     },
//     onError:function(message, element, status){
//         alert(message);
//     }

//     });

    $image_crop.croppie('result', {
      type:'canvas',
      size:'viewport'
      }).then(function(response){

      var _token = $('input[name=_token]').val();
      let slider_form_data = document.getElementById("PromotionStoreForm");
      let form_data = new FormData(slider_form_data);
      form_data.append('image',response);

$("#btnSubmit").prop("disabled", true);

$.ajax({
    type: "POST",
    url: "{{route('PromotionStore')}}",
    data: form_data,
    processData: false,
    contentType: false,
    success : (res)=>
    {
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
    },
    error : (err)=>{

        alertmsg("Something went wrong", "danger");
        $("#btnSubmit").prop("disabled", false);
    }
});
});
}

function PromotionEdit(id)
{
    $.get("{{route('PromotionEdit')}}",{id:id}, function(data){

      $("#promo_id").val(data.data[0]['id']);
      $("#category_id").val(data.data[0]['category_id']);
      $("#sub_cat_id").val(data.data[0]['sub_cat_id']);
      $("#image_id").attr("src", "{{url('public/Promotion')}}/"+data.data[0]['promotion_attachment']);
    });
}
function PromotionRemove(id)
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
				$.get("{{route('PromotionRemove')}}",{id:id},function(data){
				console.log(data);
					if(data['success'] == true)
					{
						swal("Proof! promotion Have been Deleted..!",
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
