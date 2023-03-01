@extends('Layout')

@section('content')

<!-- shop-main-area-start -->

<div class="shop-main-area" style="overflow:hidden;">
    <div class="slider-area">
        <div class="slider-active owl-carousel">
            @foreach($sliders as $slider)
            {{$slider->slider_heading}}
            <div class="single-slider pt-40 pb-40 bg-img" style="background-color:{{$slider->slider_bg ?? ''}};">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-8 col-md-6 order-1 order-lg-0">
                            <div class="slider-content slider-animated-1 mt-70">
                                <h4>{{$slider->slider_heading ?? ''}}</h4>
                                <p>{{Str::limit($slider->slider_caption,278) ?? ''}}</p>
                                <a href="{{$slider->link ?? ''}}">Know More</a>
                            </div>
                        </div>
                        <div class="col-lg-4 col-md-6 order-0 order-lg-1 slider-animated-1">
                            <img src="{{url('public/Website/image/images')}}"
                                alt="" class="slider-auto_img mx-auto wow" data-wow-delay="1s">
                        </div>
                    </div>
                </div>
            </div>
            @endforeach
        </div>
    </div>
</div>

<div class="carousel-item">
    <img src="{{url('public/Website/image/images')}}" alt="...">
    <div class="carousel-caption d-none d-md-block">
      <h5>Title</h5>
      <p>description</p>
    </div>
  </div>

<div class="shop-main-area" style="overflow:hidden;">
    <div class="slider-area">
        <div class="slider-active owl-carousel">
            @foreach($sliders as $slider)
            <div class="single-slider pt-40 pb-40 bg-img" style="background-color:{{$slider->slider_bg ?? ''}};">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-8 col-md-6 order-1 order-lg-0">
                            <div class="slider-content slider-animated-1 mt-70">
                                <h4>{{$slider->slider_heading ?? ''}}</h4>
                                <p>{{Str::limit($slider->slider_caption,278) ?? ''}}</p>
                                <a href="{{$slider->link ?? ''}}">Know More</a>
                            </div>
                        </div>
                        <div class="col-lg-4 col-md-6 order-0 order-lg-1 slider-animated-1">
                            <img src="{{config('global.main_url')}}/public/Files/Main-Slider/{{$slider->slider_img ?? ''}}"
                                alt="" class="slider-auto_img mx-auto wow" data-wow-delay="1s">
                        </div>
                    </div>
                </div>
            </div>
            @endforeach
        </div>
    </div>
</div>


<!-- BookShelf -->
<div class="main-book-shelf banner-static-area mb-50 ptb-20 bg">
    <div class="container">
        <div class="bookshelf mb-3">
            <div class="covers d-flex mx-auto">
                {{-- @for($i = 0; $i < 5 ; $i++) <div class="thumb book-1">
                    <a href="{{$bookshelf[$i]->ebook_slug ?? ''}}/Detail">
                        <img src="{{url('public/Files/E-Book-CoverImg')}}/{{$bookshelf[$i]->ebook__cover ?? ''}}"
                            class="img-w-120">
                    </a>
            </div>
            @endfor --}}
        </div>
        <img class="shelf-img" src="{{url('public/web/assets/img/shelf/shelf_wood.png')}}" width="1088">
    </div>

    <div class="bookshelf">
        <div class="covers d-flex mx-auto">
            {{-- @for($i = 5; $i < 10 ; $i++) <div class="thumb book-1">
                <a href="{{$bookshelf[$i]->ebook_slug ?? ''}}/Detail">
                    <img src="{{url('public/Files/E-Book-CoverImg')}}/{{$bookshelf[$i]->ebook__cover ?? ''}}"
                        class="img-w-120">
                </a>
        </div>
        @endfor --}}
    </div>
    <img class="shelf-img" src="{{url('public/web/assets/img/shelf/shelf_wood.png')}}" width="1088">
</div>
</div>
</div>
<!-- BookShelf -->


<!-- shop-main-area-end -->
<div class="container">
    <div class="row">
        <div class="col-lg-12">
            <div class="section-title text-center mb-50">
                <h2>Top Searchable</h2>
                <p>Browse the collection of our searchable and top interesting <br /> e-books.
                    ll definitely find
                    what you are looking for..</p>
            </div>
        </div>
    </div>

    <div class="row"></div>

    <!-- product slider -->
    <div class="tab-active owl-carousel">
        <!-- single-product-start -->
        {{-- @foreach($books as $book)
        @if($book->searchable == 1)
        @if($book->ebook_position == 1)
        @include('Card',['book'=> $book])
        @endif
        @endif
        @endforeach --}}
        <!-- single-product-end -->
    </div>
    <!-- product slider -->
</div>

<!-- The Holy Quraan -->
<div class="bg-grey">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <div class="section-title text-center pt-50 mb-10 section-title-res">
                    {{-- <a href="{{url('/')}}/EBook-{{$categories[0]->category_slug}}"> --}}
                        <h2>The Holy Quran</h2>
                    </a>
                    <p>Browse the collection of our featured and top interesting e-books. <br />
                        ll definitely find what you are looking for..</p>
                </div>
            </div>
        </div>

        <div class="new-book-area">
            <div class="row">
                <div class="col-lg-5">
                    {{-- @foreach($HolyQuraan as $holyquraan)
                    <!-- @if($holyquraan->ebook_position == 1) -->
                    <!-- <p>{{$loop->count}}</p> -->
                    @if($holyquraan->file_id == 531)
                    @include('Card-5',['book'=> $holyquraan])
                    @endif

                    <!-- @endif -->
                    @endforeach --}}
                </div>
                <div class="col-lg-7">
                    <div class="row">
                        {{-- @foreach($HolyQuraan as $holyquraan)
                        @if($holyquraan->ebook_position == 1 && $holyquraan->file_id != 531)
                        <div class="col-lg-4">
                            @include('Card-3',['book'=> $holyquraan])
                        </div>
                        @endif
                        @endforeach --}}
                    </div>
                </div>
            </div>
            <!-- <div class="product-active-3 owl-carousel">
                {{-- @foreach($HolyQuraan as $holyquraan)
                @if($holyquraan->ebook_position == 1)
                @include('Card-2',['book'=> $holyquraan])
                @endif
                @endforeach --}}
            </div> -->
            <div class="text-right">
                {{-- <a href="{{url('/')}}/EBook-{{$categories[0]->category_slug}}" class="btn-2">View More</a> --}}
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
                {{-- <a href="{{url('/')}}/EBook-{{$categories[1]->category_slug}}"> --}}
                    <h2>The Meaning Of The Holy Quran</h2>
                </a>
                <p>Browse the collection of our featured and top interesting e-books. <br />
                    ll definitely find what you are looking for..</p>
            </div>
        </div>
    </div>

    <div class="row">
        {{-- @foreach($MeaningofQuraan->take(2) as $meaningofquraan)
        @include('Card-4',['book'=> $meaningofquraan])
        @endforeach --}}
    </div>

    <div class="new-book-area">
        <div class="product-active-3 owl-carousel">
            {{-- @foreach($MeaningofQuraan as $meaningofquraan)
            @if($meaningofquraan->ebook_position == 1)
            @include('Card-2',['book'=> $meaningofquraan])
            @endif
            @endforeach --}}
        </div>
        <div class="text-right">
            {{-- <a href="{{url('/')}}/EBook-{{$categories[1]->category_slug}}" class="btn-2">View More</a> --}}
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
                    {{-- <a href="{{url('/')}}/EBook-{{$categories[2]->category_slug}}"> --}}
                        <h2>Islamic Cultural Books</h2>
                    </a>
                    <p>Browse the collection of our featured and top interesting e-books.<br />
                        ll definitely find what you are looking for..</p>
                </div>
            </div>
        </div>
        <div class="arbic-banner">
            <img src="{{url('public/web/assets/img/banner-1.png')}}" alt="">
        </div>
        <div class="new-book-area">
            <!-- <div class="product-active-3 owl-carousel"> -->
            <div class="row">
                {{-- @foreach($IslammicCultBook as $islammicBook)
                @if($islammicBook->ebook_position == 1)
                <div class="col-lg-3">
                    @include('Card-6',['book'=> $islammicBook])
                </div>
                @endif
                @endforeach --}}
            </div>
            <!-- </div> -->
            <div class="text-right">
                {{-- <a href="{{url('/')}}/EBook-{{$categories[2]->category_slug}}" class="btn-2">View More</a> --}}
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
                {{-- <a href="{{url('/')}}/EBook-{{$categories[4]->category_slug}}"> --}}
                    <h2>Arabic Learning Books</h2>
                </a>
                <p>Browse the collection of our featured and top interesting e-books. <br />
                    ll definitely find what you are looking for..</p>
            </div>
        </div>
    </div>
    <div class="new-book-area">
        <div class="product-active-3 owl-carousel">
            {{-- @foreach($ArbicLearningBook as $arbiclearningbook)
            @if($arbiclearningbook->ebook_position == 1)
            @include('Card-2',['book'=> $arbiclearningbook])
            @endif
            @endforeach --}}
        </div>
        <div class="text-right">
            {{-- <a href="{{url('/')}}/EBook-{{$categories[4]->category_slug}}" class="btn-2">View More</a> --}}
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
                    {{-- <a href="{{url('/')}}/EBook-{{$categories[3]->category_slug}}"> --}}
                        <h2>Children Books</h2>
                    </a>
                    <p>Browse the collection of our featured and top interesting e-books. <br />
                        ll definitely find what you are looking for..</p>
                </div>
            </div>
        </div>
        <div class="new-book-area">
            <!-- <div class="product-active-3 owl-carousel"> -->
            <div class="row">
                {{-- @foreach($ChildrenBook->take(1) as $childrenbook)
                @if($childrenbook->ebook_position == 1)
                <div class="col-lg-5">
                    @include('Card-5',['book'=> $childrenbook])
                </div>
                @endif
                @endforeach
                <div class="col-lg-7">
                    <div class="row">
                        @foreach($ChildrenBook as $childrenbook)
                        @if($childrenbook->ebook_position == 1)
                        <div class="col-lg-4">
                            @include('Card-3',['book'=> $childrenbook])
                        </div>
                        @endif
                        @endforeach --}}
                    </div>
                </div>
            </div>
            <!-- </div> -->
            <div class="text-right">
                {{-- <a href="{{url('/')}}/EBook-{{$categories[3]->category_slug}}" class="btn-2">View More</a> --}}
            </div>
        </div>
    </div>
</div>
<!-- Childrens Book -->

@endsection
