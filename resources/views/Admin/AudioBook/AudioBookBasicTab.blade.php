@extends('Admin.AdminLayout')
@section('content')
    <!-- Form Wizard -->
    <div class="row">
        <div class="col-md-12">
            <div class="card card-default">
                <div class="card-header">
                    <h3 class="card-title">Audio Book Detail</h3>
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
                    <div class="card-body p-0">
                        <div class="bs-stepper">
                            <div class="bs-stepper-header" role="tablist">
                                <!-- your steps here -->
                                <div class="step" data-target="#logins-part">
                                    <button type="button" class="step-trigger" role="tab" aria-controls="logins-part"
                                        id="logins-part-trigger">
                                        <a class="nav-link active"
                                            href="{{url('ControlPanel/AudioBook-' . $file_id . '-Basic') }}">
                                            <span class="bs-stepper-circle">1</span>
                                            <span class="bs-stepper-label">Audio Book Basic Detail</span>
                                        </a>
                                    </button>
                                </div>
                                <div class="line"></div>
                                <div class="step" data-target="#logins-part">
                                    <button type="button" class="step-trigger" role="tab" aria-controls="logins-part"
                                        id="logins-part-trigger">
                                        <a class="nav-link"
                                            href="{{url('ControlPanel/AudioBook-'.$file_id.'-CoverImage')}}"
                                            style="color:inherit">
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
                    <div class="tab-pane fade show active" id="Tab_1" role="tabpanel" aria-labelledby="pills-home-tab">
                        <!-- main form -->
                        <div class="col-md-10 mx-auto">
                            <div class="card">

                                <div class="card-body">
                                    <form id="AudioBookStoreForm" enctype="multipart/form-data">
                                        @csrf
                                        <input type="hidden" id="file_id" name="file_id"
                                            value="{{ $data->file_id ?? '' }}">

                        <input type="hidden" name="book_type" id="book_type" value="1" />
                                        <div class="form-group">
                                            <div class="container-fluid">
                                                <div class="row">
                                                    <div class="col-md-3">
                                                        <label>Category</label>
                                                        <select class="form-control select2" name="category_id" id="category_id" style="width:100%;" >
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
                                                            <option value="{{ $item->id }}"> {{ $item->category_name  }} </option>
                                                            @endforeach
                                                            @endif
                                                        </select>

                                                    </div>

                                                    <div class="col-md-3">
                                                        <label>Sub Category</label>
                                                        <select class="form-control select2" disabled name="sub_cat_id"
                                                            id="sub_cat_id" style="width:100%;">
                                                        @if(empty($file_id))
                                                            <option selected disabled> Select SubCategory </option>
                                                        @else
                                                            <option value="{{ $data->subcategory->id ?? '' }}">
                                                                {{ $data->subcategory->sub_category_name ?? '' }}
                                                            </option>
                                                        @endif
                                                        </select>
                                                    </div>


                                                    <div class="col-md-3">
                                                        <label>Third Category</label>
                                                        <select class="form-control select2" disabled name="third_category_id" id="third_category_id" style="width:100%;">
                                                        @if(empty($file_id))
                                                            <option selected disabled>Select ThirdCategory</option>
                                                        @else
                                                            <option value="{{$data->thirdcategory->id ?? ''}}">
                                                                {{ $data->thirdcategory->third_category_name ?? ''}}
                                                            </option>
                                                        @endif
                                                        </select>
                                                    </div>


                                                    <div class="col-md-3">

                                                        <label class="text-bold">Book Languages</label>
                                                        <select class="form-control select2" name="language_id" id="language_id" style="width:100%;" >
                                                        @if(empty($file_id))
                                                        <option selected disabled>Select Language</option>
                                                        @else
                                                        <option value="{{$data->language->id ?? ''}}">{{ $data->language->language ?? 'Select'}}</option>
                                                        @endif
                                                        @if(!empty($Ebook))
                                                        @foreach($Languages as $item)
                                                        @if($Ebook[0]->language_id == $item->language_id)
                                                        <option selected value="{{$item->language_id ?? ''}}">
                                                            {{$item->language ?? ''}}</option>
                                                        @else
                                                        <option value="{{$item->language_id ?? ''}}">
                                                            {{$item->language ?? ''}}</option>
                                                        @endif
                                                        @endforeach
                                                        @else
                                                        @foreach($Languages as $item)
                                                        <option value="{{ $item->id }}"> {{ $item->language  }} </option>
                                                        @endforeach
                                                        @endif
                                                    </select>

                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="form-group">

                                            <label class="text-bold">Audio Book Title</label>
                                            <input type="text" class="form-control form-control-user required "
                                                id="audio_book_name" name="audio_book_name"
                                                placeholder="Enter Book Title"
                                                value="{{ $data->ebook_name ?? '' }}">
                                        </div>
                                        <div class="form-group">
                                            <label class="text-bold">Audio Book in Arabic</label>
                                            <input type="text" class="form-control form-control-user required "
                                                id="audio_book_name_in_arabic" name="audio_book_name_in_arabic"
                                                placeholder="Enter Book Title"
                                                value="{{ $data->ebook_name ?? '' }}">
                                        </div>
                                        <div class="form-group">
                                            <label class="text-bold">Publisher</label>
                                            <input type="text" class="form-control form-control-user"
                                                id="audio_book_publisher" name="audio_book_publisher" placeholder="Publisher"
                                                value="{{ $data->ebook_publisher ?? '' }}">
                                        </div>
                                        <div class="form-group">
                                            <label class="text-bold">publishing Date</label>
                                            <input type="date" class="form-control form-control-user"
                                                id="audio_book_publishing_date" name="audio_book_publishing_date"
                                                placeholder="Enter Book Author"
                                                value="{{ $data->publishing_date ?? '' }}">
                                        </div>
                                        <div class="form-group">
                                            <label class="text-bold">Audio Book ISBN</label>
                                            <input type="number" class="form-control form-control-user"
                                                id="audio_book_isbn" name="audio_book_isbn" placeholder=" Book ISBN"
                                                value="{{ $data->ebook_isbn ?? '' }}">
                                        </div>
                                        <div class="form-group">
                                            <label class="text-bold">Speaker Name</label>
                                            <input type="text" class="form-control form-control-user"
                                                id="audio_book_author_name" name="audio_book_author_name"
                                                placeholder="Enter Book Author"
                                                value="{{ $data->ebook_author ?? '' }}">
                                        </div>
                                        <div class="form-group">
                                            <label class="text-bold">Speaker Name in Arabic</label>
                                            <input type="text" class="form-control form-control-user"
                                                id="audio_book_author_name_in_arabic" name="audio_book_author_name_in_arabic"
                                                placeholder="Enter Book Author"
                                                value="{{ $data->ebook_author ?? '' }}">
                                        </div>
                                        <div class="form-group">
                                            <label class="text-bold">Audio Short Description</label>
                                            <textarea class="form-control" id="audio_book_notes" name="audio_book_notes" placeholder="Enter Book Short Notes">{{ $data->ebook_note ?? '' }}</textarea>
                                        </div>
                                        <div class="form-group">
                                            <label class="text-bold">Audio Short Description In Arabic</label>
                                            <textarea class="form-control" id="audio_book_notes_in_arabic" name="audio_book_notes_in_arabic" placeholder="Enter Book Short Notes">{{ $data->ebook_note ?? '' }}</textarea>
                                        </div>

                                        <div class="row">
                                            <div class="col-lg-3 col-md-6 col-sm-6">
                                            <div class="form-group">
                                                <label class="text-bold">Printable</label>
                                                <input type="checkbox" id="printable" name="printable" {{($data->printable ?? 0 )== 1 ? "checked" : ""}}>
                                            </div>
                                            </div>
                                            <div class="col-lg-3 col-md-6 col-sm-6">
                                            <div class="form-group">
                                                <label class="text-bold">Most Searchable</label>
                                                <input type="checkbox" id="searchable" name="searchable" {{($data->searchable ?? 0 )== 1 ? "checked" : ""}}>
                                            </div>
                                            </div>
                                            <div class="col-lg-3 col-md-6 col-sm-6">
                                            <div class="form-group">
                                                <label class="text-bold">Featured</label>
                                                <input type="checkbox" id="featured" name="featured" {{($data->featured  ?? 0 )== 1 ? "checked" : ""}}>
                                            </div>
                                            </div>
                                        </div>
                                    </form>
                                    <div>

                                    </div>

                                    <div class="card-footer text-center">
                                        <div class="text-center m-2">
                                            <span id="error" style="display: none;"
                                                class="m-2"></span>
                                        <button type="button" style="float: right" id="btnSubmit"
                                            onclick="AudioBookBasicStore()" class="btn btn-primary btn-lg">Save Next <i
                                                class=" fas fa-solid fa-arrow-right"></i> </button>

                                        </div>
                                    </div>
                                </div>


                            </div>
                        </div>
                        <!-- main form -->
                    </div>
                </div>
            </div>
        </div>
        <!-- /.card -->
    </div>
    <!-- Form Wizard -->
    <!-- Main Script -->
    <script>
$(function() {

    $("#category_id").change(function(event) {
        var idCategory = this.value;
        $("#sub_cat_id").html(' <option value="" selected disabled>Select SubCategory</option> ');
        $("#sub_cat_id").attr("disabled", false);
        $.ajax({

            type: "GET",
            url: "{{ route('FetchSubCategory') }}",
            dataType: 'json',
            data: {
                cat_id: idCategory
            },
            success: function(response) {
                $.each(response.data.sub_categories, function(index, val) {
                    console.log(val);
                    $("#sub_cat_id").append('<option value="' + val.id + '">' +
                        val.sub_category_name + '</option>')
                });
            }

        });
    });

    $("#sub_cat_id").change(function(event) {
        var idThirdCat = this.value;
        $("#third_category_id").html(' <option value="" selected disabled>Select ThirdCategory</option> ');
        $("#third_category_id").attr("disabled", false);
        $.ajax({

            type: "GET",
            url: "{{ route('FetchThirdCategory') }}",
            dataType: 'json',
            data: {
                third_cat_id: idThirdCat
            },
            success: function(response) {
                $.each(response.data.third_categories, function(index, val) {
                    console.log(val);
                    $("#third_category_id").append('<option value="' + val.id + '">' + val.third_category_name + '</option>');
                });
            }

        });
    });

});

function AudioBookBasicStore() {

    $("#sub_cat_id").prop('disabled', false);
    $("#third_category_id").prop('disabled', false);
    $("#btnSubmit").prop("disabled", true);

    let form_data = document.getElementById("AudioBookStoreForm");
    let new_data = new FormData(form_data);

    $("#btnSubmit").prop("disabled", true);
    $.ajax({
        type: "POST",
        url: "{{ route('AudioBookStore') }}",
        data: new_data,
        processData: false,
        contentType: false,
        error: function(jqXHR, textStatus, errorThrown) {
                $("#btnSubmit").prop("disabled", false);
                $("#error").removeClass().html('').show();
                $("#error").addClass("alert alert-warning").html(errorThrown);
                return false;
        },
        success: function(res) {
            $("#btnSubmit").prop("disabled", false);
            if (res["success"] == true) {
                $("#btnSubmit").prop("disabled", true);
                alertmsg(res.message, "success");
                setTimeout(() => {
                    $("#btnSubmit").prop("disabled", true);
                    DataTable = $("#DataTable").dataTable();
                    DataTable.fnPageChange('first', 1);
                    next_url = 'AudioBook-' + res['file_id'] + '-CoverImage';
                    if ($("#file_id").val() == "" || $("#file_id").val() == null) {
                        window.location.href = next_url;
                    } else {
                        window.location.href = next_url;
                    }
                    console.log(res);
                    return false;
                }, 2000);
            } else if (res.validate) {
                alertmsg(res.message, "warning")
            } else {
                alertmsg(res.message, "danger")
            }
    }
    });
}

function EmptyAlert() {
    swal({
        title: "Please fill the form and press Save & Next",
        text: "",
        icon: "warning",
        button: true,
        dangerMode: true,
    });
    return false;
}
    </script>
@endsection
