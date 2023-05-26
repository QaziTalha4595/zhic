{{-- Home Shop-main-area  --}}
{{-- Top Searchable --}}


    <div class="book-card card my-3" style="direction: ltr;">
        <div class="img-bg" style="background-color: {{$book->ebook_bg_color}};"> <br>
            <img class="" src="{{url('/public/Files/E-Book-Cover')}}/{{$book->ebook_cover}}" alt="{{$book->ebook_cover}}" onerror="this.onerror=null;this.src='https://thumbs.dreamstime.com/b/blank-book-cover-over-white-background-shadow-65220894.jpg';">
        </div>

        <div class="card-body custom-card-body">
            <h5 class="card-title" > {{  (Request::segment(1)== "en") ? $book->ebook_name : $book->ebook_name_ar ?? ''}}</h5>
            <p class="card-text">{{  (Request::segment(1)== "en") ? $book->ebook_note : $book->ebook_note_ar ?? ''}}</p>

                @if($book->book_type == 0)
                <a href="{{url( (Request::segment(1) == 'ar') ? 'ar/' : 'en/' )}}EBook/{{$book->ebook_slug}}"  class="btn card-btn ">{{ __('basic.Read') }}   <i
                    class="fa fa-angle-double-right" style="color: white; font-size: 17px;"></i> </a>
                @else
                <a href="{{url( (Request::segment(1) == 'ar') ? 'ar/' : 'en/' )}}EBook/{{$book->ebook_slug}}" class="btn card-btn">{{__('basic.Listen')}}</a>
                @endif

        </div>

        <div class="book-card-overlay">
            <p> {{  (Request::segment(1)== "en") ? Str::limit($book->ebook_note, 80, $end='...') : Str::limit($book->ebook_note_ar, 80, $end='...')}} </p>

            @if($book->book_type == 0)
            <a href="{{url( (Request::segment(1) == 'ar') ? 'ar/' : 'en/' )}}/EBook/{{$book->ebook_slug}}">{{ __('basic.Read') }} <i
                    class="fa fa-angle-double-right right-icon"></i></a>
            @else
            <a href="{{url( (Request::segment(1) == 'ar') ? 'ar/' : 'en/' )}}/EBook/{{$book->ebook_slug}}">{{__('basic.Listen')}} <i
                    class="fa fa-angle-double-right right-icon"></i></a>
            @endif
        </div>
    </div>


{{-- <div class="book-card card my-3" style="direction: ltr;">
    <div class="sec-card-header" style="background-color: {{$book->ebook_bg_color}};border-radius: 10px;"><br>
        <div class="img-bg" style="background-color: {{$book->ebook_bg_color}};"> <br>
            <img class="" src="{{url('/public/Files/E-Book-Cover')}}/{{$book->ebook_cover}}" alt="{{$book->ebook_cover}}" onerror="this.onerror=null;this.src='https://thumbs.dreamstime.com/b/blank-book-cover-over-white-background-shadow-65220894.jpg';">
        </div>
    </div>

    <div class="card-body custom-card-body">
        <h5 class="card-title" > {{  (Request::segment(1)== "en") ? $book->ebook_name : $book->ebook_name_ar ?? ''}}</h5>
        <p class="card-text">{{  (Request::segment(1)== "en") ? $book->ebook_note : $book->ebook_note_ar ?? ''}}</p>

            @if($book->book_type == 0)
            <a href="{{url( (Request::segment(1) == 'ar') ? 'ar/' : 'en/' )}}EBook/{{$book->ebook_slug}}"  class="btn card-btn ">{{ __('basic.Read') }}   <i
                class="fa fa-angle-double-right" style="color: white; font-size: 17px;"></i> </a>
            @else
            <a href="{{url( (Request::segment(1) == 'ar') ? 'ar/' : 'en/' )}}EBook/{{$book->ebook_slug}}" class="btn card-btn">{{__('basic.Listen')}}</a>
            @endif

    </div>

    <div class="book-card-overlay">
        <p> {{  (Request::segment(1)== "en") ? Str::limit($book->ebook_note, 80, $end='...') : Str::limit($book->ebook_note_ar, 80, $end='...')}} </p>

        @if($book->book_type == 0)
        <a href="{{url( (Request::segment(1) == 'ar') ? 'ar/' : 'en/' )}}/EBook/{{$book->ebook_slug}}">{{ __('basic.Read') }} <i
                class="fa fa-angle-double-right right-icon"></i></a>
        @else
        <a href="{{url( (Request::segment(1) == 'ar') ? 'ar/' : 'en/' )}}/EBook/{{$book->ebook_slug}}">{{__('basic.Listen')}} <i
                class="fa fa-angle-double-right right-icon"></i></a>
        @endif
    </div>

</div> --}}
