<div class="card book-card my-3" style="width: 287.5px; margin-right:40px;">
    <div class="img-bg" style="background-color: {{$book->ebook_bg_color}};"> <br>
        <img src="{{url('/public/Files/E-Book-CoverImg')}}/{{$book->ebook__cover}}"  onerror="this.onerror=null;this.src='https://www.shutterstock.com/image-illustration/jpeg-blank-notebook-isolated-on-600w-74102503.jpg';">
        {{-- <img class="" src="{{url('/public/Files/E-Book-CoverImg')}}/{{$book->ebook__cover}}"
            alt="{{$book->file_name}}"> --}}
    </div>
    <hr>
    <div class="card-body custom-card-body" >

        <h5 class="card-title" > {{  (Request::segment(1) == "en") ? $book->file_name : $book->file_name_ar ?? ''}}</h5>

        <p class="card-text">{{  (Request::segment(1) == "en") ? $book->file_note : $book->file_note_ar ?? ''}}</p>
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
        {{-- {{  Request::is('en') ? Str::limit($book->file_note, 80, $end='...') : Str::limit($book->file_note_ar, 80, $end='...')}}  --}}
        <p > {{  (Request::segment(1) == "en") ? Str::limit($book->file_note, 90, $end='...') : Str::limit($book->file_note_ar, 90, $end='...')}}</p>

        @if($book->book_type == 0)
        <a href="{{url( (Request::segment(1) == 'ar') ? 'ar/' : 'en/' )}}/EBook/{{$book->ebook_slug}}">{{ __('basic.Read') }}  <i
                class="fa fa-angle-double-right right-icon"></i></a>
        @else
        <a href="{{url( (Request::segment(1) == 'ar') ? 'ar/' : 'en/' )}}/EBook/{{$book->ebook_slug}}">{{__('basic.Listen')}} <i
                class="fa fa-angle-double-right right-icon"></i></a>
        @endif
    </div>
</div>
