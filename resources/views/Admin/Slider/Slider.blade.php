@extends('layout')

@section('content')
<div class="container-fluid">
    <!-- Page Heading -->
    <div class="row">
        <div class="col-lg-12 mb-2">
            <div class="card shadow">
                <div class="card-body">
                    <div class="row no-gutters align-items-center">
                        <div class="col mr-2">
                            <div class="h5 mb-0 font-weight-bold text-gray-800">Main Slider</div>
                        </div>
                        <div class="col-auto">
                            <button type="button" class="btn btn-primary" data-toggle="modal"
                                data-target="#SliderStoreModal">Add</button>

                            <div class="modal fade" id="SliderStoreModal">
                                <div class="modal-dialog modal-dialog-centered">
                                    <div class="modal-content">
                                        <!-- Modal Header -->
                                        <div class="modal-header">
                                            <h4 class="modal-title">Add Slider</h4>
                                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                                        </div>
                                        <!-- Modal body -->
                                        <div class="modal-body">
                                            <form id="SliderStoreForm" enctype="multipart/form-data">
                                                @csrf
                                                <div class="form-group">
                                                    <lable>Heading</lable>
                                                    <input type="text" class="form-control form-control-user required "
                                                        id="slider_heading" name="slider_heading"
                                                        placeholder="Enter Slider Heading">
                                                </div>
                                                <div class="form-group">
                                                    <lable>Caption</lable>
                                                    <input type="text" class="form-control form-control-user required "
                                                        id="slider_caption" name="slider_caption"
                                                        placeholder="Enter Slider Caption">
                                                </div>
                                                <div class="form-group">
                                                    <lable>Link</lable>
                                                    <input type="text" class="form-control form-control-user required "
                                                        id="link" name="link" placeholder="Enter Slider Link">
                                                </div>
                                                <div class="form-group">
                                                    <lable>Slider Background Colour</lable>
                                                    <input type="text" class="form-control form-control-user required "
                                                        id="slider_bg" name="slider_bg"
                                                        placeholder="Enter Slider Background Color">
                                                </div>
                                                <div class="form-group">
                                                    <lable>Slider Position</lable>
                                                    <select name="slider_position" id="slider_position"
                                                        class="form-control form-control-user">
                                                        <option disabled selected>select</option>
                                                        <option value="1">1</option>
                                                        <option value="2">2</option>
                                                        <option value="3">3</option>
                                                    </select>
                                                </div>
                                                <div class="form-group">
                                                    <lable>Slider Image</lable>
                                                    <input type="file" class="form-control form-control-user required "
                                                        id="slider_image" name="slider_img"
                                                        placeholder="Enter Slider Link">
                                                </div>

                                            </form>
                                        </div>
                                        <div class="form-group text-center">
                                            <span id="show_error" style="display: none;" class="m-auto"></span>
                                        </div>
                                        <!-- Modal footer -->
                                        <div class="modal-footer">
                                            <span id="visitor_error_area" style="display: none;" class="m-auto"></span>
                                            <button type="button" class="btn btn-secondary"
                                                data-dismiss="modal">Close</button>
                                            <button type="button" id="btnSubmit" onclick="SliderStore()"
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
            <h6 class="m-0 font-weight-bold">Slider List</h6>
        </div>
        <div class="card-body">
            <div class="table-responsive">
                <table id="DataTable" class="table table-bordered" width="100%" cellspacing="0">
                    <thead>
                        <tr>
                            <th>UID</th>
                            <th>Heading</th>
                            <th>Caption</th>
                            <th>Image</th>
                            <th>Action</th>
                        </tr>
                    </thead>
                </table>
            </div>
        </div>
    </div>
</div>

<div class="modal fade" id="SliderEditModal">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content border-primary">
            <!-- Modal Header -->
            <div class="modal-header">
                <h4 class="modal-title">Slider Update</h4>
                <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>
            <!-- Modal body -->
            <div class="modal-body">
                <form id="SliderEditForm">
                    @csrf
                    <input type="hidden" name="slider_id" id="slider_id">
                    <div class="form-group">
                        <lable>Heading</lable>
                        <input type="text" class="form-control form-control-user edit_input " id="edit_slider_heading"
                            name="slider_heading" placeholder="Enter Slider Heading">
                    </div>
                    <div class="form-group">
                        <lable>Caption</lable>
                        <input type="text" class="form-control form-control-user edit_input " id="edit_slider_caption"
                            name="slider_caption" placeholder="Enter Slider Caption">
                    </div>
                    <div class="form-group">
                        <lable>Link</lable>
                        <input type="text" class="form-control form-control-user edit_input " id="edit_link" name="link"
                            placeholder="Enter Slider Link">
                    </div>
                    <div class="form-group">
                        <lable>Slider Background Colour</lable>
                        <input type="text" class="form-control form-control-user border-primary edit_input"
                            id="edit_slider_bg" name="slider_bg" placeholder="Enter Slider Background Color">
                    </div>
                    <div class="form-group">
                        <lable>Slider Position</lable>
                        <select name="slider_position" id="edit_slider_position" class="form-control form-control-user">
                            <option disabled selected>select</option>
                            <option value="1">1</option>
                            <option value="2">2</option>
                            <option value="3">3</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <lable>Slider Image</lable>
                        <input type="file" class="form-control form-control-user" id="edit_slider_image"
                            name="slider_img" placeholder="Enter Slider Link">
                    </div>

                </form>
            </div>
            <div class="modal-footer ">
                <div class="form-row mt-3 mx-auto">
                    <div class="form-group text-center">
                        <span id="edit_show_error" style="display: none;" class="m-auto"></span>
                    </div>
                </div>
            </div>
            <!-- Modal footer -->
            <div class="modal-footer">
                <span id="visitor_error_area" style="display: none;" class="m-auto"></span>
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                <button type="button" id="btnUpdate" onclick="SliderUpdate()" class="btn btn-primary">Update</button>
            </div>
        </div>
    </div>
</div>


<script src="{{url('public/plugins/jquery/jquery.min.js')}}"></script>
<link href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.13/css/select2.min.css" rel="stylesheet">
<script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.13/js/select2.min.js"></script>

<style>
.w-auto>img {
    width: 72px;

}
</style>
<script type="text/javascript">
var base_url = "{{url('/')}}";
$(function() {

    var DataTable = $("#DataTable").DataTable({
        "processing": true,
        "serverSide": true,
        ajax: {
            url: "{{route('Admin-Slider-Show')}}",
            // data: {
            //   client_id: ""
            // }
        },
        columns: [{
                data: 'slider_id',
                'searchable': false,
                'orderable': false,
                'class': 'text-center'
            },
            {
                data: 'slider_heading',
                'searchable': true,
                'orderable': false,
                'class': 'text-center'
            },
            {
                data: 'slider_caption',
                'searchable': true,
                'orderable': false,
                'class': 'text-center'
            },
            {
                data: 'slider_img',
                render: function(data) {
                    if (data != "") {
                        var img = '<img src="' + base_url + '/public/Files/Main-Slider/' +
                            data + '"  >';
                        return img;
                    } else {
                        var img = '';
                        return img;
                    }
                },
                'searchable': true,
                'orderable': false,
                'class': 'text-center w-auto'
            },
            {
                data: 'action',
                'searchable': false,
                'orderable': false,
                'class': 'text-center'
            }
        ]
    });

    $("#department_supervised_by").select2({
        theme: "classic",
        // width: 'resolve'
    });

});

function SliderStore() {
    if ($("#slider_position option:selected").text() == 'Select') {
        $("#show_error").removeClass().html('').show();
        $("#show_error").addClass("alert alert-danger").html('The slider position is required.');
        return false;
    } else {
        $("#show_error").removeClass().html('').hide();
    }

    var fields = $("input[class*='required']");
    for (let i = 0; i <= fields.length; i++) {
        if ($(fields[i]).val() === '') {
            var currentElement = $(fields[i]).attr('id');
            var value = currentElement.replaceAll('_', ' ');
            $("#show_error").removeClass().html('');
            $("#show_error").show().addClass('alert alert-danger').html('The ' + value + ' field is required.');
            return false;
        } else {
            $("#show_error").hide().removeClass().html('');
        }
    }

    $("#btnSubmit").prop("disabled", true);
    let form_data = document.getElementById("SliderStoreForm");
    let new_data = new FormData(form_data);
    $.ajax({
        type: "POST",
        url: "{{route('Admin-Slider-Store')}}",
        data: new_data,
        processData: false,
        contentType: false,
        error: function(jqXHR, textStatus, errorThrown) {
            $("#btnSubmit").prop("disabled", false);
            $("#show_error").removeClass().html('').show();
            $("#show_error").addClass("alert alert-danger").html(errorThrown);
            return false;
        },
        success: function(data) {
            $("#btnSubmit").prop("disabled", false);
            console.log(data);
            // return false;
            if (data["success"] == true) {
                $("#show_error").removeClass().html('').show();
                $("#show_error").addClass("alert alert-success").html(data['message']);
                setTimeout(() => {
                    $("#SliderStoreModal").modal('hide');
                    $("#show_error").removeClass().html('').hide();
                    $("#SliderStoreForm")[0].reset();
                    DataTable = $("#DataTable").dataTable();
                    DataTable.fnPageChange('first', 1);
                }, 2000);
            } else {
                $("#show_error").removeClass().html('').show();
                $("#show_error").addClass("alert alert-danger").html(data['message'][0]);
                return false;
            }
        }
    });
}

function SliderEdit(slider_id) {
    var url_edit = base_url + "/Admin/Slider-" + slider_id + "-Edit";
    // console.log("# "+url_edit);return false;
    $.get(url_edit, function(data) {
        $("#slider_id").val(data[0]['slider_id']);
        $("#edit_slider_heading").val(data[0]['slider_heading']);
        $("#edit_slider_caption").val(data[0]['slider_caption']);
        $("#edit_link").val(data[0]['link']);
        $("#edit_slider_bg").val(data[0]['slider_bg']);
        $("#SliderEditModal").modal('show');
    });
}

function SliderUpdate() {
    var fields = $("input[class*='edit_input']");
    // console.log(fields.val());
    for (let i = 0; i <= fields.length; i++) {
        // console.log(fields);
        if ($(fields[i]).val() === '') {
            var currentElement = $(fields[i]).attr('name');
            var value = currentElement.replaceAll('_', ' ');
            $("#edit_show_error").removeClass().html('');
            $("#edit_show_error").show().addClass('alert alert-danger').html('The ' + value +
                ' field is required.');
            return false;
        } else {
            $("#edit_show_error").hide().removeClass().html('');
        }
    }

    $("#btnUpdate").prop("disabled", true);

    let form_data = document.getElementById("SliderEditForm");
    let new_data = new FormData(form_data);
    $.ajax({
        type: "POST",
        url: "{{route('Admin-Slider-Update')}}",
        data: new_data,
        processData: false,
        contentType: false,
        error: function(jqXHR, textStatus, errorThrown) {
            $("#btnUpdate").prop("disabled", false);
            $("#edit_show_error").removeClass().html('').show();
            $("#edit_show_error").addClass("alert alert-danger").html(errorThrown);
            return false;
        },
        success: function(data) {
            $("#btnUpdate").prop("disabled", false);
            if (data["success"] == true) {
                $("#edit_show_error").removeClass().html('').show();
                $("#edit_show_error").addClass("alert alert-success").html(data['message']);
                setTimeout(() => {
                    $("#SliderEditModal").modal('hide');
                    $("#SliderEditForm")[0].reset();
                    $("#edit_show_error").removeClass().html('').hide();
                    let DataTable = $("#DataTable").dataTable();
                    DataTable.fnPageChange('first', 1);
                }, 2000);
            } else {
                $("#edit_show_error").removeClass().html('').show();
                $("#edit_show_error").addClass("alert alert-danger").html(data['message'][0]);
                return false;
            }
        }
    });
}

function SliderRemove(slider_id) {
    swal({
        title: "Are you sure?",
        text: "Once deleted, you will not be able to recover this record!",
        icon: "warning",
        buttons: true,
        dangerMode: true,
    }).then((willDelete) => {
        if (willDelete) {
            $.get("{{route('Admin-Slider-Remove')}}", {
                slider_id: slider_id
            }, function(data) {
                if (data['success'] == true) {
                    swal("Poof! Slider has been deleted!", {
                        icon: "success",
                    });
                    let DataTable = $("#DataTable").dataTable();
                    DataTable.fnPageChange('first', 1);
                } else {
                    swal("Oops something went wrong, please check!", {
                        icon: "error",
                    });
                }
            });
        } else {
            swal("Your record is safe!");
        }
    });
}
</script>

@endsection
