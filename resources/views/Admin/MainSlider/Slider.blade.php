@extends('Admin.AdminLayout')

@section('content')
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/croppie/2.6.5/croppie.css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.4.1/css/bootstrap.min.css">
    </script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/cropperjs/1.5.6/cropper.css" />
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/cropperjs/1.5.6/cropper.js"></script>
    <div class="container-fluid">
        <!-- Page Heading -->
        <style>
            .modal {
                overflow: auto !important;
            }
        </style>
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
                                        data-target="#SliderStoreModal" id="AddBtn">Add</button>

                                    <div class="modal fade" id="SliderStoreModal">
                                        <div class="modal-dialog modal-dialog-centered">
                                            <div class="modal-content">
                                                <!-- Modal Header -->
                                                <div class="modal-header">
                                                    <h4 class="modal-title">Add Slider</h4>
                                                    <button type="button" class="close"
                                                        data-dismiss="modal">&times;</button>
                                                </div>
                                                <!-- Modal body -->
                                                <div class="modal-body">
                                                    <form id="SliderStoreForm" enctype="multipart/form-data">
                                                        @csrf
                                                        <input type="hidden" id="slider_id" name="slider_id">
                                                        <div class="form-group">
                                                            <lable>Heading</lable>
                                                            <input type="text"
                                                                class="form-control form-control-user required "
                                                                id="slider_heading" name="slider_heading"
                                                                placeholder="Enter Slider Heading">
                                                        </div>
                                                        <div class="form-group">
                                                            <lable>Caption</lable>
                                                            <input type="text"
                                                                class="form-control form-control-user required "
                                                                id="slider_caption" name="slider_caption"
                                                                placeholder="Enter Slider Caption">
                                                        </div>

                                                        <div class="form-group">
                                                            <lable>Slider Background Colour</lable>
                                                            <input type="color"
                                                                class="form-control form-control-user required "
                                                                id="slider_bg_color" name="slider_bg_color"
                                                                placeholder="Enter Slider Background Color">
                                                        </div>
                                                        <div class="form-group">
                                                            <lable>Slider Position</lable>
                                                            <select name="slider_position" id="slider_position"
                                                                class="form-control form-control-user">
                                                                <option selected value="1">1</option>
                                                                <option value="2">2</option>
                                                                <option value="3">3</option>
                                                            </select>
                                                        </div>
                                                        {{-- //Cropper input --}}

                                                        <div class="form-group">
                                                            <label>Slider Image</label>
                                                            <input style="width:100%;" type="file" name="image"
                                                                class="cropper">
                                                        </div>
                                                        <div id="image_preview"
                                                            style="width: 100%;
                                                                    height: 200px;
                                                                    background-color: grey;
                                                                    background-repeat: no-repeat;
                                                                    background-size: contain;
                                                                    background-position: center center;
                                                            ">
                                                        </div>
                                                        {{-- //Cropper input Close --}}
                                                        {{-- <div class="row">
                                                        <div class="col-md-12">
                                                            <div class="form-group">
                                                                <div id="image_id" style="width: 100%; height:200px; background-color: grey; background-repeat: no-repeat;background-size: contain;background-position: center;">
                                                                </div>
                                                            </div>
                                                        </div>

                                                    </div> --}}
                                                    </form>
                                                </div>
                                                <!-- <div class="form-group text-center">
                                                    <span id="show_error" style="display: none;" class="m-auto"></span>
                                                </div> -->
                                                <!-- Modal footer -->
                                                <div class="modal-footer">
                                                    <span id="error" style="display: none;" class="m-auto"></span>
                                                    <button type="button" class="btn btn-secondary"
                                                        data-dismiss="modal">Close</button>
                                                    <button type="button" id="btnSubmit" onclick="SliderStore()"
                                                        class="btn btn-primary">Submit</button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    {{-- Cropper Modal --}}
                                    <div class="modal fade" data-backdrop="static" data-keyboard="false" id="Cropper"
                                        tabindex="-1" role="dialog" aria-labelledby="modalLabel" aria-hidden="true">
                                        <div class="modal-dialog modal-lg" role="document">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <h5 class="modal-title" id="modalLabel">How to crop image before upload
                                                        image in laravel 9 - Techsolutionstuff</h5>
                                                    <button type="button" class="close" data-dismiss="modal"
                                                        aria-label="Close">
                                                        <span aria-hidden="true">×</span>
                                                    </button>
                                                </div>
                                                <div class="modal-body">
                                                    <div class="img-container">
                                                        <div class="row">
                                                            <img id="image">
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="modal-footer">
                                                    <button type="button" class="btn btn-secondary"
                                                        data-dismiss="modal">Cancel</button>
                                                    <button type="button" class="btn btn-primary"
                                                        id="crop">Crop</button>
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
                {{-- <div class="card-header py-3">
                <h6 class="m-0 font-weight-bold">Slider List</h6>
            </div> --}}
                <div class="card-body">
                    <div class="table-responsive">
                        <table id="DataTable" class="table table-bordered" width="100%" cellspacing="0">
                            <thead>
                                <tr>
                                    <th>UID</th>
                                    <th>Image</th>
                                    <th>Caption</th>
                                    <th>Heading</th>
                                    <th>Action</th>
                                </tr>
                            </thead>
                        </table>
                    </div>
                </div>
            </div>
        </div>

        {{-- <link href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.13/css/select2.min.css" rel="stylesheet">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.13/js/select2.min.js"></script> --}}

        <style>
            .w-auto>img {
                width: 72px;

            }
        </style>
        <script>
            var croppedimg = "";


            var $modal = $('#Cropper');
            var image = document.getElementById('image');
            var cropper;

            $("body").on("change", ".cropper", function(e) {

                //Define file reader and uncropped file
                var reader = new FileReader();
                var file = e.target.files[0];

                //Execute when file is converted to url
                var done = function(url) {
                    image.src = url;
                    $modal.modal('show');
                };

                if (URL) {
                    done(URL.createObjectURL(file));
                } else if (FileReader) {
                    reader.onload = function(e) {
                        done(reader.result);
                    };
                    reader.readAsDataURL(file);
                }

            });

            $modal.on('shown.bs.modal', function() {
                cropper = new Cropper(image, {

                    viewMode: 1,
                    zoomable: false,
                });
            }).on('hidden.bs.modal', function() {
                cropper.destroy();
                cropper = null;
            });

            $("#crop").click(function() {
                canvas = cropper.getCroppedCanvas({
                    minWidth: 256,
                    minHeight: 256,
                    maxWidth: 4096,
                    maxHeight: 4096,
                    imageSmoothingEnabled: true,
                    imageSmoothingQuality: 'high',
                });
                canvas.toBlob(function(blob) {
                    url = URL.createObjectURL(blob);
                    var reader = new FileReader();
                    reader.readAsDataURL(blob);
                    reader.onloadend = function() {
                        var base64data = reader.result;

                        var data = {
                            '_token': $('meta[name="_token"]').attr('content'),
                            'image': base64data
                        };
                        croppedimg = base64data
                        $('#image_preview').css('background-image', `url(${base64data})`);
                        // $('#Cropper').hide()
                        $modal.modal('hide');
                    }
                });
            });
            $(function() {
                GetData();
                // $('#image_id').hide();
            });

            $("#AddBtn").click(function() {
                $('#SliderStoreForm')[0].reset();
                $("#slider_id").val('');
                $("#error").removeClass().html('').hide();
                $("#image_preview").hide('');
            });

            function GetData() {

                $("#DataTable").DataTable().destroy();
                var DataTable = $("#DataTable").DataTable({
                    "processing": true,
                    "serverSide": true,
                    dom: '<"top"<"left-col"B><"right-col"f>>r<"table table-striped"t>ip',
                    lengthMenu: [
                        [10, 25, 50, -1],
                        ['10 rows', '25 rows', '50 rows', 'Show all']
                    ],
                    "responsive": true,
                    buttons: ['pageLength'],
                    ajax: {
                        url: "{{ route('SliderShow') }}"
                    },
                    columns: [{
                            data: 'id',
                            'searchable': false,
                            'orderable': false,
                            'class': 'text-center'
                        },
                        {
                            data: 'slider_image',

                            render: function(data) {
                                return '<center><img src="{{ url('public/Slider') }}/' + data +
                                    '" style="height: 100px; width:auto; margin-auto"></center>';
                            }
                        },
                        {
                            data: 'slider_caption',
                            'searchable': true,
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
                            data: 'Action'
                        }
                    ]
                });
            }

            function SliderStore() {

                let slider_form_data = document.getElementById("SliderStoreForm");
                let form_data = new FormData(slider_form_data);

                form_data.append('promotion_attachment', croppedimg);

                $("#btnSubmit").prop("disabled", true);

                $.ajax({
                    type: "POST",
                    url: "{{ route('SliderStore') }}",
                    data: form_data,
                    processData: false,
                    contentType: false,
                    success: (res) => {
                        $("#btnSubmit").prop("disabled", false);
                        if (res.success) {
                            alertmsg(res.message, "success");
                            GetData();
                            $("#SliderStoreModal").modal('hide');
                            $('#SliderStoreForm')[0].reset();

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

            function SliderEdit(id) {
                $("#image_preview").show();
                // $('#SliderStoreForm')[0].reset();
                $.get("{{ route('SliderEdit') }}", {
                    id: id
                }, function(data) {
                    $("#slider_id").val(data.data[0]['id']);
                    $("#slider_heading").val(data.data[0]['slider_heading']);
                    $("#slider_caption").val(data.data[0]['slider_caption']);
                    $("#slider_link").val(data.data[0]['slider_link']);
                    $("#slider_bg_color").val(data.data[0]['slider_bg_color']);
                    $("#slider_position").val(data.data[0]['slider_position']);
                    $("#image_preview").css("background-image",
                        `url('{{ url('public/Slider') }}/${data.data[0]['slider_image']}`);
                })
            }

            function SliderRemove(id) {
                swal({
                        title: "Are You Sure?",
                        text: "Once Deleted You will not be able to recover this file",
                        icon: "warning",
                        buttons: true,
                        dangerMode: true,

                    })
                    .then((willDelete) => {
                        if (willDelete) {
                            $.get("{{ route('SliderRemove') }}", {
                                id: id
                            }, function(res) {
                                if (res['success']) {
                                    swal({
                                        title: "Successful...",
                                        text: res.message,
                                        icon: "success"
                                    })
                                    GetData();
                                }
                            });
                        }
                    });
            }
            $('#slider_image').on('change', (e) => {
                $('#image_id').show();
                $('#image_id').css({
                    'background-image': ``
                });
                const reader = new FileReader();
                const file = e.target.files[0];
                if (!file.type.match('image.*')) {
                    swal("Warning", "Please select an image file.", "warning");
                    return $('#slider_image').val('');
                }
                reader.onload = function(e) {
                    // $('#imageid').css({'background-image': ``});
                    $('#image_id').css('background-image', `url(${e.target.result})`);
                };
                reader.readAsDataURL(file);
            });
        </script>
    @endsection
