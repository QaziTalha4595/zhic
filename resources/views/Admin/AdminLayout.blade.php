<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <meta name="csrf-token" content="{{ csrf_token() }}">

    <title>zayed house for islamic culture </title>

    <link rel="shortcut icon" type="image/x-icon" href="{{url('public/web/assets/img/logo/main-logo.svg')}}">

    <link rel="stylesheet" href="{{url('public/Admin/plugins/datatables-bs4/css/dataTables.bootstrap4.min.css')}}">
    <link rel="stylesheet" href="{{url('public/Admin/plugins/datatables-responsive/css/responsive.bootstrap4.min.css')}}">
    <link rel="stylesheet" href="{{url('public/Admin/plugins/datatables-buttons/css/buttons.bootstrap4.min.css')}}">
    <!-- Font Awesome Icons -->
    <link rel="stylesheet" href="{{url('public/Admin/plugins/fontawesome-free/css/all.min.css')}}">
    <!-- Theme style -->
    <link rel="stylesheet" href="{{url('public/Admin/dist/css/adminlte.min.css')}}">

    <link rel="stylesheet" href="{{url('public/Admin/plugins/bs-stepper/css/bs-stepper.min.css')}}">
    {{-- Dropzone --}}
    <script src="https://unpkg.com/dropzone@6.0.0-beta.1/dist/dropzone-min.js"></script>
    <link href="https://unpkg.com/dropzone@6.0.0-beta.1/dist/dropzone.css" rel="stylesheet" type="text/css" />
    <!-- Bootstrap CDN -->
    <!-- SweetAlert2 -->
    <link rel="stylesheet" href="{{url('public/Admin/plugins/sweetalert2-theme-bootstrap-4/bootstrap-4.min.css')}}">
    <!-- Toastr -->
    <link rel="stylesheet" href="{{url('public/Admin/plugins/toastr/toastr.min.css')}}">
   <!-- for Croper.js -->
   <!-- for Croper.js -->
    <!-- Google Font: Source Sans Pro -->
    <link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700" rel="stylesheet">
    <script src="{{url('public/Admin/plugins/jquery/jquery.min.js')}}"></script>
    <!--Select2 CSS-->
    <style>
        td.text-center {
            vertical-align: middle;
        }

        .left-col {
            float: left;
            width: 50%;
            padding-bottom: 10px
        }

        .right-col {
            float: left;
            width: 50%;
            padding-bottom: 10px
        }
        .dropdown-menu{
            width: 150px!important;
        }
    </style>
</head>

<body class="hold-transition sidebar-mini">

    <div class="wrapper">

        <nav class="main-header navbar navbar-expand  bg-gradient-primary navbar-dark navbar">
            <!-- Left navbar links -->
            <ul class="navbar-nav">
                <li class="nav-item">
                    <a class="nav-link" data-widget="pushmenu" href="#"><i class="fas fa-bars"></i></a>
                </li>

            </ul>
            <!-- Button trigger modal -->


            <!-- Right navbar links -->
            <ul class="navbar-nav ml-auto">
                <!-- Messages Dropdown Menu -->
                <li class="nav-item dropdown">
                    <!-- <a class="nav-link" data-toggle="dropdown" href="#">
            <span class="badge badge-danger navbar-badge">3</span>
          </a> -->
                    <div class="dropdown-menu dropdown-menu-lg dropdown-menu-right">
                        <a href="#" class="dropdown-item">
                        </a>
                        <div class="dropdown-divider"></div>
                        <a href="#" class="dropdown-item">
                        </a>
                        <div class="dropdown-divider"></div>
                        <a href="#" class="dropdown-item">
                        </a>
                        <div class="dropdown-divider"></div>
                        <a href="#" class="dropdown-item dropdown-footer">See All Messages</a>
                    </div>
                </li>
                <!-- Notifications Dropdown Menu -->
                <li class="nav-item dropdown">
                    <a class="nav-link" data-toggle="dropdown" href="#">
                        <i class="fas fa-user mr-2"></i>
                        <i class="fas fa-angle-down"></i>
                    </a>
                    <div class="dropdown-menu dropdown-menu-sm dropdown-menu-right">
                        <!-- <span class="dropdown-item dropdown-header">Settings</span> -->
                        <!-- <div class="dropdown-divider"></div> -->

                        <a href="#" class="dropdown-item">
                            <i class="fas fa-portrait mr-2"></i>Profile
                            <span class="float-right text-muted text-sm"></span>
                        </a>
                        <a href="{{('Logout')}}" class="dropdown-item">
                            <i class="fas fa-sign-out-alt mr-2"></i> Logout
                            <span class="float-right text-muted text-sm"></span>
                        </a>
                    </div>
                </li>
            </ul>
        </nav>
        <!-- /.navbar -->

        <!-- Main Sidebar Container -->
        <aside class="main-sidebar sidebar-dark-primary elevation-4">
            <!-- Brand Logo -->
            <a href="{{url('Admin/Dashboard')}}" class="brand-link">
                <img src="{{url('public/main-logo.svg')}}" class="brand-image"
                    style="opacity: .8">
                {{-- <span class="brand-text font-weight-light">Admin Panel</span> --}}
            </a>

            <!-- Sidebar -->
            <div class="sidebar">
                <!-- Sidebar user panel (optional) -->
                <div class="user-panel mt-3 pb-3 mb-3 d-flex">
                    <div class="image">
                        <!-- <img src="{{url('public/img/default.jpg')}}" class="img-circle elevation-2" alt="User Image"> -->
                    </div>
                    {{-- <div class="info">
                        <a href="#" class="d-block">Admin Panel</a>
                    </div> --}}
                </div>

                <!-- Sidebar Menu -->
                <nav class="mt-2">
                    <ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu"
                        data-accordion="false">
                        <li class="nav-item main_active ">
                            <a href="{{url('ControlPanel/Dashboard')}}" class="nav-link">
                                <i class="nav-icon fas fa-home"></i>
                                <p>Dashboard</p>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a href="#" class="nav-link {{ Request::is('ControlPanel/Category') }} || {{ Request::is('ControlPanel/SubCategory')}} || {{ Request::is('ControlPanel/ThirdCategory')}} || {{ Request::is('ControlPanel/Language') }} ? 'collapse active':'collapsed'">
                                <i class="nav-icon fas fa-cogs"></i>
                                <p>Category Master<i class="fas fa-angle-left right"></i></p>
                            </a>
                            <ul class="nav nav-treeview">
                                <li class="nav-item main_active ">
                                    <a class="nav-link {{ Request::is('ControlPanel/Category') ? 'active' : '' }}" href="{{url('ControlPanel/Category')}}">
                                        <i class="nav-icon far fa-circle"></i>
                                        <p>Category</p>
                                    </a>
                                </li>
                                <li class="nav-item main_active ">
                                    <a class="nav-link {{ Request::is('ControlPanel/SubCategory') ? 'active' : '' }}" href="{{url('ControlPanel/SubCategory')}}">
                                        <i class="nav-icon far fa-circle"></i>
                                        <p>Sub Category</p>
                                    </a>
                                </li>
                                <li class="nav-item main_active ">
                                    <a class="nav-link {{ Request::is('ControlPanel/ThirdCategory') ? 'active' : '' }}" href="{{url('ControlPanel/ThirdCategory')}}">
                                        <i class="nav-icon far fa-circle"></i>
                                        <p>Third Category</p>
                                    </a>
                                </li>
                                <li class="nav-item main_active ">
                                    <a class="nav-link {{ Request::is('ControlPanel/Language') ? 'active' : '' }}" href="{{url('ControlPanel/Language')}}">
                                        <i class="nav-icon far fa-circle"></i>
                                        <p>Language</p>
                                    </a>
                                </li>
                            </ul>
                        </li>
                        <li class="nav-item main_active ">
                            <a href="{{url('ControlPanel/Slider')}}" class="nav-link">
                                <i class="nav-icon fas fa-sliders-h"></i>
                                <p>Slider</p>
                            </a>
                        </li>
                        <li class="nav-item main_active ">
                            <a href="{{url('ControlPanel/Promotion')}}" class="nav-link">
                                <i class="nav-icon fab fa-adversal"></i>
                                <p>Promotion</p>
                            </a>
                        </li>
                        <li class="nav-item main_active ">
                            <a href="{{url('ControlPanel/BookShelf')}}" class="nav-link">
                                <i class="nav-icon  far fa-address-book"></i>
                                <p>Book Shelf</p>
                            </a>
                        </li>
                        <li class="nav-item main_active ">
                            <a href="{{url('ControlPanel/Ebook')}}" class="nav-link">
                                <i class="nav-icon fas fa-file-alt"></i>
                                <p>E-Book Manage</p>
                            </a>
                        </li>
                        <li class="nav-item main_active ">
                            <a href="{{url('ControlPanel/AudioBook')}}" class="nav-link">
                                <i class="nav-icon fas fa-file-audio"></i>
                                <p>Audio-Book Manage</p>
                            </a>
                        </li>
                        <li class="nav-item has-treeview main_active ">
                            <a href="#" class="nav-link">
                                <i class="nav-icon fas fa-cogs"></i>
                                <p>Reports<i class="fas fa-angle-left right"></i></p>
                            </a>
                            <ul class="nav nav-treeview">
                                <li class="nav-item main_active ">
                                    <a href="{{url('ControlPanel/EbookView')}}" class="nav-link">
                                        <i class="nav-icon far fa-circle"></i>
                                        <p>E-Book Views</p>
                                    </a>
                                </li>
                                <li class="nav-item main_active ">
                                    <a href="{{url('ControlPanel/EbookDuration')}}" class="nav-link">
                                        <i class="nav-icon far fa-circle"></i>
                                        <p>E-Book Location</p>
                                    </a>
                                </li>
                                <li class="nav-item main_active ">
                                    <a href="{{url('ControlPanel/EbookReport')}}" class="nav-link">
                                        <i class="nav-icon far fa-circle"></i>
                                        <p>E Book Report</p>
                                    </a>
                                </li>
                            </ul>
                        </li>
                        <li class="nav-item main_active ">
                            <a href="{{url('ControlPanel/BookRequest')}}" class="nav-link">
                                <i class="nav-icon fas fa-comment-alt"></i>
                                <p>Book Request</p>
                            </a>
                        </li>
                        <li class="nav-item main_active ">
                            <a href="{{url('ControlPanel/Feedback')}}" class="nav-link">
                                <i class="nav-icon fas fa-comments"></i>
                                <p>Feedbacks</p>
                            </a>
                        </li>
                        <!-- <li class="nav-item main_active ">
                            <a href="{{('Admin-File-Upload-2')}}" class="nav-link">
                                <i class="nav-icon fas fa-file"></i>
                                <p>File Upload - 2</p>
                            </a>
                        </li>
                        <li class="nav-item main_active ">
                            <a href="{{('Admin-File-Upload-3')}}" class="nav-link">
                                <i class="nav-icon fas fa-file"></i>
                                <p>File Upload - 3</p>
                            </a>
                        </li> -->
                    </ul>
                </nav>
                <!-- /.sidebar-menu -->
            </div>
            <!-- /.sidebar -->
        </aside>
        <!-- Content Wrapper. Contains page content -->
        <div class="content-wrapper">
            <!-- Content Header (Page header) -->

            <!-- /.content-header -->

            <!-- Main content -->
            <div class="content">
                <div class="container-fluid p-3">
                    @yield('content')
                    <!-- row -->
                    <!-- Modal -->


                </div><!-- /.container-fluid -->
            </div>
            <!-- /.content -->
        </div>
        <!-- /.content-wrapper -->

        <!-- Control Sidebar -->
        <aside class="control-sidebar control-sidebar-dark">
            <!-- Control sidebar content goes here -->
            <div class="p-3">
                <h5>Title</h5>
                <p>Sidebar content</p>
            </div>
        </aside>
        <!-- /.control-sidebar -->

        <!-- Main Footer -->
        <footer class="main-footer">
            <!-- To the right -->
            <div class="float-right d-none d-sm-inline">
                Anything you want
            </div>
            <!-- Default to the left -->
            <strong>Copyright &copy; <?=date("Y")?></strong> All rights reserved. Developed By <a
                href="https://dualsysco.com">Dualsysco</a>
        </footer>
    </div>
    <!-- ./wrapper -->
    <script>
    function alertmsg(msg, type) {
    $("#error").removeClass().html('').show();
    $("#error").addClass(`alert alert-${type} text-center`).html(msg);
    $("#error").fadeOut(3000);
    }
    </script>
    <!-- datatable -->
    <script src="{{url('public/Admin/plugins/datatables/jquery.dataTables.min.js')}}"></script>
    <script src="{{url('public/Admin/plugins/datatables-bs4/js/dataTables.bootstrap4.min.js')}}"></script>
    <script src="{{url('public/Admin/plugins/datatables-responsive/js/dataTables.responsive.min.js')}}"></script>
    <script src="{{url('public/Admin/plugins/datatables-responsive/js/responsive.bootstrap4.min.js')}}"></script>
    <script src="{{url('public/Admin/plugins/datatables-buttons/js/dataTables.buttons.min.js')}}"></script>
    <script src="{{url('public/Admin/plugins/datatables-buttons/js/buttons.bootstrap4.min.js')}}"></script>
    <script src="{{url('public/Admin/plugins/jszip/jszip.min.js')}}"></script>
    <script src="{{url('public/Admin/plugins/pdfmake/pdfmake.min.js')}}"></script>
    <script src="{{url('public/Admin/plugins/pdfmake/vfs_fonts.js')}}"></script>
    <script src="{{url('public/Admin/plugins/datatables-buttons/js/buttons.html5.min.js')}}"></script>
    <script src="{{url('public/Admin/plugins/datatables-buttons/js/buttons.print.min.js')}}"></script>
    <script src="{{url('public/Admin/plugins/datatables-buttons/js/buttons.colVis.min.js')}}"></script>
    <!-- ChartJS -->
    <script src="{{url('public/Admin/plugins/chart.js/Chart.min.js')}}"></script>
    <script src="{{url('public/Admin/dist/js/scripts.js')}}"></script>

    <!-- jQuery -->
    <!-- BS-Stepper -->
    <script src="{{url('public/Admin/plugins/bs-stepper/js/bs-stepper.min.js')}}"></script>
    <!-- Bootstrap 4 -->
    <script src="{{url('public/Admin/plugins/bootstrap/js/bootstrap.bundle.min.js')}}"></script>
    <!-- AdminLTE App -->
    <script src="{{url('public/Admin/dist/js/adminlte.min.js')}}"></script>
    <!-- for croper js  -->

    <!-- //sweet Alert -->
    <script src="{{url('public/Admin/plugins/sweetalert2/sweetalert2.min.js')}}"></script>
    <!-- Sweet Aleert Toast -->
    <script src="{{url('public/Admin/plugins/toastr/toastr.min.js')}}"></script>
    <script src="{{url('public/Admin/plugins/bootstrap/js/bootstrap.bundle.min.js')}}"></script>
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-colorpicker/2.5.1/js/bootstrap-colorpicker.min.js">
    </script>

</body>

</html>
