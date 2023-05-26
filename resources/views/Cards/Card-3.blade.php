{{-- Home Card --}}

<div class="sec-card text-center bg-top-round" style="margin:8px 0;">
    <div class="sec-card-header bg-top-round" style="background-color: {{$book->ebook_bg_color}};"><br>
        {{-- <img src="{{url('/public/Files/E-Book-CoverImg')}}/{{$book->ebook__cover}}"
                                onerror="this.onerror=null;this.src='https://www.shutterstock.com/image-illustration/jpeg-blank-notebook-isolated-on-600w-74102503.jpg';"> --}}

        <img class="bg-top-round" src="{{url('/public/Files/E-Book-CoverImg')}}/{{$book->ebook__cover}}"
            alt="{{$book->file_name}}"><br>
    </div>
    <span class="text-dark text-center">  {{  (Request::segment(1)== "en") ? Str::limit($book->file_name,20) : Str::limit($book->file_name_ar,20) ?? ''}}</span>
    <div class="sec-card-body bg-theme p-0">
        @if($book->book_type == 0)
        <a href="{{url( (Request::segment(1) == 'ar') ? 'ar/' : 'en/' )}}/EBook/{{$book->ebook_slug}}" class="btn card-btn btn-block m-0 bg-bottom-round" style="border-radius:0;">{{ __('basic.Read') }}</a>
        @else
        <a href="{{url( (Request::segment(1) == 'ar') ? 'ar/' : 'en/' )}}/EBook/{{$book->ebook_slug}}" class="btn card-btn btn-block m-0 bg-bottom-round">{{__('basic.Listen')}}</a>
        @endif
    </div>
</div>
