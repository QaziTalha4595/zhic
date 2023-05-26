<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Test</title>
    <link href="{{url('public\web\assets\css\boostrap.min.css')}}" rel=stylesheet type=text/css>

    <style>
        a{
            padding: 0px 10px;
            border-right: solid black 1px;
        }
        .header{
            height: 100px;
        }
        @media (min-width: 490px) and (max-width: 670px){
            a{
                font-size: 2vw;
            }
        }
    </style>
</head>
<body>
        <header >
            <div class="row header">
                <div class="col-lg-6 align-middle d-flex justify-content-center" >
                    <img class="img-thumbnail mr-4" src="{{url('public\Logo-header-ENg.png')}}" style="float: right; width: 65%; height: auto; ">
                </div>
                <div class="col-lg-6 d-flex justify-content-center">
                    <div style="margin-top: 10px">

                    <a >Apply Now</a>
                    <a>Continuous Education Center</a>
                    <a style="font-size: large; padding:0px; border:none;">A</a>
                    <a style="font-size: meduim; padding:0px; border:none;">A</a>
                    <a style="font-size: small; padding-left:0px;">A</a>
                    <a >English</a>
                </div>
                </div>
            </div>
        </header>


    <script src="{{ url('public\web\assets\js\bootstrap.min.js') }}"></script>

</body>
</html>

