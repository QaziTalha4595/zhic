@extends('Layout')

@section('content')


<!-- shop-main-area-start -->
  <div class="shop-main-area" style="overflow:hidden;">
    <div class="slider-area">
        <div class="slider-active owl-carousel">
            @foreach($sliders as $slider)
            <div class="single-slider pt-40 pb-40 bg-img" style="background-color:{{$slider->slider_bg ?? ''}}; padding: 60px 0 60px 0;">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-8 col-md-6 order-1 order-lg-0">
                            <div class="slider-content slider-animated-1 mt-70" style="color: white;">
                                <h4 style="color: white;">{{  Request::is('en') ? $slider->slider_heading : $slider->slider_heading_ar ?? ' '   ?? ''}}</h4>
                                <p>{{  Request::is('en') ? Str::limit($slider->slider_caption,278) : Str::limit($slider->slider_caption_ar,278) ?? ' '   ?? ''}}</p>
                                <a href="{{$slider->link ?? ''}}">Know More</a>
                            </div>
                        </div>
                        <div class="col-lg-4 col-md-6 order-0 order-lg-1 slider-animated-1">
                            <img src="{{url('public/Files/Main-Slider/')}}/{{$slider->slider_img ?? ''}}"
                                alt="" class="slider-auto_img mx-auto wow" data-wow-delay="1s">
                        </div>
                    </div>
                </div>
            </div>
            @endforeach
        </div>
    </div>
</div>



<div class="main-book-shelf banner-static-area mb-50 ptb-20 bg">
    <div class="container">
        <div class="bookshelf mb-3">
            <div class="covers d-flex mx-auto">
                @for($i = 0; $i < 5 ; $i++) <div class="thumb book-1">
                    <a href="en/EBook/{{$bookshelf[$i]->ebook_slug ?? ''}}">
                        <img src="{{url('public/Files/E-Book-CoverImg')}}/{{$bookshelf[$i]->ebook__cover ?? ''}}"
                            class="img-w-120">
                    </a>
            </div>
            @endfor
        </div>
        <img class="shelf-img" src="{{url('public/web/assets/img/shelf/shelf_wood.png')}}" width="1088">
    </div>

    <div class="bookshelf">
        <div class="covers d-flex mx-auto">
            @for($i = 5; $i < 10 ; $i++) <div class="thumb book-1">
                <a href="en/EBook/{{$bookshelf[$i]->ebook_slug ?? ''}}">
                    <img src="{{url('public/Files/E-Book-CoverImg')}}/{{$bookshelf[$i]->ebook__cover ?? ''}}"
                        class="img-w-120">
                </a>
        </div>
        @endfor
    </div>
    <img class="shelf-img" src="{{url('public/web/assets/img/shelf/shelf_wood.png')}}" width="1088">
</div>
</div>
</div>

<!-- shop-main-area-end -->
<div class="container">
    <div class="row">
        <div class="col-lg-12">
            <div class="section-title text-center mb-50">
                <h2>{{__('basic.Top')}}</h2>
                <p style="text-align: center; margin-top:20px;">{{__('basic.BTC')}} <br />  {{__('basic.e-books')}}</p>
            </div>
        </div>
    </div>

    <div class="row"></div>

    <!-- product slider -->
    <div class="tab-active owl-carousel">
        <!-- single-product-start -->
        @foreach($bookshelf as $book)
        @if($book->searchable == 1)
        @if($book->ebook_position == 1)
        @include('Cards\Card',['book'=> $book])
        @endif
        @endif
        @endforeach
        <!-- single-product-end -->
    </div>
    <!-- product slider -->
</div>


<!-- The Holy Quraan -->
<div class="bg-grey">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                {{-- @php
                    DD($Categories);
                @endphp --}}
                <div class="section-title text-center pt-50 mb-10 section-title-res">
                    <a href="{{url('/')}}/EBook-{{$Categories[0]->category_slug}}">
                        <h2>{{__('basic.THQ')}}</h2>
                    </a>
                    <p style="text-align: center; margin-top:20px;">{{__('basic.featured')}} <br />
                        {{__('basic.e-books')}}</p>
                </div>
            </div>
        </div>

        <div class="new-book-area">
            <div class="row">
                <div class="col-lg-5">
                    @foreach($HolyQuraan as $holyquraan)
                    <!-- @if($holyquraan->ebook_position == 1) -->
                    <!-- <p>{{$loop->count}}</p> -->
                    @if($holyquraan->file_id == 531)
                    @include('Cards\Card-5',['book'=> $holyquraan])
                    @endif

                    <!-- @endif -->
                    @endforeach
                </div>
                <div class="col-lg-7">
                    <div class="row">
                        @foreach($HolyQuraan as $holyquraan)
                        @if($holyquraan->ebook_position == 1 && $holyquraan->file_id != 531)
                        <div class="col-lg-4">
                            @include('Cards\Card-3',['book'=> $holyquraan])
                        </div>
                        @endif
                        @endforeach
                    </div>
                </div>
            </div>
            <!-- <div class="product-active-3 owl-carousel">
                @foreach($HolyQuraan as $holyquraan)
                @if($holyquraan->ebook_position == 1)
                @include('Cards\Card-2',['book'=> $holyquraan])
                @endif
                @endforeach
            </div> -->
            <div class="text-right">
                <a href="{{url('/')}}/EBook-{{$Categories[0]->category_slug}}" class="btn-2">View More</a>
            </div>
        </div>
    </div>
</div>
<!-- The Holy Quraan -->


<!-- The Meaning of quraan -->
<div class="container">
    <div class="row">
        <div class="col-lg-12">
            <br>
            <br>
            <div class="section-title text-center pt-50 mb-10 section-title-res">
                <a href="{{url('/')}}/EBook-{{$Categories    [1]->category_slug}}">
                    <h2>{{__('basic.meaning')}}</h2>
                </a>
                <p style="text-align: center; margin-top:20px;">{{__('basic.featured')}} <br />
                    {{__('basic.e-books')}}</p>
            </div>
        </div>
    </div>

    <div class="row">
        @foreach($MeaningofQuraan->take(2) as $meaningofquraan)
        @include('Cards\Card-4',['book'=> $meaningofquraan])
        @endforeach
    </div>

    <div class="new-book-area">
        <div class="product-active-3 owl-carousel">
            @foreach($MeaningofQuraan as $meaningofquraan)
            @if($meaningofquraan->ebook_position == 1)
            @include('Cards\Card-2',['book'=> $meaningofquraan])
            @endif
            @endforeach
        </div>
        <div class="text-right">
            <a href="{{url('/')}}/EBook-{{$Categories    [1]->category_slug}}" class="btn-2">View More</a>
        </div>
    </div>
</div>
<!-- The Meaning of quraan -->

<!-- Islamic Cultural Book -->
<section class="bg-grey">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <br>
                <br>
                <div class="section-title text-center pt-50 mb-10 section-title-res">
                    <a href="{{url('/')}}/EBook-{{$Categories    [2]->category_slug}}">
                        <h2>{{__('basic.CULTURAL')}}</h2>
                    </a>
                    <p style="text-align: center; margin-top:20px;">{{__('basic.featured')}}<br />
                        {{__('basic.e-books')}}</p>
                </div>
            </div>
        </div>
        <div class="arbic-banner">
            <img src="{{url('public/web/assets/img/banner-1.png')}}" alt="">
        </div>
        <div class="new-book-area">
            <!-- <div class="product-active-3 owl-carousel"> -->
            <div class="row">
                @foreach($IslammicCultBook as $islammicBook)
                @if($islammicBook->ebook_position == 1)
                <div class="col-lg-3">
                    @include('Cards\Card-6',['book'=> $islammicBook])
                </div>
                @endif
                @endforeach
            </div>
            <!-- </div> -->
            <div class="text-right">
                <a href="{{url('/')}}/EBook-{{$Categories     [2]->category_slug}}" class="btn-2">View More</a>
            </div>
        </div>
    </div>
</section>
<!-- Islamic Cultural Book -->

<!-- Arabic Learning Book -->
<div class="container">
    <div class="row">
        <div class="col-lg-12">
            <br>
            <br>
            <div class="section-title text-center pt-50 mb-30 section-title-res">
                <a href="{{url('/')}}/EBook-{{$Categories   [4]->category_slug}}">
                    <h2>{{__('basic.ARABIC')}}</h2>
                </a>
                <p style="text-align: center; margin-top:20px;">{{__('basic.featured')}} <br />
                    {{__('basic.e-books')}}</p>
            </div>
        </div>
    </div>
    <div class="new-book-area">
        <div class="product-active-3 owl-carousel">
            @foreach($ArbicLearningBook as $arbiclearningbook)
            @if($arbiclearningbook->ebook_position == 1)
            @include('Cards\Card-2',['book'=> $arbiclearningbook])
            @endif
            @endforeach
        </div>
        <div class="text-right">
            <a href="{{url('/')}}/EBook-{{$Categories   [4]->category_slug}}" class="btn-2">View More</a>
        </div>
    </div>
</div>
<!-- Arabic Learning Book -->
<!-- Childrens Book -->
<div class="bg-grey">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <br>
                <br>
                <div class="section-title text-center pt-50 mb-30 section-title-res">
                    <a href="{{url('/')}}/EBook-{{$Categories   [3]->category_slug}}">
                        <h2>{{__('basic.CHILDREN')}}</h2>
                    </a>
                    <p style="text-align: center; margin-top:20px;">{{__('basic.featured')}}<br />
                        {{__('basic.e-books')}}</p>
                </div>
            </div>
        </div>
        <div class="new-book-area">
            <!-- <div class="product-active-3 owl-carousel"> -->
            <div class="row">
                @foreach($ChildrenBook->take(1) as $childrenbook)
                @if($childrenbook->ebook_position == 1)
                <div class="col-lg-5">
                    @include('Cards\Card-5',['book'=> $childrenbook])
                </div>
                @endif
                @endforeach
                <div class="col-lg-7">
                    <div class="row">
                        @foreach($ChildrenBook as $childrenbook)
                        @if($childrenbook->ebook_position == 1)
                        <div class="col-lg-4">
                            @include('Cards\Card-3',['book'=> $childrenbook])
                        </div>
                        @endif
                        @endforeach
                    </div>
                </div>
            </div>
            <!-- </div> -->
            <div class="text-right">
                <a href="{{url('/')}}/EBook-{{$Categories   [3]->category_slug}}" class="btn-2">View More</a>
            </div>
        </div>
    </div>
</div>
<!-- Childrens Book -->

@endsection
