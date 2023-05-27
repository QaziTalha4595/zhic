<div class="card book-card my-3" style="width: 287.5px; margin-right:40px;">
    <div class="img-bg" style="background-color: {{$book->ebook_bg_color}};"> <br>
        <img src="{{url('/public/Files/E-Book-Cover')}}/{{$book->ebook_cover}}"  onerror="this.onerror=null;this.src='https://www.shutterstock.com/image-illustration/jpeg-blank-notebook-isolated-on-600w-74102503.jpg';">
        {{-- <img class="" src="{{url('/public/Files/E-Book-Cover')}}/{{$book->ebook_cover}}"
            alt="{{$book->ebook_name}}"> --}}
    </div>
    <hr>
    <div class="card-body custom-card-body" >

        <h5 class="card-title" > {{  (Request::segment(1) == "en") ? $book->ebook_name : $book->ebook_name_ar ?? ''}}</h5>

        <p class="card-text">{{  (Request::segment(1) == "en") ? $book->ebook_note : $book->ebook_note_ar ?? ''}}</p>
        <div class="text-right">
            @if($book->book_type == 0)
            <a href="{{url( (Request::segment(1) == 'ar') ? 'ar/' : 'en/' )}}/EBook/{{$book->ebook_slug}}">{{ __('basic.Read') }}  <i
                class="fa fa-angle-double-right right-icon"></i></a>
            @else
            <a href="{{url( (Request::segment(1) == 'ar') ? 'ar/' : 'en/' )}}/EBook/{{$book->ebook_slug}}" class="btn card-btn">{{__('basic.Listen')}}</a>
            @endif
        </div>

    </div>
    <div class="book-card-overlay">
        {{-- {{  Request::is('en') ? Str::limit($book->ebook_note, 80, $end='...') : Str::limit($book->ebook_note_ar, 80, $end='...')}}  --}}
        <p > {{  (Request::segment(1) == "en") ? Str::limit($book->ebook_note, 90, $end='...') : Str::limit($book->ebook_note_ar, 90, $end='...')}}</p>

        @if($book->book_type == 0)
        <a href="{{url( (Request::segment(1) == 'ar') ? 'ar/' : 'en/' )}}/EBook/{{$book->ebook_slug}}">{{ __('basic.Read') }}  <i
                class="fa fa-angle-double-right right-icon"></i></a>
        @else
        <a href="{{url( (Request::segment(1) == 'ar') ? 'ar/' : 'en/' )}}/EBook/{{$book->ebook_slug}}">{{__('basic.Listen')}} <i
                class="fa fa-angle-double-right right-icon"></i></a>
        @endif
    </div>
</div>
