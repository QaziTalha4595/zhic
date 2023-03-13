@extends('Admin.AdminLayout')
@section('content')
<script src="{{url('public/plugins/jquery/jquery.min.js')}}"></script>
<link href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.13/css/select2.min.css" rel="stylesheet">
<script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.13/js/select2.min.js"></script>


<!-- Form Wizard -->

@if(empty($file_id))

<ul class="nav nav-pills mb-3" id="pills-tab" role="tablist" style="justify-content: center;">
    <li class="nav-item" role="presentation">
        <a class="nav-link active" id="pills-home-tab" data-toggle="pill" href="#Tab_1" role="tab" aria-controls="Tab_1"
            aria-selected="true">Basic Information</a>
    </li>
    <li class="nav-item" role="presentation">
        <a class="nav-link" onclick="EmptyAlert()">Book Cover</a>
    </li>
    <li class="nav-item" role="presentation">
        <a class="nav-link" onclick="EmptyAlert()">Book Uploade</a>
    </li>
</ul>
@else

<ul class="nav nav-pills mb-3" id="pills-tab" role="tablist" style="justify-content: center;">
    <li class="nav-item" role="presentation">
        <a class="nav-link active" href="Ebook-{{$file_id}}-Basic" aria-selected="true">Basic Information</a>
    </li>
    <li class="nav-item" role="presentation">
        <a class="nav-link" href="{{ url('ControlPanel/Ebook-'.$file_id.'-CoverImage') }}">Book Cover</a>
    </li>
    <li class="nav-item" role="presentation">
        <a class="nav-link" href="{{url('ControlPanel/Ebook-'.$file_id.'-Upload')}}">Book Uploade</a>
    </li>
</ul>
@endif
<div class="tab-content" id="pills-tabContent">
    <div class="tab-pane fade show active" id="Tab_1" role="tabpanel" aria-labelledby="pills-home-tab">
        <!-- main form -->
        <div class="col-lg-8 mx-auto">
            <div class="card">
                <div class="card-header">
                    <h3>E-Book Basic Information</h3>
                </div>
                <div class="card-body">
                    <form id="EbookStoreForm" enctype="multipart/form-data">
                    @csrf

                        <input type="show" id="file_id" name="file_id" value="{{$data->file_id ?? ''}}">
                        <div class="form-group">
                            <label>Category</label>
                            <select class="form-control select2" name="category_id" id="category_id"
                                style="width:100%;">
                                <!-- <option selected disabled>Select</option> -->
                                @if(empty($file_id))
                                <option selected disabled>Select Category</option>
                                @else
                                <option value="{{$data->category->id ?? ''}}">{{ $data->category->category_name ?? 'Select'}}</option>
                                @endif
                                @if(!empty($Ebook))
                                @foreach($Category as $item)
                                @if($Ebook[0]->category_id == $item->category_id)
                                <option selected value="{{$item->category_id ?? ''}}">
                                    {{$item->category_name ?? ''}}</option>
                                @else
                                <option value="{{$item->category_id ?? ''}}">
                                    {{$item->category_name ?? ''}}</option>
                                @endif
                                @endforeach
                                @else
                                @foreach($Category as $item)
                                <option value="{{ $item->id }}"> {{  $item->category_name  }} </option>
                                @endforeach
                                @endif
                            </select>
                        </div>
                        <div class="form-group">
                            <label>Sub Category</label>
                            <select class="form-control select2" name="sub_category_id" id="sub_category_id" style="width:100%;">
                                <!-- <option selected disabled>Select</option> -->
                                <option selected disabled value="{{$data->subcategory->id ?? ''}}">{{ $data->subcategory->sub_category_name ?? 'Select'}}</option>
                                
                            </select>
                        </div>
                        <div class="form-group">
                            <label>Third Category</label>
                            <select class="form-control select2" name="third_category_id" id="third_category_id" style="width:100%;">
                            <!-- <option selected disabled>Select</option> -->
                        <option selected disabled value="{{$data->thirdcategory->id ?? ''}}">{{ $data->thirdcategory->third_category_name ?? 'Select'}}</option>
                                   
                        </select>
                        </div>
                        <div class="form-group">
                            <lable class="text-bold">Book Languages</lable>
                            <select class="form-control select2" name="language_id" id="language_id" style="width:100%;">
                                
                                <!-- <option selected disabled>Select Language</option> -->
                                <option selected disabled value="{{$data->language->id ?? ''}}">{{ $data->language->language ?? 'Select'}}</option>
                                
                                  @foreach($Languages as $Language)
                                    <option value="{{$Language->id ?? ''}}">{{ $Language->language ?? ''}}</option>
                                  @endforeach
                            </select>
                        </div>
                        <div class="form-group">
                            <lable class="text-bold">Book Title</lable>
                            <input type="text" class="form-control form-control-user required "
                                id="ebook_name" name="ebook_name" placeholder="Enter Book Title"
                                value="{{ $data->ebook_name ?? '' }}">
                        </div>
                        <div class="form-group">
                            <lable class="text-bold">Book Publisher</lable>
                            <input type="text" class="form-control form-control-user"
                                id="ebook_publisher" name="ebook_publisher" placeholder=" Book Publisher" 
                                value="{{ $data->ebook_publisher ?? '' }}">
                        </div>
                        <div class="form-group">
                            <lable class="text-bold">Publishing Date</lable>
                            <input type="date" class="form-control form-control-user"
                                id="publishing_date" name="publishing_date" placeholder=" Book Publishing Date"
                                value="{{ $data->publishing_date ?? '' }}">
                        </div>
                        <div class="form-group">
                            <lable class="text-bold">Book ISBN</lable>
                            <input type="text" class="form-control form-control-user" id="ebook_isbn"
                                name="ebook_isbn" placeholder=" Book ISBN" value="{{ $data->ebook_isbn ?? '' }}">
                        </div>
                        <div class="form-group">
                            <lable class="text-bold">Book Author</lable>
                            <input type="text" class="form-control form-control-user" id="ebook_author"
                                name="ebook_author" placeholder="Enter Book Author"
                                value="{{ $data->ebook_author ?? '' }}">
                        </div>
                        <div class="form-group">
                            <lable class="text-bold">Direction</lable>
                            <select class="form-control select2" name="direction" id="direction"
                                style="width:100%;">
                                <option selected disabled>Select</option>
                               
                                <option selected value="rtl">Right To Left</option>
                                <option value="ltr">Left To Right</option>
                          
                                <option value="rtl">Right To Left</option>
                                <option selected value="ltr">Left To Right</option>

                                <option value="rtl">Right To Left</option>
                                <option value="ltr" selected>Left To Right</option>
                              
                            </select>
                        </div>
                        <div class="form-group">
                            <lable class="text-bold">Book Short Notes</lable>
                            <textarea class="form-control" id="ebook_note" name="ebook_note"
                                placeholder="Enter Book Short Notes" >{{ $data->ebook_note ?? '' }}</textarea>
                        </div>
                        <div class="form-group">
                            <lable class="text-bold">Book Slug</lable>
                            <input type="text" class="form-control form-control-user required" id="slug"
                                name="slug" placeholder="Enter Book Slug" value="{{ $data->ebook_slug ?? '' }}">
                        </div>
                        <div class="row">
                            <div class="col-lg-3 col-md-6 col-sm-6">
                                <div class="form-group">
                                    <lable class="text-bold">Downlodabel</lable>
                                    <input type="checkbox" id="downloadable" name="downloadable" value="1" >
                                 
                                </div>
                            </div>
                            <div class="col-lg-3 col-md-6 col-sm-6">
                                <div class="form-group">
                                    <lable class="text-bold">Printabel</lable>
                                    <input type="checkbox" id="printable" name="printable" value="{{ $data->publishing_date ?? '' }}">
                                </div>
                            </div>
                            <div class="col-lg-3 col-md-6 col-sm-6">
                                <div class="form-group">
                                    <lable class="text-bold">Most Searchable</lable>
                                    <input type="checkbox" id="searchable" name="searchable" value="1" >
                                </div>
                            </div>
                            <div class="col-lg-3 col-md-6 col-sm-6">
                                <div class="form-group">
                                    <lable class="text-bold">Featured</lable>
                                    <input type="checkbox" id="featured" name="featured" value="1" >
                                </div>
                            </div>
                        </div>
                    </form>
                    <div>
                    <div class="text-center m-2">
                    <span id="Ebook_error_area" style="display: none;" class="m-auto"></span>
                    </div>
                </div>
                <!-- <div class="error mx-3 text-center">
                    <div id="Ebook_error_area"></div>
                </div> -->
                <div class="card-footer text-center">

                    <button type="button" id="btnSubmit" onclick="EbookBasicStore()"
                        class="btn btn-primary">Save Next</button>
                </div>
            </div>
        </div>
        <!-- main form -->
    </div>
</div>
<!-- Form Wizard -->
<!-- Main Script -->
<script>
    function alertmsg(msg, type) {
    $("#Ebook_error_area").removeClass().html('').show();
    $("#Ebook_error_area").addClass(`alert alert-${type} text-center`).html(msg);
    $("#Ebook_error_area").fadeOut(3000);
}     
$(function(){


        $("#category_id").change(function(event){
         var idCategory = this.value;
        $("#sub_category_id").html(' <option value="" selected disabled>Select SubCategory</option> ');
        $("#sub_category_id").attr("disabled", false);
        $("#third_category_id").html('');    
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

        $("#sub_category_id").change(function(event){

        var idThirdCat = this.value;
        $("#third_category_id").html('<option value="" selected disabled    >Select Third Category</option> ');
        $("#third_category_id").attr("disabled", false)
        $.ajax({

        type : "GET",
        url : "{{route('FetchThirdCategory')}}",
        data : {third_cat_id: idThirdCat},
        success : function(response)
        {
           $.each(response.data.third_categories,function(index, val){
            console.log(val);
            $("#third_category_id").append('<option value="'+val.id+'">'+val.third_category_name+'</option>');
            });
        }

        });
    });

});
function EbookBasicStore() {

$("#btnSubmit").prop("disabled", true);

    let form_data = document.getElementById("EbookStoreForm");
    let language_id = $("#language_id option:selected").text();
    let new_data = new FormData(form_data);

    new_data.append("language", language_id);

    $("#btnSubmit").prop("disabled", true);

    $.ajax({
        type: "POST",
        url: "{{route('EbookStore')}}",
        data: new_data,
        processData: false,
        contentType: false,
        error: function(jqXHR, textStatus, errorThrown) {
            $("#btnSubmit").prop("disabled", false);
            $("#Ebook_error_area").removeClass().html('').show();
            $("#Ebook_error_area").addClass("alert alert-danger").html(errorThrown);
            return false;
        },
        success : function(data)
        {
            $("#btnSubmit").prop("disabled", false);
            if (data["success"] == true) {
                $("#Ebook_error_area").removeClass().html('').show();
                $("#Ebook_error_area").addClass("alert alert-success").html(data['message']);
                setTimeout(() => {
                    $("#FileStoreModal").modal('hide');
                    $("#Ebook_error_area").removeClass().html('').hide();
                    DataTable = $("#DataTable").dataTable();
                    DataTable.fnPageChange('first', 1);
                    next_url = 'Ebook-' + data['file_id'] + '-CoverImage';
                    if ($("#file_id").val() == "" || $("#file_id").val() == null) {
                        window.location.href = next_url;
                    }
                    else
                    {
                        window.location.href = next_url;
                    }
                    console.log(data);
                    return false;
                }, 2000);
            } 
             else {
                $("#Ebook_error_area").removeClass().html('').show();
                $("#Ebook_error_area").addClass("alert alert-danger").html(data['message']);
                return false;
            }
        }
    });
}
function EmptyAlert() {
    swal({
        title: "Please fill the form and press Save & Next",
        text: "",
        icon: "warning",
        buttons: true,
        dangerMode: true,
    });
    return false;
}
</script>
@endsection