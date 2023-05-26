@extends('layout')
@section('content')
<style>
    .request{
        margin-top: 200px;
        margin-left: 30%;
    }
    @media only screen and (min-width: 480px) and (max-width: 767px)
    {

        .request{
            margin-left: 12% !important;
        }
    }
</style>
<div class="Bookrequest">
    <div class="container request">
        <div class="row">
            <div class="col-lg-6 mx-auto card BookReqCard">
                <form id="ContactForm" >
                    @csrf
                    <div class="headeing text-center">
                        <h3>Contact With Us</h3>
                    </div>
                    <div class="form-group">
                        <label for="exampleInputEmail1">Name</label>
                        <input type="text" class="form-control required" id="user_name" name="user_name"
                            placeholder="Enter book name">
                    </div>

                    <div class="form-group">
                        <label for="exampleInputEmail1">Email</label>
                        <input type="text" class="form-control required" id="user_email" name="user_email" value={{Request::get('EMAIL')}}
                            placeholder="Enter email">
                    </div>
                    <div class="form-group">
                        <label for="exampleInputEmail1">Message</label>
                        <textarea name="user_message" id="user_message" cols="30" rows="3"
                            class="form-control required" placeholder="Enter message"></textarea>
                    </div>
                </form>

                <div class="button">
                    <div class="text-center">
                        <div id="show_error"></div>
                    </div>
                    <a href="javascript:void(0)" class="btn-1 text-white" onclick="ContactSend()">Submit</a>
                </div>
            </div>
            <!-- <div class="col-lg-6"></div> -->
        </div>
    </div>
</div>

<script>
function ContactSend() {
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
    $.ajax({
        type: "POST",
        url: "{{route('ContactForm')}}",
        data: $("#ContactForm").serialize(),
        error: function(jqXHR, textStatus, errorThrown) {
            $("#btnSubmit").prop("disabled", false);
            $("#show_error").removeClass().html('').show();
            $("#show_error").addClass("alert alert-danger").html(errorThrown);
            return false;
        },
        success: function(data) {
            $("#btnSubmit").prop("disabled", false);
            // return false;
            if (data["success"] == true) {
                $("#show_error").removeClass().html('').show();
                $("#show_error").addClass("alert alert-success").html(data['message']);
                setTimeout(() => {
                    $("#show_error").removeClass().html('').hide();
                    $("#ContactForm")[0].reset();
                    window.location.href = "{{url('/')}}";
                }, 2000);
            } else {
                $("#show_error").removeClass().html('').show();
                $("#show_error").addClass("alert alert-danger").html(data['message'][0]);
                return false;
            }
        }
    });
}
</script>
@endsection
