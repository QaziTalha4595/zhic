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
                            <button type="button"  id="AddBtn" class="btn btn-primary" data-toggle="modal"
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
                            id="category_id" style="width:100%;" onchange = "GetCategory(this)" >
                            <option selected disabled>Select</option>
                           
                            @foreach($Category as $item)
                            <option value="{{ $item->category_id }}">{{ $item->category_name }}</option>
                            @endforeach
                        </select>
                    </div>
                    <div class="form-group" onclick="SelectErr()">
                        <label>Sub Category</label>

                        <select class="form-control select2" name="sub_cat_id"
                            id="sub_cat_id"  style="width:100%;" disabled>
                            <option selected disabled>Select</option>
                       
                        </select>


                    </div>
                    <div class="form-group">
                        <lable class="text-bold">Third Category Name</lable>
                        <input type="text"
                            class="form-control form-control-user border-primary required "
                            id="third_cat_name" name="third_cat_name">
                    </div>
                    <div class="form-group">
                        <lable class="text-bold">Third Category Name in Arabic</lable>
                        <input type="text"
                            class="form-control form-control-user border-primary required "
                            id="third_cat_name_ar" name="third_cat_name_ar">
                    </div>

                </form>
            </div>
            <div class="form-row mx-auto">
                <div class="form-group text-center">
                    <span id="error" style="display: none;"></span>
                </div>
            </div>
            <!-- Modal footer -->

            <div class="modal-footer">
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
        <form action="" class="mb-3">
                <div class="row">
                    <div class="col-md-2 col-6 mt-2">
                        <input type="date" id="date_from" name="date_from" class="form-control">
                    </div>
                    <div class="col-md-2 col-6 mt-2">
                        <input type="date" id="date_to" name="date_to" class="form-control">
                    </div>
                    <div class="col-md-3 col-6 mt-2">
                        <select name="category_id_filter" id="category_id_filter" onchange = "GetCategory(this, '_filter')" class="form-control">
                            <option value="">All Category</option>
                            @foreach($Category as $item)
                            <option  value="{{ $item->category_id }}">{{ $item->category_name }}</option>
                            @endforeach
                        </select>
                    </div>
                    <div class="col-md-3 col-6 mt-2">
                        <select name="sub_cat_id_filter" id="sub_cat_id_filter" disabled class="form-control">
                            <option value="">Sub Category</option>
                        </select>
                    </div>
                    <div class="col-md-2 col-12 mt-2">
                        <div class="row" style="display: inline;">

                            <button type="button"  onclick=" Getdata()" class="btn btn-primary mx-1 mb-2" style="width: 48%;">Filter</button>
                            <button type="button" title="Refresh Select Box" class="btn btn-secondary mx-1 mb-2" style="width: 48%;" id="resetBtn" onclick="ResetData()">Reset</button>
                        </div>
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


{{-- <script src="{{url('public/plugins/jquery/jquery.min.js')}}"></script>
<link href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.13/css/select2.min.css" rel="stylesheet">
<script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.13/js/select2.min.js"></script> --}}

<script>

$(function() {
    Getdata();
});


function GetCategory (e, id="") {
return new Promise((resolve, reject) => {
    var select = $(`#sub_cat_id`+id);
    select.html(' <option value="" selected>Select SubCategory</option>');
    select.attr("disabled", false);
    $.get('{{route("FetchSubCategory")}}', {category_id: e.value}, function(res){
        $.each(res.data,function(i, val){
            select.append('<option value="'+val.sub_cat_id+'">'+val.sub_cat_name+'</option>')
        });
        resolve();
    })
})
    
}


function SelectErr(){
    if($("#sub_cat_id").prop("disabled")){
        alertmsg("Please Select the Category first", "danger")
    }
}

function ResetData(){
    $('#date_from').val(''),
    $('#date_to').val(''),
    $('#category_id_filter').val(''),
    $('#sub_cat_id_filter').val('').prop('disabled',true);
}

$("#AddBtn").click(()=>{
    $('#ThirdCategoryStoreForm')[0].reset();
    $('#third_cat_id').val('');
    $("#btnSubmit").prop("disabled", false);
    $("#error").removeClass().html('').hide();
    $("#sub_cat_id").attr("disabled", true)
});

function Getdata(){
    $("#DataTable").DataTable().destroy();
    var DataTable = $("#DataTable").DataTable({
    "processing": true,
    "serverSide": true,
    order: [[0, 'desc']],
    dom: '<"top"<"left-col"B><"right-col"f>>r<"table table-striped"t>ip',
    lengthMenu: [
        [10, 25, 50, -1],
        ['10 rows', '25 rows', '50 rows', 'Show all']
    ],
    "responsive": true,
    buttons: ['pageLength'],
    ajax: {
        url: "{{route('ThirdCategoryShow')}}",
        data: {
                from_date: $('#date_from').val(),
                to_date: $('#date_to').val(),
                category_id : $('#category_id_filter').val(),
                sub_cat_id : $('#sub_cat_id_filter').val()
        },
    },
    columns: [
        {data: 'third_cat_id',},
        {data: 'category_name',},
        {data: 'sub_cat_name',},
        {data: 'third_cat_name',},
        {data: 'created_at',},
        {data: 'action',}
    ]
});

}

function ThirdCategoryStore() {
    $("#sub_cat_id").prop("disabled", false);
    $("#btnSubmit").prop("disabled", true);
    $.post("{{route('ThirdCategoryStore')}}", $('#ThirdCategoryStoreForm').serialize(), (res)=>{
        if(res.success){
                 $("#btnSubmit").prop("disabled", false);
                alertmsg(res.message,"success");
                Getdata();
                $("#ThirdCategoryStoreModal").modal('hide');
                $('#ThirdCategoryStoreForm')[0].reset();
             }else if(res.validate){
                 alertmsg(res.message, "warning")
             }else{
                 alertmsg(res.message, "danger")
                }
    })

}
function ThirdCategoryEdit(third_cat_id)
  {
    $('#ThirdCategoryStoreModal').modal('show')
    $("#sub_cat_id").prop("disabled", true);
      $.get("{{route('ThirdCategoryEdit')}}", {third_cat_id:third_cat_id}, function(data)
      {
        var d = data.data[0];
          $("#third_cat_id").val(d['third_cat_id']);
          $("#category_id").val(d['category_id']);
          GetCategory ({value: d['category_id']}).then(()=>{
            $("#sub_cat_id").val(d['sub_cat_id']);
          })
          $("#third_cat_name").val(d['third_cat_name']);
          $("#third_cat_name_ar").val(d['third_cat_name_ar']);
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
                    if (willDelete) {
                        $.get("{{ route('ThirdCategoryRemove') }}", {
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
