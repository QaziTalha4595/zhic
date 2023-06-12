@extends('Admin.AdminLayout')
@section('content')

<style>
    /* Chrome, Safari, Edge, Opera */
input::-webkit-outer-spin-button,
input::-webkit-inner-spin-button {
  -webkit-appearance: none;
  margin: 0;
}

/* Firefox */
input[type=number] {
  -moz-appearance: textfield;
}
</style>

<div class="row">
    <div class="col-md-12">
        <div class="card card-default">
            <div class="card-header">
                <h3 class="card-title">Ebook Detail</h3>
            </div>
            @if(empty($ebook_id))
            <div class="card-body p-0">
                <div class="bs-stepper">
                    <div class="bs-stepper-header" role="tablist">
                        <!-- your steps here -->
                        <div class="step">
                            <button type="button" onclick="EmptyAlert()" class="step-trigger" role="tab">
                            <a class="nav-link active">
                                <span class="bs-stepper-circle">1</span>
                                <span class="bs-stepper-label">EbookBasic Detail</span>
                            </a>
                            </button>
                        </div>

                        <div class="line"></div>
                        <div class="step" data-target="#logins-part">
                            <button type="button" onclick="EmptyAlert()" class="step-trigger" role="tab">
                                <span class="bs-stepper-circle">2</span>
                                <span class="bs-stepper-label">Ebook Cover</span>
                            </button>
                        </div>

                        <div class="line"></div>
                        <div class="step" data-target="#information-part">
                            <button type="button" onclick="EmptyAlert()" class="step-trigger" role="tab" aria-controls="information-part" id="information-part-trigger">
                                <span class="bs-stepper-circle">3</span>
                                <span class="bs-stepper-label">Ebook Upload</span>
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
                            <button type="button" class="step-trigger" role="tab" aria-controls="logins-part" id="logins-part-trigger">
                                <a class="nav-link active" href="{{ url('ControlPanel/Ebook-'.$ebook_id.'-Basic') }}">
                                    <span class="bs-stepper-circle">1</span>
                                    <span class="bs-stepper-label">Ebook Basic Detail</span>
                                </a>
                            </button>
                        </div>
                        <div class="line"></div>
                        <div class="step" data-target="#logins-part">
                            <button type="button" class="step-trigger" role="tab" aria-controls="logins-part" id="logins-part-trigger">
                                <a class="nav-link" href="{{url('ControlPanel/Ebook-'.$ebook_id.'-CoverImage')}}" style="color:inherit">
                                    <span class="bs-stepper-circle">2</span>
                                    <span class="bs-stepper-label">Ebook Cover</span>
                                </a>
                            </button>
                        </div>
                        <div class="line"></div>
                        <div class="step" data-target="#information-part">
                            <button type="button" class="step-trigger" role="tab" aria-controls="information-part" id="information-part-trigger">
                                <a class="nav-link" href="{{url('ControlPanel/Ebook-'.$ebook_id.'-Upload')}}" style="color:inherit">
                                    <span class="bs-stepper-circle">3</span>
                                    <span class="bs-stepper-label">Ebook Upload</span>
                                </a>
                            </button>
                        </div>
                    </div>
                </div>
            </div>
            @endif
            <!-- Form Wizard -->
            <div class="tab-content" id="pills-tabContent">
                <div class="tab-pane show active" id="Tab_1" role="tabpanel" aria-labelledby="pills-home-tab">
                    <!-- main form -->
                    <div class="col-md-10 mx-auto">
                        <div class="card">
                            <div class="card-body">
                                <form id="EbookStoreForm" enctype="multipart/form-data">
                                    @csrf
                                    <input type="hidden" id="ebook_id" name="ebook_id" value="{{$data->ebook_id ?? ''}}">
                                    <div class="form-group">
                                        <div class="container-fluid">
                                            <div class="row">
                                                <div class="col-md-3">
                                                    <label>Category</label>
                                                    <select class="form-control select2" name="category_id" id="category_id" style="width:100%;" >
                                                        @if(empty($ebook_id))
                                                        <option selected disabled>Select Category</option>
                                                        @else
                                                        <option value="{{$data->category->category_id ?? ''}}">{{ $data->category->category_name ?? 'Select'}}</option>
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
                                                        <option value="{{ $item->category_id }}"> {{ $item->category_name  }} </option>
                                                        @endforeach
                                                        @endif
                                                    </select>

                                                </div>

                                                <div class="col-md-3">
                                                    <label>Sub Category</label>
                                                    <select class="form-control select2" disabled name="sub_category_id" id="sub_category_id" style="width:100%;">
                                                        @if(empty($ebook_id))
                                                        <option selected disabled>Select SubCategory</option>
                                                        @else
                                                        <option value="{{$data->subcategory->sub_cat_id ?? ''}}">{{ $data->subcategory->sub_cat_name ?? 'Select'}}</option>
                                                        @endif
                                                    </select>
                                                </div>


                                                <div class="col-md-3">
                                                    <label>Third Category</label>
                                                    <select class="form-control select2" disabled name="third_category_id" id="third_category_id" style="width:100%;">
                                                    @if(empty($ebook_id))
                                                        <option selected disabled>Select</option>
                                                    @else
                                                        <option value="{{$data->thirdcategory->third_cat_id ?? ''}}">{{ $data->thirdcategory->third_cat_name ?? 'Select'}}</option>
                                                    @endif
                                                    </select>
                                                </div>


                                                <div class="col-md-3">

                                                    <label class="text-bold">Book Languages</label>
                                                    <select class="form-control select2" name="language_id" id="language_id" style="width:100%;" >
                                                    @if(empty($ebook_id))
                                                    <option selected disabled>Select Language</option>
                                                    @else
                                                    <option value="{{$data->language->language_id?? ''}}">{{ $data->language->language ?? 'Select'}}</option>
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
                                                    <option value="{{ $item->language_id }}"> {{ $item->language  }} </option>
                                                    @endforeach
                                                    @endif
                                                </select>

                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group">

                                        <label class="text-bold">Book Title</label>
                                        <input type="text" class="form-control form-control-user required " id="ebook_name" name="ebook_name" placeholder="Enter Book Title" value="{{ $data->ebook_name ?? '' }}">
                                    </div>
                                    <div class="form-group">
                                        <label class="text-bold">Book Publisher</label>
                                        <input type="text" class="form-control form-control-user" id="ebook_publisher" name="ebook_publisher" placeholder=" Book Publisher" value="{{ $data->ebook_publisher ?? '' }}">
                                    </div>
                                    <div class="form-group">
                                        <label class="text-bold">Publishing Date</label>
                                        <input type="date" class="form-control form-control-user" id="publishing_date" name="publishing_date" placeholder=" Book Publishing Date" value="{{ $data->publishing_date ?? '' }}">
                                    </div>
                                    <div class="form-group">
                                        <label class="text-bold">Book ISBN</label>
                                        <input type="text" class="form-control form-control-user" id="ebook_isbn" name="ebook_isbn" placeholder=" Book ISBN" value="{{ $data->ebook_isbn ?? '' }}">
                                    </div>
                                    <div class="form-group">
                                        <label class="text-bold">Book Author</label>
                                        <input type="text" class="form-control form-control-user" id="ebook_author" name="ebook_author" placeholder="Enter Book Author" value="{{ $data->ebook_author ?? '' }}">
                                    </div>
                                    <div class="form-group">
                                        <label class="text-bold">Direction</label>
                                        <select class="form-control select2" name="direction" id="direction" style="width:100%;">


                                            <option selected value="rtl">Right To Left</option>
                                            <option value="ltr">Left To Right</option>
                                        </select>
                                    </div>
                                    <div class="form-group">
                                        <label class="text-bold">Book Short Notes</label>
                                        <textarea class="form-control" id="ebook_note" name="ebook_note" placeholder="Enter Book Short Notes">{{ $data->ebook_note ?? '' }}</textarea>
                                    </div>

                                    <div class="row">


                                        <div class="col-lg-3 col-md-6 col-sm-6">
                                            <div class="form-group">
                                                <label class="text-bold">Downlodable</label>
                                                <input type="checkbox" id="downloadable" name="downloadable" {{($data->downloadable ?? 0 )== 1 ? "checked" : ""}}>
                                            </div>
                                        </div>
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
                                    <div class="text-center m-2">
                                        <span id="Ebook_error_area" style="display: none;" class="m-auto"></span>
                                    </div>
                                </div>
                                <div class="error mx-3 text-center">
                                    <div id="error"></div>
                                </div>
                                <div class="card-footer text-center">
                                    <button type="button" style="float: right" id="btnSubmit" onclick="EbookBasicStore()" class="btn btn-primary btn-lg">Save Next <i class=" fas fa-solid fa-arrow-right"></i> </button>
                                </div>
                            </div>
                        </div>
                        <!-- main form -->
                    </div>
                </div>
                <!-- Form Wizard -->
            </div>
        </div>
    </div>
    <!-- /.card -->
</div>
</div>
<!-- Main Script -->
<script>

    $(function() {

        $("#category_id").change(function(event) {
            var idCategory = this.value;
            $("#sub_category_id").html(' <option value="" selected disabled>Select SubCategory</option> ');
            $("#sub_category_id").attr("disabled", false);
            $("#third_category_id").html('');
            $.ajax({

                type: "GET",
                url: "{{route('FetchSubCategory')}}",
                dataType: 'json',
                data: {
                    category_id: idCategory
                },
                success: function(response) {
                    $.each(response.data, function(index, val) {
                        console.log(val);
                        $("#sub_category_id").append('<option value="' + val.sub_cat_id + '">' + val.sub_cat_name + '</option>')
                    });
                }

            });
        });

        $("#sub_category_id").change(function(event) {
            var idThirdCat = this.value;
            $("#third_category_id").html('<option value="" selected disabled    >Select Third Category</option> ');
            $("#third_category_id").attr("disabled", false)
            $.ajax({

                type: "GET",
                url: "{{route('FetchThirdCategory')}}",
                data: {
                    third_cat_id: idThirdCat
                },
                success: function(response) {
                    $.each(response.data, function(index, val) {
                        console.log(val);
                        $("#third_category_id").append('<option value="' + val.third_cat_id + '">' + val.third_cat_name + '</option>');
                    });
                }

            });
        });

    });

    function EbookBasicStore() {

        $("#sub_category_id").prop('disabled', false);
        $("#third_category_id").prop('disabled', false);
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
                $("#Ebook_error_area").addClass("alert alert-warning").html(errorThrown);
                return false;
            },
            success: function(data) {
                $("#btnSubmit").prop("disabled", false);
                if (data["success"] == true) {
                    $("#btnSubmit").prop("disabled", true);
                    $("#Ebook_error_area").removeClass().html('').show();
                    $("#Ebook_error_area").addClass("alert alert-success").html(data['message']);
                    setTimeout(() => {
                        $("#btnSubmit").prop("disabled", true);
                        $("#Ebook_error_area").removeClass().html('').hide();
                        DataTable = $("#DataTable").dataTable();
                        DataTable.fnPageChange('first', 1);
                        next_url = 'Ebook-' + data['ebook_id'] + '-CoverImage';
                        if ($("#ebook_id").val() == "" || $("#ebook_id").val() == null) {
                            window.location.href = next_url;
                        } else {
                            window.location.href = next_url;
                        }
                        console.log(data);
                        return false;
                    }, 2000);
                } else {
                    $("#Ebook_error_area").removeClass().html('').show();
                    $("#Ebook_error_area").addClass("alert alert-warning").html(data['message']);
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
            button: true,
            dangerMode: true,
        });
        return false;
    }
</script>
@endsection
