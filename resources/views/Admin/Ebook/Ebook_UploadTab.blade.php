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
        <a class="nav-link" id="pills-profile-tab" data-toggle="pill" href="#Tab_2" role="tab" aria-controls="Tab_2"
            aria-selected="false">Book Cover</a>
    </li>
    <li class="nav-item" role="presentation">
        <a class="nav-link active" id="pills-contact-tab" data-toggle="pill" href="#Tab_3" role="tab"
            aria-controls="Tab_3" aria-selected="false">Book Uploade</a>
    </li>
</ul>
@else
<ul class="nav nav-pills mb-3" id="pills-tab" role="tablist" style="justify-content: center;">
    <li class="nav-item" role="presentation">
        <a class="nav-link" href="{{ url('ControlPanel/Ebook-'.$file_id.'-Basic') }}" aria-selected="true">Basic Information</a>
    </li>
    <li class="nav-item" role="presentation">
        <a class="nav-link" href="Ebook-{{$file_id}}-CoverImage">Book Cover</a>
    </li>
    <li class="nav-item" role="presentation">
        <a class="nav-link active" href="Ebook-{{$file_id}}-Upload">Book Uploade</a>
    </li>
</ul>
@endif
<div class="tab-content" id="pills-tabContent">
    <div class="tab-pane fade " id="Tab_1" role="tabpanel" aria-labelledby="pills-home-tab">
    </div>
    <div class="tab-pane fade" id="Tab_2" role="tabpanel" aria-labelledby="pills-profile-tab">
    </div>
    <div class="tab-pane fade show active" id="Tab_3" role="tabpanel" aria-labelledby="pills-contact-tab">
        <div class="col-lg-8 mx-auto">
            <div class="card">
                <div class="card-header">
                    <h3>E-Book Upload</h3>
                </div>
                <div class="card-body">
                    <form id="FileStoreForm">
                        <input type="hidden" name="_token" value="{{ csrf_token() }}" />
                        <input type="show" name="file_id" value="{{ $file_id }}" />
                        <div class="row">
                            <div class="col">
                                <div class="form-group">
                                    <lable class="text-bold">Book</lable>
                                    <input type="file" class="form-control form-control-user border-primary"
                                        id="ebook_attachment" name="ebook_attachment" placeholder="" accept=".pdf">
                                        {{$data->ebook_attachment ?? ''}}
                                </div>
                            </div>
                            <div class="col">
                                <div class="form-group">
                                    <lable class="text-bold">Book Link</lable>
                                    <input type="Text" class="form-control form-control-user border-primary"
                                        id="ebook_link" name="ebook_link" placeholder="Enter link here.."
                                        value="{{$data->ebook_link}}">
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            @if($data->printable == 1 || $data->downloadable == 1)
                            <div class="col">
                                <div class="form-group">
                                    <lable class="text-bold">Printable Or Download Book</lable>
                                    <input type="file" class="form-control form-control-user border-primary"
                                        id="printable" name="printable" placeholder="" accept=".pdf">
                                </div>
                            </div>
                            <div class="col">
                                <div class="form-group">
                                    <lable class="text-bold">Printable Or Download Link</lable>
                                    <input type="Text" class="form-control form-control-user border-primary"
                                        id="ebook_download_link" name="ebook_download_link"
                                        value="{{$data->ebook_download_link ?? ''}}" placeholder="Enter link here..">
                                </div>
                            </div>
                            @endif
                        </div>
                        <div class="form-group">
                            <lable class="text-bold">Book Audio</lable>
                            <input type="file" class="form-control form-control-user border-primary"
                                id="ebook_audio" name="ebook_audio" placeholder="" accept=".*">
                                {{$data->ebook_audio ?? ''}}
                        </div>
                    </form>
                </div>
                <div class="error mx-3 text-center">
                    <div id="Upload_error_area"></div>
                </div>
                <div class="card-footer text-center">
                    <button type="button" id="btnSubmit" onclick="EbookBasicStore()" class="btn btn-primary">Submit &
                        Next</button>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Form Wizard -->

<!-- Main Script -->
<script>
    function alertmsg(msg, type) {
    $("Upload_error_area").removeClass().html('').show();
    $("Upload_error_area").addClass(`alert alert-${type} text-center`).html(msg);
    $("Upload_error_area").fadeOut(3000);
    }
function EbookBasicStore(){
let form_data = document.getElementById("FileStoreForm");
let new_data = new FormData(form_data);
$("#btnSubmit").prop("disabled", true);

$.ajax({
    type: "POST",
    url: "{{route('EbookUploadStore')}}",
    data: new_data,
    processData: false,
    contentType: false,
    error: function(jqXHR, textStatus, errorThrown) {
            $("#btnSubmit").prop("disabled", false);
            $("#Upload_error_area").removeClass().html('').show();
            $("#Upload_error_area").addClass("alert alert-danger").html(errorThrown);
            return false;
        },
        success: function(data) {
            $("#btnSubmit").prop("disabled", false);
            console.log(data);
            // return false;
            if (data["success"] == true) { 
                $("#Upload_error_area").removeClass().html('').show();
                $("#Upload_error_area").addClass("alert alert-success").html(data['message']);
                setTimeout(() => {
                    $("#FileStoreModal").modal('hide');
                    $("#Upload_error_area").removeClass().html('').hide();
                    $("#FileStoreForm")[0].reset();
                    DataTable = $("#DataTable").dataTable();
                    DataTable.fnPageChange('first', 1);
                    window.location.href = "{{route('Ebook')}}";
                }, 2000);
            } else {
                $("#Upload_error_area").removeClass().html('').show();
                $("#Upload_error_area").addClass("alert alert-danger").html(data['message'][0]);
                return false;
            }
        }
});

// $.ajaxSetup({
//   headers: {
//     'X-CSRF-Token': $('meta[name="_token"]').attr('content')
//   }
// });
}


</script>
<!-- Main Script -->
@endsection