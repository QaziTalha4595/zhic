@extends('Admin.AdminLayout')
@section('content')
<script src="{{url('public/plugins/jquery/jquery.min.js')}}"></script>
<link href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.13/css/select2.min.css" rel="stylesheet">
<script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.13/js/select2.min.js"></script>


<!-- Form Wizard -->
@if(empty($file_id))
<ul class="nav nav-pills mb-3" id="pills-tab" role="tablist" style="justify-content: center;">
    <li class="nav-item" role="presentation">
        <a class="nav-link" id="pills-home-tab" data-toggle="pill" href="#Tab_1" role="tab" aria-controls="Tab_1"
            aria-selected="true">Basic Information</a>
    </li>
    <li class="nav-item" role="presentation">
        <a class="nav-link active" id="pills-profile-tab" data-toggle="pill" href="#Tab_2" role="tab"
            aria-controls="Tab_2" aria-selected="false">Book Cover</a>
    </li>
    <li class="nav-item" role="presentation">
        <a class="nav-link" id="pills-contact-tab" data-toggle="pill" href="#Tab_3" role="tab" aria-controls="Tab_3"
            aria-selected="false">Book Uploade</a>
    </li>
</ul>
@else
<ul class="nav nav-pills mb-3" id="pills-tab" role="tablist" style="justify-content: center;">
    <li class="nav-item" role="presentation">
        <a class="nav-link" href="Ebook-{{$file_id}}-Basic" aria-selected="true">Basic Information</a>
    </li>
    <li class="nav-item" role="presentation">
        <a class="nav-link active" href="Ebook-{{$file_id}}-CoverImage">Book Cover</a>
    </li>
    <li class="nav-item" role="presentation">
        <a class="nav-link" href="Ebook-{{$file_id}}-Upload">Book Uploade</a>
    </li>
</ul>
@endif
<div class="tab-content" id="pills-tabContent">
    <div class="tab-pane fade" id="Tab_1" role="tabpanel" aria-labelledby="pills-home-tab"></div>
    <div class="tab-pane fade show active" id="Tab_2" role="tabpanel" aria-labelledby="pills-profile-tab">
        <div class="col-lg-8 mx-auto">
            <div class="card">
                <div class="card-header">
                    <h1 class="card-title" style="font-size: 31px;">E-Book Cover Image</h1>
                </div>
                <div class="card-body">
                    <form id="FileStoreForm">
                        <div class="row">
                            <div class="col-lg-10">
                                <input type="hidden" name="_token" value="{{ csrf_token() }}" />
                                <input type="hidden" name="file_id" id="file_id" value="{{$file_id}}">
                                <input type="hidden" name="ebook_attachment_id" id="ebook_attachment_id" value="{{$file_id}}">
                                <div class="row">
                                    <div class="col-lg-4">
                                        <div class="form-group" id="fieldRow">
                                            <lable class="text-bold">Book Cover Image</lable>
                                            <input type="file" class="form-control form-control-user required"
                                                id="file_thumbnail" name="file_thumbnail" placeholder=""
                                                accept="image/*">
                                        </div>
                                    </div>
                                    <div class="col-lg-4">
                                        <div class="form-group" id="fieldRow">
                                            <lable class="text-bold">Book Cover Position</lable> <br>
                                            <select class="form-control select2 border-primary" name="ebook_position"
                                                id="ebook_position" style="width:100%;">
                                                <option selected value="1">1</option>
                                                <option value="2">2</option>
                                                <option value="3">3</option>
                                                <option value="4">4</option>
                                                <option value="5">5</option>
                                                <option value="6">6</option>
                                                <option value="7">7</option>
                                                <option value="8">8</option>
                                                <option value="9">9</option>
                                                <option value="10">10</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-lg-4">
                                        <div id="cp2" class="input-group colorpicker colorpicker-component mt-3">
                                            <input type="text" name="ebook_bg_color" id="ebook_bg_color" value="#ffffff"
                                                class="form-control" />
                                            <!-- <span class="input-group-addon"><i></i></span> -->
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-2">
                                <button type="button" id="btnSubmit" class="btn btn-primary mt-4"
                                    onclick="EbookBasicStore()">Add Book</button>
                            </div>

                            <!-- Image preview -->
                            @if(count($files) > 0)
                            @foreach( $files as $file)
                            <div class="col-lg-3 col-md-4 col-sm-6">
                                <table id="DataTable">
                                    <div class="Img-prev text-center">
                                        <button type="button" class="btn btn-danger btn-sm btn-rad" id="Img-remover"
                                        onclick="ImgCoverRemove($file=>ebook__cover_id)"><i
                                                class="fa fa-trash"></i></button>
                                        <img src=""
                                            alt="" class="img-fluid">
                                    </div>
                                </table>
                            </div>
                            @endforeach
                            @endif

                        </div>
                    </form>
                </div>
                <div class="error mx-3 text-center">
                    <div id="Cover_image_error_area"></div>
                </div>
                <div class="card-footer text-center">
                    <a href="Ebook-{{$file_id}}-Upload" class="btn btn-primary">Submit &
                        Next</a>
                    @if(!empty($file_id))
                    <a href="Ebook-{{$file_id}}-Upload" class="btn btn-warning">Skip
                        &
                        Next</a>
                    @endif
                </div>
            </div>
        </div>
    </div>
    <div class="tab-pane fade" id="Tab_3" role="tabpanel" aria-labelledby="pills-contact-tab">
    </div>
</div>
<!-- Form Wizard -->
<style>
#Img-remover {
    position: relative;
    right: 60px;
    top: 15px;
}

.btn-rad {
    border-radius: 50%;
}
#cp2{
    margin-top: 20px !important;
}
.colorpicker:after{
    content: '';
    display: inline-block;
    border-left: 7px solid transparent;
    border-right: 7px solid transparent;
    border-bottom: 7px solid #ccc;
    border-bottom-color: rgba(0,0,0,.2);
    position: absolute;
    top: -7px;
    left: 6px;
}

.input-group-addon i {
    width: 36px !important;
    height: 36px !important;
    margin-top: -1px;
}
</style>
<!-- Main Script -->
<script>
    function alertmsg(msg, type) {
    $("#Cover_image_error_area").removeClass().html('').show();
    $("#Cover_image_error_area").addClass(`alert alert-${type} text-center`).html(msg);
    $("#Cover_image_error_area").fadeOut(3000);
    }
function EbookBasicStore() {

let form_data = document.getElementById("FileStoreForm");
let new_data = new FormData(form_data);
$("#btnSubmit").prop("disabled", true);

$.ajax({
    type: "POST",
    url: "{{route('EbookCoverStore')}}",
    data: new_data,
    processData: false,
    contentType: false,
    success : (res)=>
    {
        $("#btnSubmit").prop("disabled", false);
         if(res.success){
            $("#btnSubmit").prop("disabled", true);
            alertmsg(res.message,"success");
            setTimeout(() => {
                $("#FileStoreForm")[0].reset();
                location.reload();
            }, 1000);
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
function ImgCoverRemove(ebook__cover_id) {
    swal({
        title: "Are you sure?",
        text: "Once deleted, you will not be able to recover this file!",
        icon: "warning",
        buttons: true,
        dangerMode: true,
    }).then((willDelete) => {
        if (willDelete) {
            $.get("{{route('EbookCoverImageRemove')}}", {
                ebook__cover_id: ebook__cover_id
            }, function(data) {
                console.log(data);
                // return false;
                if (data['success'] == true) {
                    swal("Poof! Ebook Cover Image has been deleted!", {
                        icon: "success",
                    });
                } else {
                    swal("Oops something went wrong, please check!", {
                        icon: "error",
                    });
                }
                setTimeout(() => {
                    location.reload();
                }, 700);
            });
        } else {
            swal("Your file is safe!");
        }
    });
}

</script>
@endsection