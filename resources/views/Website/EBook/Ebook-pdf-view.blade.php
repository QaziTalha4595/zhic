<link rel="stylesheet" type="text/css" href="{{url('public/flipbook/deploy/css/flipbook.style.css')}}">
<link rel="stylesheet" type="text/css" href="{{url('public/flipbook/deploy/css/font-awesome.css')}}">
<link rel="stylesheet" href="{{url('public/web/assets/css/boostrap.min.css')}}">

<script src="{{url('public/plugins/jquery/jquery.min.js')}}"></script>
<script src="{{url('public/flipbook/deploy/js/flipbook.min.js')}}"></script>
<script src="{{url('public/web/assets/js/bootstrap.min.js')}}"></script>
<!-- <script src="{{url('public/flipbook/deploy/js/flipbook.book3.min.js')}}"></script> -->

<script type="text/javascript">
// console.log(book_url);
$(document).ready(function() {
    var book = $("#book1").flipBook({
        // public\Files\E-Book\02368975141224.pdf
        pdfUrl: "{{url('public/Files/E-Book/02368975141224.pdf')}}",
        // rightToLeft: lang,
        // layout: 4,
        // btnColor: "#CCC",
        // menu2Transparent: true,
        // sideNavigationButtons: false,
        // skin: "light",
        // icons: 'material',
        currentPage: {
            enabled: true,
            title: "Current page",
            vAlign: 'top',
            hAlign: 'left',
            marginH: 0,
            marginV: 0,
            color: '',
            background: ''
        },
        // pageTextureSize:{
        //   // default : 2048,
        // },
        responsiveViewTreshold: 480,
        // options.sideNavigationButtons [false],
        btnSound: {
            enabled: false,
            title: "Volume",
            icon: "fa-volume-up",
            iconAlt: "fa-volume-off",
            icon2: "volume_up",
            iconAlt2: "volume_mute",
            hideOnMobile: true
        },
        btnDownloadPdf: {
            forceDownload: false,
            enabled: false,
            url: null,
            openInNewWindow: false,
            name: "allPages.pdf"
        },
        btnAutoplay: {
            enabled: false
        },
        btnSelect: {
            enabled: false
        },
        btnShare: {
            enabled: false
        },
        btnPrint: {
            enabled: false
        },
        btnDownloadPages: {
            enabled: false
        },
    });

    $(book).bind("pagechange", function(e) {
        var total_page = e.target.options.pages.length - 1
        var last_page = e['page'].split('-').slice(-1)[0];

        if (total_page == last_page) {
            $("#RatingModal").modal('show')
        }
    })

});

function Duration(unique_id) {
    setInterval(function() {
        $.ajax({
            type: "GET",
            url: "{{route('Admin-Count-Duration')}}",
            data: {
                unique_id: unique_id
            },
            success: function(data) {
                // console.log(data);
            }
        })
    }, 20000);
}

Duration("{{$unique_id}}");
</script>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ZHIC</title>
</head>

<body>
    {{-- <button style="position: absolute; z-index:10; float:right;" type="button" class="btn btn-primary" data-toggle="modal" data-target="#RatingModal">Add</button> --}}

    <div class="container-fluid">
        <div class="row ">
            <!-- <div class="col-md-12"> -->
            <div id="book1">
            </div>
            <div id="Modal-Body">
                @include('Feedback.Feedback')
            </div>
            <!-- </div> -->
        </div>
    </div>
</body>

</html>
