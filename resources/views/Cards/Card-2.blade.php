{{-- Home Card --}}

<div class="sec-card bg-round" style="direction: ltr;">
    <div class="sec-card-header" style="background-color: {{$book->ebook_bg_color}};border-radius: 10px;"><br>
        <img src="{{url('/public/Files/E-Book-Cover')}}/{{$book->ebook_cover}}"
        onerror="this.onerror=null;this.src='https://www.shutterstock.com/image-illustration/jpeg-blank-notebook-isolated-on-600w-74102503.jpg';"
   ><br>
        {{-- <img class="border-r-10" src="{{url('/public/Files/E-Book-Cover')}}/{{$book->ebook_cover}}" alt="{{$book->ebook_name}}"> --}}
    </div>
    <div class="sec-card-body bg-theme d-flex justify-content-between ">
        <h4 class="m-0 line-height-0"> {{  (Request::segment(1)== "en") ? Str::limit($book->ebook_name,14) : Str::limit($book->ebook_name_ar,14) ?? ''}}</h4>
        @if($book->book_type == 0)
        <a href="{{url( (Request::segment(1) == 'ar') ? 'ar/' : 'en/' )}}/EBook/{{$book->ebook_slug}}" class="btn btn-white">{{ __('basic.Read') }} <i class="fa fa-angle-double-right right-icon"></i></a>
        @else
        <a href="{{url( (Request::segment(1) == 'ar') ? 'ar/' : 'en/' )}}/EBook/{{$book->ebook_slug}}" class="btn btn-white">{{__('basic.Listen')}} <i class="fa fa-angle-double-right right-icon"></i></a>
        @endif
    </div>
</div>
