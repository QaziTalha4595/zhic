<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>{{ config('app.name') }}</title>
    <!-- Tell the browser to be responsive to screen width -->
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Font Awesome -->
    <link rel="stylesheet" href="{{url('public/Admin/plugins/fontawesome-free/css/all.min.css')}}">
    <!-- Ionicons -->
    <link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
    <!-- icheck bootstrap -->
    <link rel="stylesheet" href="{{url('public/Admin/plugins/icheck-bootstrap/icheck-bootstrap.min.css')}}">
    <!-- Theme style -->
    <link rel="stylesheet" href="{{url('public/Admin/dist/css/adminlte.min.css')}}">
    <!-- Google Font: Source Sans Pro -->
    <!-- SweetAlert2 -->
    <link rel="stylesheet" href="{{url('public/Admin/plugins/sweetalert2-theme-bootstrap-4/bootstrap-4.min.css')}}">
    <!-- Toastr -->
    <link rel="stylesheet" href="{{url('public/Admin/plugins/toastr/toastr.min.css')}}">
    <link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700" rel="stylesheet">
</head>

<body class="hold-transition login-page">

    <div class="login-box">
        <div class="login-logo"> <b>ZHIC</b> </div>
        <div class="card">
            <div class="card-body login-card-body">
                <p class="login-box-msg">Login to start your session</p>
                <form id="loginForm">
                    @csrf
                    <div class="input-group mb-3">
                        <input type="email" name="user_email" class="form-control required"
                            placeholder="Email">
                        <div class="input-group-append">
                            <div class="input-group-text"> <span class="fas fa-envelope"></span> </div>
                        </div>
                    </div>
                    <div class="input-group mb-3">
                        <input type="password" name="user_password" class="form-control required"
                            placeholder="Password">
                        <div class="input-group-append">
                            <div class="input-group-text"> <span class="fas fa-lock"></span> </div>
                        </div>
                    </div>
                </form>
                <div class="row my-2">
                    <div class="col-md-12 m-auto ">
                        <div id="show_error" class="" style="display:none;"></div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-4 m-auto">
                        <button type="button" class="btn btn-block btn-primary text-white" id="LoginBtn">Sign
                            In</button>
                    </div>
                </div>

                <div class="row">
                    <div class="col-12">
                        <div style="margin-top: 15px;" id="response"></div>
                        <div id="success" class="alert alert-success text-center" style="display: none;">Login
                            Successfull</div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script src="{{url('public/Admin/plugins/jquery/jquery.min.js')}}"></script>
    <!-- //sweet Alert -->
    <script src="{{url('public/Admin/plugins/sweetalert2/sweetalert2.min.js')}}"></script>
    <!-- Sweet Aleert Toast -->
    <script src="{{url('public/Admin/plugins/toastr/toastr.min.js')}}"></script>
    <script src="{{url('public/Admin/plugins/bootstrap/js/bootstrap.bundle.min.js')}}"></script>
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

    <script>
        function alertmsg(msg, type) {
            $("#show_error").removeClass().html('').show();
            $("#show_error").addClass(`alert alert-${type} text-center`).html(msg);
            $("#show_error").fadeOut(2000);
        }

    $("#LoginBtn").click(function() {

        $("#LoginBtn").prop("disabled", true);

        $.post("{{route('LoginUser')}}", $('#loginForm').serialize())
        .done((res)=>{
             if(res.success){
                alertmsg(res.message,"success");
                window.location.href = "{{route('Dashboard')}}";
             }else if(res.validation){
                alertmsg(res.message[0], "warning")
             }else{
                alertmsg(res.message, "danger")
             }
            })
        .fail((err)=>{
            alertmsg("Opps Something went wrong", "danger")
        });
        $("#LoginBtn").prop("disabled", false);

    });
    </script>

    <!-- Bootstrap 4 -->
    <script src="{{url('public/Admin/plugins/bootstrap/js/bootstrap.bundle.min.js')}}"></script>
    <!-- AdminLTE App -->
    <script src="{{url('public/Admin/dist/js/adminlte.min.js')}}"></script>
</body>

</html>
