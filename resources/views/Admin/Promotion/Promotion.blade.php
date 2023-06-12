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
.modal{
    overflow: auto!important;
}

</style>
        <div class="row">
            <div class="col-lg-12 mb-2">
                <div class="card shadow">
                    <div class="card-body">
                        <div class="row no-gutters align-items-center">
                            <div class="col mr-2">
                                <div class="h5 mb-0 font-weight-bold text-gray-800">Promotion</div>
                            </div>
                            <div class="col-auto">
                                <button type="button" class="btn btn-primary" data-toggle="modal"
                                    data-target="#PromotionStoreModal" id="AddBtn">Add</button>
                                {{-- Form Modal --}}
                                <div class="modal fade" id="PromotionStoreModal">
                                    <div class="modal-dialog modal-dialog-centered">
                                        <div class="modal-content border-primary">
                                            <!-- Modal Header -->
                                            <div class="modal-header">
                                                <h4 class="modal-title">Add Promotion</h4>
                                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                                            </div>
                                            <!-- Modal body -->
                                            <div class="modal-body">
                                                <form id="PromotionStoreForm">
                                                    @csrf
                                                    <input type="hidden" id="promo_id" name="promo_id">
                                                    <div class="form-group">
                                                        <label>Category</label>
                                                        <select class="form-control select2" name="category_id"
                                                            id="category_id" style="width:100%;">
                                                            <option selected disabled>Select</option>
                                                            @foreach ($Categories as $Category)
                                                                <option value="{{ $Category->category_id }}">
                                                                    {{ $Category->category_name }}</option>
                                                            @endforeach
                                                        </select>
                                                    </div>
                                                    {{-- <button type="button" onclick="$('#sub_cat_id').val(2)">Test</button> --}}
                                                    <div class="form-group" onclick="SelectErr()">
                                                        <label>Sub Category</label>
                                                        <select class="form-control select2" name="sub_cat_id"
                                                            id="sub_cat_id" style="width:100%;" disabled>
                                                            <option selected disabled>Select</option>
                                                            @foreach ($SubCategories as $SubCategory)
                                                                <option value="{{ $SubCategory->sub_cat_id }}">
                                                                    {{ $SubCategory->sub_cat_name }}
                                                                </option>
                                                            @endforeach
                                                        </select>
                                                    </div>

                                                    <div class="form-group">
                                                        <label>Promotion Image</label>
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

                                                </form>
                                            </div>
                                            <!-- Modal footer -->
                                            <div class="modal-footer">
                                                <span id="error" style="display: none;" class="m-auto"></span>
                                                <button type="button" class="btn btn-secondary"
                                                    data-dismiss="modal">Close</button>
                                                <button type="button" id="btnSubmit" onclick="PromotionStore()"
                                                    class="btn btn-primary">Submit</button>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                {{-- Cropper Modal --}}
                                <div class="modal fade" data-backdrop="static" data-keyboard="false"  id="Cropper" tabindex="-1" role="dialog"
                                    aria-labelledby="modalLabel" aria-hidden="true">
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
                                                            {{-- <div id="image_id" style="width: 100%; height:200px; background-color: grey; background-repeat: no-repeat;background-size: contain;background-position: center;"> --}}
                                                            {{-- </div> --}}
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="modal-footer">
                                                <button type="button" class="btn btn-secondary"
                                                    data-dismiss="modal">Cancel</button>
                                                <button type="button" class="btn btn-primary" id="crop">Crop</button>
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
            <h6 class="m-0 font-weight-bold text-primary">Promotion List</h6>
        </div> --}}
            <div class="card-body">
                <div class="table-responsive">
                    <table id="DataTable" class="table table-bordered" width="100%" cellspacing="0">
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>Promotion Image</th>
                                <th>Category</th>
                                <th>Sub Category</th>
                                <th>Action</th>
                            </tr>
                        </thead>
                    </table>
                </div>
            </div>
        </div>
    </div>



    {{-- <style>
.w-25>img {
    width: 50px;
}
</style> --}}
    <script src="https://cdnjs.cloudflare.com/ajax/libs/croppie/2.6.5/croppie.min.js"></script>
    <script>
        // $("#PromotionStoreModal").on('hidden.bs.modal',function () { $('.modal-backdrop').hide() })
        var croppedimg = "";


        var $modal = $('#Cropper');
        var image = document.getElementById('image');
        var cropper;

        $("body").on("change", ".cropper", function(e) {

            //Define file reader and uncropped file
            var reader =  new FileReader();
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
            cropper = new Cropper(image,{

                viewMode: 1,
                zoomable: false,
            });
            }).on('hidden.bs.modal', function() {
            cropper.destroy();
            cropper = null;
        });

        $("#crop").click(function() {
            $("#image_preview").show();
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

        });

        $("#AddBtn").click(function() {
            $('#PromotionStoreForm')[0].reset();
            $('#promo_id').val('');
            $("#error").removeClass().html('').hide();
            $("#image_preview").hide();
        });

        function SelectErr() {
            if ($("#sub_cat_id").prop("disabled")) {
                alertmsg("Please Select the Category first", "danger")
            }
        }

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
                    url: "{{ route('PromotionShow') }}"
                },
                columns: [{
                        data: 'promotion_id'
                    },
                    {
                        data: 'promotion_attachment',
                        render: function(data) {
                            return `<center><img src="{{ url('public/Files/Promotion') }}/${data}"  onerror="this.onerror=null;this.src='{{ url('public/imgerror.png') }}';" style="height: 100px; width:auto; margin-auto"></center>`;

                        }
                    },
                    {
                        data: 'category.category_name',
                        'searchable': true,
                        'orderable': true,
                        'class': 'text-center'
                    },
                    {
                        data: 'subcategory.sub_cat_name',
                        'searchable': false,
                        'orderable': false,
                        'class': 'text-center'
                    },

                    {
                        data: 'action',
                    }
                ]

            });

        }

   $("#category_id").change(function(event) {
            var idCategory = this.value;
            $("#sub_cat_id").html(' <option value="" selected>Select SubCategory</option> ');
            $("#sub_cat_id").attr("disabled", false)

            $.ajax({
                type: "GET",
                url: "{{ route('FetchSubCategory') }}",
                dataType: 'json',
                data: {
                    category_id: idCategory
                },
                success: function(response) {
                    $.each(response.data, function(index, val) {
                        console.log(val);
                        $("#sub_cat_id").append('<option value="' + val.sub_cat_id + '">' + val
                            .sub_cat_name + '</option>')
                    });
                }

            });

        });

        function PromotionStore() {

            let slider_form_data = document.getElementById("PromotionStoreForm");
            console.log(slider_form_data);
            let form_data = new FormData(slider_form_data);

            form_data.append('promotion_attachment', croppedimg);

            $("#btnSubmit").prop("disabled", true);

            $.ajax({
                type: "POST",
                url: "{{ route('PromotionStore') }}",
                data: form_data,
                processData: false,
                contentType: false,
                success: (res) => {
                    $("#btnSubmit").prop("disabled", false);
                    if (res.success) {
                        $("#btnSubmit").prop("disabled", false);
                        alertmsg(res.message, "success");
                        GetData();
                        $("#PromotionStoreModal").modal('hide');
                        $('#PromotionStoreForm')[0].reset();

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
            // });
        }

        function PromotionEdit(id) {
            $("#image_preview").show();
            $("#PromotionStoreModal").modal('show');
            $("#sub_cat_id").val("");

            $.get("{{ route('PromotionEdit') }}", {
                id: id
            }, function(data) {
                var d = data.data[0];
                $("#promo_id").val(d['promotion_id']);
                $("#category_id").val(d['category_id']);
                $("#image_preview").css("background-image",
                `url('{{ url('public/Files/Promotion') }}/${d['promotion_attachment']}`);
             if(d['sub_cat_id']){
                GetCategory ({value: d['category_id']}).then(()=>{
                    $("#sub_cat_id").val(d['sub_cat_id']);
                });
             }



            })}

        function PromotionRemove(id) {
            swal({
                    title: "Are You Sure?",
                    text: "Once Deleted You will not be able to recover this file",
                    icon: "warning",
                    buttons: true,
                    dangerMode: true,

                })
                .then((willDelete) => {
                    if (willDelete) {
                        $.get("{{ route('PromotionRemove') }}", {
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
    </script>
@endsection
