<!-- Feedback Modal -->
<style>
    .star-box {
        padding: 10px 0;
        background: rgb(255, 255, 255);
        border: 1px solid #ccc;
        margin-bottom: 30px;
    }

    .text-area .form-group textarea {
        background: rgb(255, 255, 255);
        border: 1px solid #ccc;
    }

    .star-box i {
        font-size: 55px;
        color: rgb(17, 17, 17);
        margin: 12px;
        font-weight: 100;
    }

    .rate:not(:checked)>input {
        position: absolute;
        top: -9999px;
    }

    .rate:not(:checked)>label {
        float: right;
        width: 1em;
        overflow: hidden;
        white-space: nowrap;
        cursor: pointer;
        font-size: 60px;
        color: #ccc;
    }

    .rate:not(:checked)>label:before {
        content: '★ ';
    }

    .rate>input:checked~label {
        color: #ffc700;
    }

    .rate:not(:checked)>label:hover,
    .rate:not(:checked)>label:hover~label {
        color: #deb217;
    }

    .rate>input:checked+label:hover,
    .rate>input:checked+label:hover~label,
    .rate>input:checked~label:hover,
    .rate>input:checked~label:hover~label,
    .rate>label:hover~input:checked~label {
        color: #c59b08;
    }

    .btn-groups {
        padding: 10px 0px;
        margin-top: 30px;
    }

    .text-grey {
        color: grey !important;
    }
    </style>
    <script src="{{url('public/web/assets/js/bootstrap.min.js')}}"></script>
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

    <div class="modal fade" id="RatingModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
        aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-body">
                    <div class="heading-section">
                        <h3>Give Rating To This Book</h3>
                    </div>
                    <form id="RatingForm">
                        @csrf
                        <input type="hidden" name="book_id" id="book_id" value="{{$BookDetail->file_id ?? ''}}">
                        {{-- @php
                            dd($BookDetail)
                        @endphp --}}
                        <div class="startbox">
                            <div class="d-flex justify-content-center w-100 star-box">
                                <div class="rate">
                                    <input type="radio" id="star5" name="rate" class="star" value="5" />
                                    <label for="star5" title="text">5 stars</label>
                                    <input type="radio" id="star4" name="rate" class="star" value="4" />
                                    <label for="star4" title="text">4 stars</label>
                                    <input type="radio" id="star3" name="rate" class="star" value="3" />
                                    <label for="star3" title="text">3 stars</label>
                                    <input type="radio" id="star2" name="rate" class="star" value="2" />
                                    <label for="star2" title="text">2 stars</label>
                                    <input type="radio" id="star1" name="rate" class="star" value="1" />
                                    <label for="star1" title="text">1 star</label>
                                </div>
                            </div>
                        </div>
                        <div class="text-area">
                            <div class="form-group">
                                <label for="exampleFormControlTextarea1">Review</label>
                                <textarea class="form-control text-area-valid" id="review_text" name="review"
                                    rows="4"></textarea>
                                <!-- </div> -->
                            </div>
                    </form>

                    <div class="btn-groups">
                        <div class="d-flex justify-content-between">
                            <div class="rating-text">
                                <!-- <p>give your rating</p> -->
                            </div>
                            <div class="button">
                                <button type="button" class="btn btn-primary" onclick="RatingStore()">Send Rating</button>
                            </div>
                        </div>
                    </div>
                </div>
                <div id="show"></div>
                <div class="error text-center mx-3">
                    <div id="Rating__Erorr"></div>
                </div>
            </div>
        </div>
    </div>
    </div>
    <!-- Feedback Modal -->

    <script>
    function RatingStore() {

        var field = $("#review").val();
        if (field == '') {
            $("#Rating__Erorr").removeClass().html('');
            $("#Rating__Erorr").show().addClass('alert alert-danger').html('The review field is required.');
            return false;
        } else {
            $("#Rating__Erorr").hide().removeClass().html('');
        }

        $.ajax({
            type: "POST",
            url: "{{route('Rating-Store')}}",
            data: $("#RatingForm").serialize(),
            success: function(data) {
                $("#RatingModal").modal('hide');
                sweatalert();
                return false;
            }
        })
    }

    function sweatalert() {
        $(document).ready(function() {
            swal("Thank you!", "Thanks for feedback!", "success");
        });
    }
    </script>
