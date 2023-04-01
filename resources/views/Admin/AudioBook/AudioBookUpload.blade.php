@extends('Admin.AdminLayout')
@section('content')
    <div class="row">
        <div class="col-md-12">
            <div class="card card-default">
                <div class="card-header">
                    <h3 class="card-title">Audio Book Upload</h3>
                </div>
                <div class="card-body p-0">
                    <div class="bs-stepper">
                        @if (empty($file_id))
                            <div class="bs-stepper-header" role="tablist">
                                <!-- your steps here -->
                                <div class="step" data-target="#logins-part">
                                    <button type="button" onclick="EmptyAlert()" class="step-trigger" role="tab"
                                        aria-controls="logins-part" id="logins-part-trigger">
                                        <span class="bs-stepper-circle">1</span>
                                        <span class="bs-stepper-label">Audio Book Basic Detail</span>
                                    </button>
                                </div>
                                <div class="line"></div>
                                <div class="step" data-target="#logins-part">
                                    <button type="button" onclick="EmptyAlert()" class="step-trigger" role="tab"
                                        aria-controls="logins-part" id="logins-part-trigger">
                                        <span class="bs-stepper-circle">2</span>
                                        <span class="bs-stepper-label">Audio Book Cover</span>
                                    </button>
                                </div>
                                <div class="line"></div>
                                <div class="step" data-target="#information-part">
                                    <button type="button" onclick="EmptyAlert()" class="step-trigger" role="tab"
                                        aria-controls="information-part" id="information-part-trigger">
                                        <span class="bs-stepper-circle">3</span>
                                        <span class="bs-stepper-label">Audio Book Upload</span>
                                    </button>
                                </div>
                            </div>
                        @else
                            <div class="bs-stepper-header" role="tablist">
                                <!-- your steps here -->
                                <div class="step" data-target="#logins-part">
                                    <button type="button" class="step-trigger" role="tab" aria-controls="logins-part"
                                        id="logins-part-trigger">
                                        <a class="nav-link active"
                                            href="{{ url('ControlPanel/AudioBook-' . $file_id . '-Basic') }}">
                                            <span class="bs-stepper-circle">1</span>
                                            <span class="bs-stepper-label">Audio Book Basic Detail</span>
                                        </a>
                                    </button>
                                </div>
                                <div class="line bg-primary"></div>
                                <div class="step" data-target="#logins-part">
                                    <button type="button" class="step-trigger" role="tab" aria-controls="logins-part"
                                        id="logins-part-trigger">
                                        <a class="nav-link active"
                                            href="{{ url('ControlPanel/AudioBook-'.$file_id.'-CoverImage') }}">
                                            <span class="bs-stepper-circle">2</span>
                                            <span class="bs-stepper-label">Audio Book Cover</span>
                                        </a>
                                    </button>
                                </div>
                                <div class="line bg-primary"></div>
                                <div class="step" data-target="#information-part">
                                    <button type="button" class="step-trigger" role="tab"
                                        aria-controls="information-part" id="information-part-trigger">
                                        <a class="nav-link active"
                                            href="{{ url('ControlPanel/AudioBook-'.$file_id.'-Upload') }}">
                                            <span class="bs-stepper-circle">3</span>
                                            <span class="bs-stepper-label">Audio Book Upload</span>
                                        </a>
                                    </button>
                                </div>
                            </div>
                    </div>
                    @endif

                    <div class="tab-content" id="pills-tabContent">
                        <div class="tab-pane fade " id="Tab_1" role="tabpanel" aria-labelledby="pills-home-tab">
                        </div>
                        <div class="tab-pane fade" id="Tab_2" role="tabpanel" aria-labelledby="pills-profile-tab">
                        </div>
                        <div class="tab-pane fade show active" id="Tab_3" role="tabpanel"
                            aria-labelledby="pills-contact-tab">
                            <div class="col-lg-12 mx-auto">
                                <div class="card">
                                    <div class="card-body" id="scrollup">
                                        <form id="AudioFileStoreForm">
                                            <div class="row">
                                                <div class="col-lg-12">
                                            @csrf
                                            <input type="hidden" name="file_id" value="{{ $file_id }}" />
                                            <input type="hidden" name="audio_attachment_id" id="audio_attachment_id">
                                            <div class="container">
                                                <div class="row">
                                                    <div class="col-md-4">
                                                        <label class="text-bold">Audio Title</label>
                                                        <input type="text"
                                                            class="form-control form-control-user border-primary"
                                                            id="audio_title" name="audio_title"
                                                            placeholder="Audio Title">

                                                    </div>

                                                    <div class="col-md-4">
                                                        <label class="text-bold">Audio Title in Arabic</label>
                                                        <input type="text"
                                                            class="form-control form-control-user border-primary"
                                                            id="audio_title_in_arabic" name="audio_title_in_arabic"
                                                            placeholder="Audio Title">
                                                    </div>

                                                    <div class="col-md-4">
                                                        <label class="text-bold">Audio</label>
                                                        <input type="file"
                                                        class="form-control form-control-user border-primary"
                                                        id="audio_attachment" name="audio_attachment"
                                                        placeholder="" accept=".mp3">
                                                        <span id="imageid"></span>
                                                      </div>
                                                    </div>

                                                    <div class="col-lg-12 mt-3">
                                                        <button type="button" id="btnUpdate" style="width: 100%; display: none;"
                                                            class="btn btn-primary mt-2 mb-4"
                                                            onclick="Audio_Book_UploadFile()">Update Book</button>
                                                    </div>
                                                    <div class="col-lg-12 mt-2">
                                                        <button type="button" id="btnSubmit" style="width: 100%"
                                                            class="btn btn-primary mt-2 mb-4"
                                                            onclick="Audio_Book_UploadFile()">Add Book</button>
                                                    </div>
                                                    <div class="error mx-3 text-center">
                                                        <div id="error"></div>
                                                    </div>

                                                </div>


                                                    <div class="col-md-12 mt-4">

                                                     <table class="table table-striped">
                                                        <thead>
                                                            <tr>
                                                                <th>Id</th>
                                                                <th>Audio Name</th>
                                                                <th>File</th>
                                                                <th>Audio Link</th>
                                                                <th>Action</th>
                                                            </tr>
                                                        </thead>
                                                        <tbody id="cover_table">

                                                        </tbody>
                                                    </table>
                                                </div>

                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                        </form>
                                    </div>

                                </div>
                                <div class="error mx-3 text-center">
                                    <div id="error"></div>
                                </div>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    </div>
    <!-- Form Wizard -->

    <!-- Main Script -->
<script>
         $(function () {
            GetAudioFile()
        });

function GetAudioFile() {
    $.get("{{route('GetAudioFile')}}", {file_id: {{$file_id}}},
    function (data) {
            var html = ``
            data["data"].forEach(e => {
                html+= ` <tr>
                            <td>${e.audio_id}</td>
                            <td>
                                ${e.audio_title}
                            </td>
                            <td>
                                ${e.audio_file}
                            </td>
                            <td>
                                ${e.audio_link}
                            </td>
                            <td class="ml-5">
                                <a onclick="AudioFileEdit(${e.audio_id })"
                                    class="btn btn-primary btn-lg">
                                    <i class="fa fa-edit"></i>
                                </a>
                                <a onclick="AudioFileRemove(${e.audio_id })"
                                    class="btn btn-danger btn-lg">
                                    <i class="fa fa-trash"></i>
                                </a>

                            </td>
                        </tr>`

            });

            $("#cover_table").html(html);
        }
    );
 }
function Audio_Book_UploadFile()
{

    let form_data = document.getElementById("AudioFileStoreForm");
    let new_data = new FormData(form_data);
    $("#btnSubmit").prop("disabled", true);

    $.ajax({
        type: "POST",
        url: "{{ route('AudioStore') }}",
        data: new_data,
        processData: false,
        contentType: false,
        success: (res) => {
            $("#audio_attachment_id").val("");
            $('#btnSubmit').show();
            $('#btnUpdate').hide();
                    $("#btnSubmit").prop("disabled", false);
                    if (res.success) {
                        $('#imageid').html('')
                        alertmsg(res.message, "success");
                        setTimeout(() => {
                            $("#AudioFileStoreForm")[0].reset();
                            GetAudioFile();
                        }, 1000);
                    } else if (res.validate) {
                        alertmsg(res.message, "warning")
                    } else {
                        alertmsg(res.message, "danger")
                    }
                },
                error: (err) => {
                    alertmsg("Something went wrong", "danger");
                    $("#btnSubmit").prop("disabled", false);
                }
    });

 }
 function AudioFileRemove(audio_book_id) {
    swal({
        title: "Are you sure?",
        text: "Once deleted, you will not be able to recover this file!",
        icon: "warning",
        buttons: true,
        dangerMode: true,
    }).then((willDelete) => {
        if (willDelete) {
            $.get("{{ route('AudioBookFileRemove') }}", {
                audio_book_id: audio_book_id
            }, function(data) {
                console.log(data);
                // return false;
                if (data['success'] == true) {
                    swal("Poof! Audio File has been deleted!", {
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
// function ImgCoverRemove(ebook__cover_id) {
//             swal({
//                 title: "Are you sure?",
//                 text: "Once deleted, you will not be able to recover this file!",
//                 icon: "warning",
//                 buttons: true,
//                 dangerMode: true,
//             }).then((willDelete) => {
//                 if (willDelete) {
//                     $.get("{{ route('EbookCoverImageRemove') }}", {
//                         ebook__cover_id: ebook__cover_id
//                     }, function(data) {
//                         console.log(data);
//                         // return false;
//                         if (data['success'] == true) {
//                             swal("Poof! Ebook Cover Image has been deleted!", {
//                                 icon: "success",
//                             });
//                         } else {
//                             swal("Oops something went wrong, please check!", {
//                                 icon: "error",
//                             });
//                         }
//                         setTimeout(() => {
//                             GetEbookCoverImage();
//                         }, 700);
//                     });
//                 } else {
//                     swal("Your file is safe!");
//                 }
//             });
//         }

        function AudioFileEdit(audio_id) {
            $('#btnSubmit').hide();
            $('#btnUpdate').show();

            $([document.documentElement, document.body]).animate({
                 scrollTop: $("#scrollup").offset().top
    }, 500);

            $.get("{{ route('AudioEdit') }}", {
                audio_id: audio_id
            }, function(data) {
                $("#audio_attachment_id").val(data.data[0]['audio_id']);
                $("#audio_title").val(data.data[0]['audio_title']);
                $("#imageid").html(data.data[0]['audio_file']);
            });
        }
</script>
<!-- Main Script -->
@endsection
