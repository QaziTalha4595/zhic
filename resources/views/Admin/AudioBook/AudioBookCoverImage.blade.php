@extends('Admin.AdminLayout')
@section('content')
    <!-- Form Wizard -->
    <div class="row">
        <div class="col-md-12">
            <div class="card card-default">
                <div class="card-header">
                    <h3 class="card-title">Audio Book Upload</h3>
                </div>
                @if (empty($file_id))
                    <div class="card-body p-0">
                        <div class="bs-stepper">
                            <div class="bs-stepper-header" role="tablist">
                                <!-- your steps here -->
                                <div class="step">
                                    <button type="button" onclick="EmptyAlert()" class="step-trigger" role="tab">
                                        <a class="nav-link active">
                                            <span class="bs-stepper-circle">1</span>
                                            <span class="bs-stepper-label">Audio Book Basic Detail</span>
                                        </a>
                                    </button>
                                </div>

                                <div class="line"></div>
                                <div class="step" data-target="#logins-part">
                                    <button type="button" onclick="EmptyAlert()" class="step-trigger" role="tab">
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
                        </div>
                    </div>
                @else
                    <div class="card-body p-0" id="scrollup">
                        <div class="bs-stepper">
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
                                            href="{{ url('ControlPanel/AudioBook-'.$file_id.'-CoverImage') }}"
                                            >
                                            <span class="bs-stepper-circle">2</span>
                                            <span class="bs-stepper-label">Audio Book Cover</span>
                                        </a>
                                    </button>
                                </div>
                                <div class="line"></div>
                                <div class="step" data-target="#information-part">
                                    <button type="button" class="step-trigger" role="tab"
                                        aria-controls="information-part" id="information-part-trigger">
                                        <a class="nav-link"
                                        href="{{url('ControlPanel/AudioBook-'.$file_id.'-Upload')}}"
                                        style="color:inherit">
                                            <span class="bs-stepper-circle">3</span>
                                            <span class="bs-stepper-label">Audio Book Upload</span>
                                        </a>
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>
                @endif
                <div class="tab-content" id="pills-tabContent">
                    <div class="tab-pane fade" id="Tab_1" role="tabpanel"></div>
                    <div class="tab-pane fade show active" id="Tab_2" role="tabpanel">
                        <div class="col-lg-10 mx-auto">
                            <div class="card">
                                <div class="card-body">
                                    <form id="AudioBookFileStoreForm">
                                        <div class="row">
                                            <div class="col-lg-12">
                                                @csrf
                                                <input type="hidden" name="file_id" id="file_id"
                                                    value="{{ $file_id }}">
                                                <input type="hidden" name="audio_book_cover_id" id="audio_book_cover_id">
                                                <div class="row">
                                                    <div class="col-lg-2">
                                                        <div class="form-group" id="fieldRow">
                                                          <div id="imageid" style="width: 100px; height:100px; background-repeat: no-repeat;background-size: contain;background-position: center;">
                                                      </div>
                                                        </div>
                                                    </div>
                                                    <div class="col-lg-3">
                                                        <div class="form-group" id="fieldRow">
                                                            <label class="text-bold">Audio Book Cover Image</label>
                                                            <input type="file" class="required" id="audio_book_cover"
                                                                name="audio_book_cover" placeholder="" accept="image/*">
                                                        </div>
                                                    </div>
                                                    <div class="col-lg-3">
                                                        <div class="form-group" id="fieldRow">
                                                            <label class="text-bold">Audio Book Cover Position</label> <br>
                                                            <select class="form-control select2 border-primary"
                                                                name="audio_book_position" id="audio_book_position"
                                                                style="width:100%;">
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
                                                    <div class="col-lg-3">
                                                        <div class="form-group" id="fieldRow">
                                                            <label class="text-bold">Audio Book Cover Position</label> <br>
                                                            <input type="color" name="audio_book_bg_color"
                                                                id="audio_book_bg_color" class="form-control"
                                                                value="" />
                                                        </div>
                                                    </div>
                                                    <div class="col-lg-12">
                                                        <button type="button" id="btnUpdate" style="width: 100%; display: none;"
                                                            class="btn btn-primary mt-2 mb-4"
                                                            onclick="AudioBookCoverImageStore()">Update Book</button>
                                                    </div>
                                                    <div class="col-lg-12">
                                                        <button type="button" id="btnSubmit" style="width: 100%"
                                                            class="btn btn-primary mt-2 mb-4"
                                                            onclick="AudioBookCoverImageStore()">Add Audio Book</button>
                                                    </div>

                                                </div>
                                                <div class="error mx-3 text-center">
                                                    <div id="error"></div>
                                                </div>
                                            </div>
                                            <!-- table start -->

                                            <table class="table table-striped">
                                                <thead>
                                                    <tr>
                                                        <th scope="col">Id</th>
                                                        <th scope="col">Cover Image</th>
                                                        <th scope="col">Position</th>
                                                        <th scope="col">Color</th>
                                                        <th scope="col">Action</th>
                                                    </tr>
                                                </thead>
                                                <tbody id="cover_table">


                                                </tbody>
                                              </table>
                                        </div>
                                    </form>
                                </div>

                                <div class="card-footer text-center">
                                    <div style="float: right">

                                        @if (!empty($file_id))
                                            <a href="AudioBook-{{ $file_id }}-Upload"
                                                class="btn btn-lg btn-secondary mx-4">Skip</a>
                                        @endif

                                        <a href="AudioBook-{{ $file_id }}-Upload" class="btn btn-lg btn-primary">Save
                                            Next <i class=" fas fa-solid fa-arrow-right"></i></a>
                                    </div>

                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="tab-pane fade" id="Tab_3" role="tabpanel" aria-labelledby="pills-contact-tab">
                    </div>
                </div>
                <!-- /.card -->
            </div>
<script>

$(function () {
    GetEbookCoverImage()
});
function GetEbookCoverImage() {
    $.get("{{route('GetEbookCoverImage')}}", {file_id: {{$file_id}}},
    function (data) {
            var html = ``
            data["data"].forEach(e => {
                html+= `<tr>
                    <td>${e.ebook__cover_id}</td>
                            <td>
                                <div style="height: 100px; width:100px; background-repeat: no-repeat;background-size: contain;background-position: center;background-image: url('{{ asset('public/Files/Audio_Book_CoverImg/' ) }}/${e.ebook_cover}');"
                                ></div>
                            </td>
                            <td>${e.ebook_position }</td>
                            <td>
                            <div
                                style="width: 100px; height:30px; background-color:${e.ebook_bg_color }">
                            </div>
                            </td>
                            <td class="ml-5">
                                {{-- onclick="SubCategoryEdit(' . $SubCategories->id . ')" --}}
                                <a onclick="ImgCoverEdit(${e.ebook__cover_id })"
                                    class="btn btn-primary btn-lg">
                                    <i class="fa fa-edit"></i>
                                </a>
                                <a onclick="ImgCoverRemove(${e.ebook__cover_id })"
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
function AudioBookCoverImageStore() {

    let form_data = document.getElementById("AudioBookFileStoreForm");
    let new_data = new FormData(form_data);
    $("#btnSubmit").prop("disabled", true);

    $.ajax({
        type: "POST",
        url: "{{ route('AudioBookCoverImageStore') }}",
        data: new_data,
        processData: false,
        contentType: false,
        success: (res) => {
            $("#btnSubmit").prop("disabled", false);
            if (res.success) {
                $("#btnSubmit").prop("disabled", true);
                alertmsg(res.message, "success");
                setTimeout(() => {
                    $("#AudioBookFileStoreForm")[0].reset();
                    location.reload();
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
function ImgCoverRemove(audio_book_cover_id) {
    swal({
        title: "Are you sure?",
        text: "Once deleted, you will not be able to recover this file!",
        icon: "warning",
        buttons: true,
        dangerMode: true,
    }).then((willDelete) => {
        if (willDelete) {
            $.get("{{ route('AudioBookCoverImageRemove') }}", {
                audio_book_cover_id: audio_book_cover_id
            }, function(data) {
                console.log(data);
                // return false;
                if (data['success'] == true) {
                    swal("Poof! Audio Book Cover Image has been deleted!", {
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

function ImgCoverEdit(ebook_cover_id) {
            $('#btnSubmit').hide();
            $('#btnUpdate').show();

            $([document.documentElement, document.body]).animate({
                 scrollTop: $("#scrollup").offset().top
    }, 500);

            $.get("{{ route('AudioBookEdit') }}", {
                ebook_cover_id: ebook_cover_id
            }, function(data) {
                $("#audio_book_cover_id").val(data.data[0]['ebook__cover_id']);
                $("#audio_book_position").val(data.data[0]['ebook_position']);
                $("#audio_book_bg_color").val(data.data[0]['ebook_bg_color']);

                $("#imageid").css("background-image", `url('{{url('public/Files/Audio_Book_CoverImg')}}/${data.data[0]['ebook_cover']}`);
                // $("#imageid").css("background-image", "url('{{asset('public/Files/E_Book_CoverImg')}}')/"+data.data[0]['ebook_cover']);
            });
        }
        $('#audio_book_cover').on('change', (e) => {
            $('#imageid').css({'background-image': ``});
            const reader = new FileReader();
            const file = e.target.files[0];
            if (!file.type.match('image.*')) {
                swal("Warning", "Please select an image file.", "warning");
                return $('#audio_book_cover').val('');
            }
            reader.onload = function(e) {
                // $('#imageid').css({'background-image': ``});

                $('#imageid').css('background-image', `url(${e.target.result})`);
            };
            reader.readAsDataURL(file);
        });

</script>
            <!-- Main Script -->
@endsection
