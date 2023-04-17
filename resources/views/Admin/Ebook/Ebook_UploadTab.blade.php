@extends('Admin.AdminLayout')
@section('content')
    <div class="row">
        <div class="col-md-12">
            <div class="card card-default">
                <div class="card-header">
                    <h3 class="card-title">Ebook Detail</h3>
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
                                        <span class="bs-stepper-label">Ebook Basic Detail</span>
                                    </button>
                                </div>
                                <div class="line"></div>
                                <div class="step" data-target="#logins-part">
                                    <button type="button" onclick="EmptyAlert()" class="step-trigger" role="tab"
                                        aria-controls="logins-part" id="logins-part-trigger">
                                        <span class="bs-stepper-circle">2</span>
                                        <span class="bs-stepper-label">Ebook Cover</span>
                                    </button>
                                </div>
                                <div class="line"></div>
                                <div class="step" data-target="#information-part">
                                    <button type="button" onclick="EmptyAlert()" class="step-trigger" role="tab"
                                        aria-controls="information-part" id="information-part-trigger">
                                        <span class="bs-stepper-circle">3</span>
                                        <span class="bs-stepper-label">Ebook Upload</span>
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
                                            href="{{ url('ControlPanel/Ebook-' . $file_id . '-Basic') }}">
                                            <span class="bs-stepper-circle">1</span>
                                            <span class="bs-stepper-label">Ebook Basic Detail</span>
                                        </a>
                                    </button>
                                </div>
                                <div class="line bg-primary"></div>
                                <div class="step" data-target="#logins-part">
                                    <button type="button" class="step-trigger" role="tab" aria-controls="logins-part"
                                        id="logins-part-trigger">
                                        <a class="nav-link active"
                                            href="{{ url('ControlPanel/Ebook-' . $file_id . '-CoverImage') }}">
                                            <span class="bs-stepper-circle">2</span>
                                            <span class="bs-stepper-label">Ebook Cover</span>
                                        </a>
                                    </button>
                                </div>
                                <div class="line bg-primary"></div>
                                <div class="step" data-target="#information-part">
                                    <button type="button" class="step-trigger" role="tab"
                                        aria-controls="information-part" id="information-part-trigger">
                                        <a class="nav-link active"
                                            href="{{ url('ControlPanel/Ebook-' . $file_id . '-Upload') }}">
                                            <span class="bs-stepper-circle">3</span>
                                            <span class="bs-stepper-label">Ebook Upload</span>
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
                            <div class="col-lg-10 mx-auto">
                                <div class="card">
                                    <div class="card-body">
                                        <form id="FileStoreForm">
                                            @csrf
                                            <input type="hidden" name="file_id" value="{{ $file_id }}" />
                                            <div class="row">
                                                <div class="col">
                                                    <div class="form-group">
                                                        <label class="text-bold">Book</label>
                                                        <input type="file"
                                                            class="form-control form-control-user border-primary"
                                                            id="ebook_attachment" name="ebook_attachment" placeholder=""
                                                            accept=".pdf">
                                                        {{ $data->ebook_attachment ?? '' }}
                                                    </div>
                                                </div>
                                                <div class="col">
                                                    <div class="form-group">
                                                        <label class="text-bold">Book Link</label>
                                                        <input type="Text"
                                                            class="form-control form-control-user border-primary"
                                                            id="ebook_link" name="ebook_link"
                                                            placeholder="Enter link here.."
                                                            value="{{ $data->ebook_link }}">
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row">
                                                @if ($data->printable == 1 || $data->downloadable == 1)
                                                    <div class="col">
                                                        <div class="form-group">
                                                            <label class="text-bold">Printable Or Download Book</label>
                                                            <input type="file"
                                                                class="form-control form-control-user border-primary"
                                                                id="printable" name="printable" placeholder=""
                                                                accept=".pdf"
                                                                value="{{ $data->ebook_download_link ?? '' }}">
                                                        </div>
                                                    </div>
                                                    <div class="col">
                                                        <div class="form-group">
                                                            <label class="text-bold">Printable Or Download Link</label>
                                                            <input type="Text"
                                                                class="form-control form-control-user border-primary"
                                                                id="ebook_download_link" name="ebook_download_link"
                                                                value="{{ $data->ebook_download_link ?? '' }}"
                                                                placeholder="Enter link here.." accept="audio/mp3*;>
                                                        </div>
                                                    </div>
                                                @endif
                                            </div>
                                            <div class="form-group">
                                                <label class="text-bold">Book Audio</label>
                                                <input type="file"
                                                    class="form-control form-control-user border-primary" id="ebook_audio"
                                                    name="ebook_audio" placeholder="" accept=".*">
                                                {{ $data->ebook_audio ?? '' }}
                                            </div>
                                        </form>
                                    </div>
                                    <div class="error mx-3 text-center">
                                        <div id="error"></div>
                                    </div>
                                    <div class="card-footer text-center">
                                        <button type="button" id="btnSubmit" onclick="EbookUploadFile()"
                                            class="btn btn-primary">Save</button>
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
        function EbookUploadFile() {
            let form_data = document.getElementById("FileStoreForm");
            let new_data = new FormData(form_data);
            $("#btnSubmit").prop("disabled", true);

            $.ajax({
                type: "POST",
                url: "{{ route('EbookUploadStore') }}",
                data: new_data,
                processData: false,
                contentType: false,
                success: (res) => {

                    $("#btnSubmit").prop("disabled", false);
                    if (res.success) {
                        setTimeout(() => {
                            alertmsg(res.message, "success");
                            $("#btnSubmit").prop("disabled", false);
                            $("#FileStoreForm")[0].reset();
                            DataTable = $("#DataTable").dataTable();
                            DataTable.fnPageChange('first', 1);
                            window.location.href = "{{ route('Ebook') }}";
                        }, 1000);
                    } else if (res.validate) {
                        alertmsg(res.message, "warning");
                    } else {
                        alertmsg(res.message, "danger");
                    }
                },
                error: (err) => {
                    alertmsg("Something went wrong", "danger");
                    $("#btnSubmit").prop("disabled", false);
                }

            });
        }
    </script>
    <!-- Main Script -->
@endsection
