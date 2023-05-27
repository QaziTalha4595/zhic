<!doctype html>
<html lang=en-US>

<head dir="rtl">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="google-site-verification" content="zIYMl8nMbsZA0sNEU25Th1gTrSg0QJNISIBthA4KezE">
    <link rel=profile href=https://gmpg.org/xfn/11>
    <title>@yield('title')</title>
    <link rel="shortcut icon" type="image/x-icon" href="{{url('public/web/assets/img/logo/main-logo.svg')}}">

    {{-- جامعة محمد بن زايد للعلوم الإنسانية --}}
    <meta name='robots' content='max-image-preview:large'>

    <link href="{{url('public/Website/plugins/font-awesome/font-awesome.min.css')}}" rel="stylesheet">
    <link href="{{url('public\Website\css\preloader.css')}}" rel=stylesheet type=text/css>
    <link href="{{url('public\Website\plugins\bootstrap\bootstrap.min.css')}}" rel=stylesheet type=text/css>
    <link href="{{url('public\Website\css\css-plugin-collections.css')}}" rel=stylesheet>
    <link href="{{url('public/Website/css/style-english.css?ver=925')}}" rel=stylesheet type=text/css>
    <link href="{{url('public\Website\css\responsive.css')}}" rel=stylesheet type=text/css>
    <script src="{{url('public\Website\js\jquery-2.2.4.min.js')}}"></script>
    <script src="{{url('public\Website\js\jquery-plugin-collection.js')}}"></script>

    <!-- bootstrap v3.3.6 css -->
    <link rel="stylesheet" href="{{ url('public/web/assets/css/boostrap.min.css') }}">
    <!-- animate css -->
    <link rel="stylesheet" href="{{ url('public/web/assets/css/animate.css') }}">
    <!-- meanmenu css -->
    <link rel="stylesheet" href="{{ url('public/web/assets/css/meanmenu.min.css') }}">
    <!-- owl.carousel css -->
    <link rel="stylesheet" href="{{ url('public/web/assets/css/owl.carousel.css') }}">
    <!-- flexslider.css-->
    <link rel="stylesheet" href="{{ url('public/web/assets/css/flexslider.css') }}">
    <link rel="stylesheet" href="{{ url('public/web/assets/style.css?ver=6.1.1') }}">
    <link rel="stylesheet" href="{{ url('public/web/fonts/fonts.css') }}">
    <link rel="stylesheet" href="{{ url('public/Website/css/utility-classes.css') }}">


    {{-- new changes --}}
    {{-- <link rel="stylesheet" href="{{url('public/web/assets/css/font-awesome.min.css')}}"> --}}


    <link rel="stylesheet" href="{{ url('public/web/assets/css/plyr.css') }}">

    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Love+Ya+Like+A+Sister&display=swap" rel="stylesheet">

    <!-- chosen.min.css-->
    <link rel="stylesheet" href="{{ url('public/web/assets/css/chosen.min.css') }}">
    <!-- style css -->
    {{-- <link rel="stylesheet" href="{{ url('public/web/assets/style.css') }}"> --}}
    <!-- responsive css -->
    <link rel="stylesheet" href="{{ url('public/web/assets/css/responsive.css') }}">
<style>
    body {
        @if ((Request::segment(1)  == "en"))
        direction: ltr;
        @else

        direction: rtl;
        @endif
    }
    .row{

    @if ((Request::segment(1)  == "en"))
            direction: ltr;
            @else

            direction: rtl;

            @endif
    }

    .row p {
        @if ((Request::segment(1)  == "ar"))

            direction: rtl;
            @endif
    }

    #menuzord ul{
        @if ((Request::segment(1)  == "ar"))
            float: right;


            @endif
    }

    .slider-content a, h4 {
        @if ((Request::segment(1) == "ar") )
            float: right;
        @endif
    }

    .slider-content p{
        @if ((Request::segment(1) == "ar") )
            float: right;
        @endif
    }



    .search-box-main{
        @if ((Request::segment(1) == "ar") )
        padding: 37px 99px 0 0 ;
        @endif
    }

    .sec-card-body{
        @if ((Request::segment(1) == "ar") )
        direction: rtl;
        @endif
    }
    .card-title{
        @if ((Request::segment(1) == "ar") )
            text-align: right;
        @else
            text-align: left;

        @endif
    }

    .card-text{
        @if ((Request::segment(1) == "ar") )
            direction: rtl;
        @else

        @endif
    }

    .cardbody h5{
        @if ((Request::segment(1) == "ar") )
            float: right;
        @endif
    }

    .reviews-actions{
        @if ((Request::segment(1) == "ar") )
            direction: rtl;
            float: right;
        @endif
    }
    .reviews-actions .view{
        @if ((Request::segment(1) == "ar") )
            direction: rtl;
            float: right;
        @endif
    }

    .toolbar {
        direction: ltr;
    }

    .book-card-overlay i{
        @if ((Request::segment(1) == "ar") )
            float: right;
        @endif
    }
    body{
        @if ((Request::segment(1) == "ar") )
        font-family: 'Noto Nastaliq Urdu';
        @endif
    }

    .left-menu{
        @if ((Request::segment(1) == "ar") )
            direction: ltr;
        @endif
    }
    .control{
        @if ((Request::segment(1) == "ar") )
            direction: rtl;
        @endif
    }

    .space{
        margin-top: 111px;
    }

</style>
</head>

<body
    class="home page-template page-template-page-home-demo page-template-page-home-demo-php page page-id-6208 wp-custom-logo class-name no-sidebar"
    id=innerbody>

    <noscript><iframe src="https://www.googletagmanager.com/ns.html?id=GTM-WJC2TGR" height=0 width=0
        style=display:none;visibility:hidden></iframe></noscript>
        <div id=wrapper class=clearfix >
        <div id=preloader>
            <div class=cssload-loading>
                {{-- <img src="{{url('public/favicon.ico')}}"> --}}
            </div>
            <div id=spinner>
                <div class=preloader-dot-loading></div>
            </div>
            <div id=disable-preloader class="btn btn-default btn-sm">Disable Preloader</div>
        </div>
        <header id=header class=header>
            <div class="header-middle p-0 bg-lightest xs-text-center">
                <div class=fix-header>
                    <div class="container pt-0 pb-0">
                        <div class=row>
                            <div class=logo-sec>
                                <div class="widget no-border m-0">
                                    <a class="menuzord-brand pull-left flip xs-pull-center" href="{{ (Request::segment(1) == "en")  ? url('en/Home') : url('ar/Home') }}"
                                        title="Mohamed Bin Zayed University For Humanities"><img
                                            src="{{url('public\Logo-header-ENg.png')}}"
                                            alt="Mohamed Bin Zayed University For Humanities"></a>
                                </div>
                            </div>
                            <div class=flag>
                                <div class=search-box-main>
                                    <div class="utilities-icons hidden-xs hidden-sm">
                                        <div class=search-box-area>
                                            <div class=right-btn>
                                                <div class=dropdown data-placement=bottom data-toggle=tooltip title>
                                                    <button class=search-btn type=button data-toggle=dropdown
                                                        aria-expanded=false></button>
                                                    <div class="dropdown-menu dropdown-menu-right">
                                                        {{-- <form role=search method=get id=searchform class=searchform>
                                                            <input type=text value name=s id=s placeholder=Search>
                                                            <input type=submit id=searchsubmit class=submit-btn
                                                                value=Send>
                                                        </form> --}}
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <ul class=lng>
                                            <li class="lang-item lang-item-2 lang-item-ar lang-item-first"><a lang=ar
                                                    hreflang=ar
                                                    href="{{ (Request::segment(1) == "en")  ? url('ar/Home') : url('en/Home') }}">{{ __('basic.lang') }}</a>
                                            </li>
                                        </ul>
                                        <a class=zoomin title style="font-size: 19.5px;cursor: pointer;"
                                            data-toggle=tooltip data-placement=bottom data-original-title=Increase>A</a>
                                        <a class=zoomclear title style="font-size: 15px;cursor: pointer;"
                                            data-toggle=tooltip data-placement=bottom data-original-title=Reset>A</a>
                                        <a class=zoomout title style="font-size: 10.5px;cursor: pointer;"
                                            data-toggle=tooltip data-placement=bottom data-original-title=Minimize>A</a>

                                        <div class=switcher>
                                            <div class="wpnm-button style-5">

                                                <div class=wpnm-button-moon>
                                                    <svg xmlns=http://www.w3.org/2000/svg
                                                        xmlns:xlink=http://www.w3.org/1999/xlink version=1.1
                                                        id=nightIcon x=0px y=0px viewBox="0 0 100 100"
                                                        enable-background="new 0 0 100 100" xml:space=preserve>
                                                        <path
                                                            d="M96.76,66.458c-0.853-0.852-2.15-1.064-3.23-0.534c-6.063,2.991-12.858,4.571-19.655,4.571  C62.022,70.495,50.88,65.88,42.5,57.5C29.043,44.043,25.658,23.536,34.076,6.47c0.532-1.08,0.318-2.379-0.534-3.23  c-0.851-0.852-2.15-1.064-3.23-0.534c-4.918,2.427-9.375,5.619-13.246,9.491c-9.447,9.447-14.65,22.008-14.65,35.369  c0,13.36,5.203,25.921,14.65,35.368s22.008,14.65,35.368,14.65c13.361,0,25.921-5.203,35.369-14.65  c3.872-3.871,7.064-8.328,9.491-13.246C97.826,68.608,97.611,67.309,96.76,66.458z">
                                                        </path>
                                                    </svg>
                                                </div>
                                            </div>
                                        </div>

                                    </div>
                                    <div class="top-links-itself pull-right" id=top-links>
                                        <ul id=menu-top_enmenu class=menu>
                                            <li id=menu-item-8236
                                                class="menu-item menu-item-type-custom menu-item-object-custom menu-item-8236">
                                                <a title="Apply now" target=_blank rel=noopener
                                                    href="#">{{ __('basic.Applynow') }}</a></li>
                                            <li id=menu-item-8390
                                                class="menu-item menu-item-type-post_type menu-item-object-page menu-item-8390">
                                                <a title="Continuous Education Center"
                                                    href="#">{{ __('basic.Continuous') }}</a>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class=header-nav>
                    <div
                        class="header-nav-wrapper navbar-scrolltofixed bg-theme-colored border-bottom-theme-color-2-1px t-39">
                        <div class=container>
                            <nav id=menuzord class="menuzord bg-theme-colored pull-left flip menuzord-responsive">
                                <ul id=menu-enmain_menu class=menuzord-menu>
                                    @foreach ($categories as $category)
                                        <li id=menu-item-3588
                                            class="menu-item menu-item-type-custom menu-item-object-custom menu-item-has-children menu-item-3588">
                                            <a title=Library
                                                style="color: White;" class="nav" href="{{url( (Request::segment(1) == 'ar') ? 'ar' : 'en' )}}/EBook-{{$category->category_slug ?? ''}}">{{  (Request::segment(1) == "en")  ? $category->category_name : $category->category_name_ar ?? ' '  }}</a>
                                            <ul  class=sub-menu>
                                                @foreach ($sub_categories as $Category_sub)
                                                    @if ($Category_sub->category_id == $category->id)
                                                    <li id=menu-item-6073 class="menu-item menu-item-type-custom menu-item-object-custom menu-item-has-children menu-item-6073">
                                                        <a title="Apply for Job" href="{{url( (Request::segment(1) == 'ar') ? 'ar' : 'en' )}}/EBook-{{$category->category_slug}}/{{$Category_sub->sub_category_slug}}">{{   (Request::segment(1) == "en")  ? $Category_sub->sub_category_name : $Category_sub->sub_category_name_ar ?? ' '}}</a>
                                                        <ul class=sub-menu>
                                                            @foreach ($third_categories as $Category_third)
                                                            @if ($Category_third->sub_category_id == $Category_sub->id)
                                                            <li id=menu-item-6470 class="menu-item menu-item-type-post_type menu-item-object-page menu-item-6470">
                                                                <a title="Faculty position application" href="{{url( (Request::segment(1) == 'ar') ? 'ar' : 'en' )}}/EBook-{{$category->category_slug}}/{{$Category_sub->sub_category_slug}}/{{$Category_third->third_category_slug}}">{{ (Request::segment(1) == "en")  ? $Category_third->third_category_name ?? ' '  : $Category_third->third_category_name_ar ?? ' ' }}</a>
                                                            </li>
                                                            @endif
                                                            @endforeach
                                                        </ul>
                                                    </li>
                                                    @endif
                                                @endforeach
                                            </ul>
                                        </li>
                                    @endforeach
                                    <li>
                                        <a href="{{url((Request::segment(1) == 'ar') ? 'ar' : 'en' )}}/Book-Request">{{__('basic.RequestForBook')}}</a>
                                    </li>

                                    </ul>
                                </ul>
                            </nav>
                        </div>
                    </div>
                </div>
        </header>
        <div class="space" >

        </div>

        <div>
            @yield('content')
        </div>
        <footer id=footer class="footer divider layer-overlay overlay-dark-9"
            data-bg-img=https://www.mbzuh.ac.ae/wp-content/themes/mvu/assets/images/bg/bg2.jpg>
            <div class=container>
                <div class=row>
                    <div class="col-sm-8 col-md-8 b-right">
                        <div class="widget dark">
                            <a title="جامعة محمد بن زايد للعلوم الإنسانية"><img
                                    class="mt-5 mb-20 footerlogo"
                                    src=https://www.mbzuh.ac.ae/wp-content/uploads/2021/01/footer-logo.png
                                    alt="جامعة محمد بن زايد للعلوم الإنسانية"></a>
                            <section id=custom_html-7
                                class="widget_text widget widget_custom_html widget-title line-bottom-theme-colored-2">
                                <div class="textwidget custom-html-widget">
                                    <p>
                                        <i class="fa fa-map-marker text-theme-color-2 mr-5" aria-hidden=true></i> <a
                                            href="#" target=_blank rel=noopener>{{__('basic.Adress')}}</a>
                                    </p>
                                    <p>
                                        <i class="fa fa-map-marker text-theme-color-2 mr-5" aria-hidden=true></i> <a
                                            href="#" target=_blank rel=noopener>{{__('basic.Adress1')}}</a>
                                    </p>
                                    <div class=cnt-info>
                                        <ul class="list-inline mt-5">
                                            <li class="m-0 pl-10 pr-10"> <i
                                                    class="fa fa-phone text-theme-color-2 mr-5"></i> <a class
                                                    href="#">024999000</a> <br><i
                                                    class="fa fa-phone text-theme-color-2 mr-5"></i> <a class
                                                    href="#">067119000</a> </li>
                                            <li class="m-0 pl-10 pr-10"> <i
                                                    class="fa fa-envelope-o text-theme-color-2 mr-5"></i> <a class
                                                    href="#">info@mbzuh.ac.ae</a> </li>
                                            <li class="m-0 pl-10 pr-10"> <i
                                                    class="fa fa-globe text-theme-color-2 mr-5"></i> <a
                                                    href="#">www.mbzuh.ac.ae</a>
                                            </li>
                                        </ul>
                                    </div>
                                    <div class=wrk-hr>
                                        <div class=c1>{{__('basic.Working')}}</div>
                                        <div class=c2>{{__('basic.Monday')}}<br> {{__('basic.MondayTime1')}} – {{__('basic.MondayTime2')}}<br> {{__('basic.MondayTime3')}} – {{__('basic.MondayTime4')}}</div>
                                        <div class=c2>{{__('basic.friday')}}<br> {{__('basic.fridayTIme1')}} – {{__('basic.fridayTIme2')}}<br> {{__('basic.fridayTime3')}} – {{__('basic.fridayTime4')}}</div>
                                    </div>
                                </div>
                            </section>
                        </div>
                        <div class=footer-social1>
                            <a href="https://play.google.com/store/apps/details?id=app.mohamedbinzayeduniversity"
                                target=_blank>
                                <img src=https://www.mbzuh.ac.ae/wp-content/uploads/2023/02/google-play.png>
                            </a>
                            <a href=https://apps.apple.com/bf/developer/mohamed-bin-zayed-university-for-humanities/id1652628293
                                target=_blank>
                                <img src=https://www.mbzuh.ac.ae/wp-content/uploads/2023/02/app-store.png>
                            </a>
                        </div>

                    </div>
                    <div class="col-sm-4 col-md-4">
                        <div class="widget dark logo-2nd">
                            <a href="#" target=_blank title="The Emirates"><img
                                    src=https://www.mbzuh.ac.ae/wp-content/uploads/2021/01/UAE-Nation-logo.png
                                    alt="The Emirates"></a>
                        </div>
                        <div class="top-links-itself footer-bo-menu" id=top-links>
                            <ul id=menu-enfooter-menu class=menu>
                                <li id=menu-item-11267
                                    class="menu-item menu-item-type-post_type menu-item-object-page menu-item-11267"><a
                                        href="#">Privacy Policy</a>
                                </li>
                                <li id=menu-item-6074
                                    class="menu-item menu-item-type-custom menu-item-object-custom menu-item-has-children menu-item-6074">
                                    <a title="Employee Services" href=#>Employee Services</a>
                                    <ul class=sub-menu>
                                        <li id=menu-item-6085
                                            class="menu-item menu-item-type-custom menu-item-object-custom menu-item-6085">
                                            <a title="Email access" target=_blank rel=noopener href="#">Email
                                                access</a></li>
                                        <li id=menu-item-6277
                                            class="menu-item menu-item-type-custom menu-item-object-custom menu-item-6277">
                                            <a title="UM System" target=_blank rel=noopener href="#">UM
                                                System</a></li>
                                        <li id=menu-item-6086
                                            class="menu-item menu-item-type-custom menu-item-object-custom menu-item-6086">
                                            <a title="Bitrix access" target=_blank rel=noopener href="#">Bitrix
                                                access</a>
                                        </li>
                                        <li id=menu-item-11816
                                            class="menu-item menu-item-type-custom menu-item-object-custom menu-item-11816">
                                            <a title=Central target=_blank rel=noopener href="#">Central</a>
                                        </li>
                                        <li id=menu-item-6089
                                            class="menu-item menu-item-type-custom menu-item-object-custom menu-item-6089">
                                            <a title="IT service request" target=_blank rel=noopener href="#">IT
                                                service request</a></li>
                                        <li id=menu-item-6090
                                            class="menu-item menu-item-type-custom menu-item-object-custom menu-item-6090">
                                            <a title="D2L access" target=_blank rel=noopener href="#">D2L
                                                access</a></li>
                                        <li id=menu-item-6091
                                            class="menu-item menu-item-type-custom menu-item-object-custom menu-item-6091">
                                            <a title="SIS access" target=_blank rel=noopener href="#">SIS
                                                access</a>
                                        </li>
                                    </ul>
                                </li>
                                <li id=menu-item-6073
                                    class="menu-item menu-item-type-custom menu-item-object-custom menu-item-has-children menu-item-6073">
                                    <a title="Apply for Job" href=#>Apply for Job</a>
                                    <ul class=sub-menu>
                                        <li id=menu-item-6470
                                            class="menu-item menu-item-type-post_type menu-item-object-page menu-item-6470">
                                            <a title="Faculty position application" href="#">Faculty position
                                                application</a>
                                        </li>
                                        <li id=menu-item-6471
                                            class="menu-item menu-item-type-post_type menu-item-object-page menu-item-6471">
                                            <a title="Administrative jobs" href="#">Administrative jobs</a>
                                        </li>
                                    </ul>
                                </li>
                            </ul>
                        </div>
                        <div id=mc_embed_signup class=newsletter-form>
                            <form action="{{url((Request::segment(1) == 'ar') ? 'ar' : 'en' )}}/Contact" method="get" class=validate target=_blank>
                                <span>
                                    <input type=email value name=EMAIL class="email form-control" id=mce-EMAIL  placeholder="Enter your email address" required>

                                    <div class=input-group-append>
                                        <input type=submit value="Contact" name=Contact>

                                    </div>
                                </span>
                            </form>
                        </div>
                    </div>
                </div>
                <div class="col-sm-12 col-md-12">
                    <div class="widget light mt-20">
                      {{__('basic.footeraddress')}}</div>
                </div>
            </div>
            <div class="footer-bottom bg-black-333 copyright">
                <div class=container>
                    <div class=row>
                        <div class=col-md-12>
                            <p class="font-13 text-white m-0">
                                {{__('basic.footerbottom')}}</p>
                        </div>
                    </div>
                </div>
            </div>
        </footer>
        <a class=scrollToTop href=#><i class="fa fa-angle-up"></i></a>
    </div>

    <script src=//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js></script>
    <script src="{{url('public\Website\js\popper.min.js')}}"></script>


    <!-- popper js -->
    <script src="{{ url('public/web/assets/js/popper.min.js') }}"></script>
    <!-- bootstrap js -->
    <script src="{{ url('public/web/assets/js/bootstrap.min.js') }}"></script>
    <!-- owl.carousel js -->
    <script src="{{ url('public/web/assets/js/owl.carousel.min.js') }}"></script>
    <!-- meanmenu js -->
    <script src="{{ url('public/web/assets/js/jquery.meanmenu.js') }}"></script>
    <!-- jquery.parallax-1.1.3.js -->
    <script src="{{ url('public/web/assets/js/jquery.parallax-1.1.3.js') }}"></script>
    <!-- jquery.flexslider.js -->
    <script src="{{ url('public/web/assets/js/jquery.flexslider.js') }}"></script>
    <!-- chosen.jquery.min.js -->
    {{-- <script src="{{ url('public/web/assets/js/chosen.jquery.min.js') }}"></script> --}}
    <!-- plugins js -->
    <script src="{{ url('public/web/assets/js/plugins.js') }}"></script>
    <!-- main js -->
    <script src="{{ url('public/web/assets/js/main.js') }}"></script>

    <script src="{{url('public\Website\js\encustom.js')}}"></script>
    <script src="{{url('public\Website\js\easy-responsive-tabs.js')}}"></script>
        <noscript><a href=https://www.livechatinc.com/chat-with/12422943/ rel=nofollow>Chat with us</a>, powered by <a
                href=https://www.livechatinc.com/?welcome rel="noopener nofollow" target=_blank>LiveChat</a></noscript>
</body>

</html>

