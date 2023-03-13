<div class="col-lg-6 ">
    <div class="meaning-q-card bg-round">
        <div class="meaning-q-card-img" style="background: {{$book->ebook_bg_color}};">
            <img src="{{url('/public/Files/E-Book-CoverImg')}}/{{$book->ebook__cover}}"
                alt="{{$book->file_name}}">
        </div>
        <div class="meaning-q-card-body d-flex justify-content-between bg-theme">
            <h3 class="mb-0 pt-1"> {{  Request::is('en') ? $book->file_name : $book->file_name_ar ?? ''}}</h3>
            @if($book->book_type == 0)
            <a href="{{url('/EBook')}}/{{$book->ebook_slug}}" class="btn btn-white">Read</a>
            @else
            <a href="{{url('/EBook')}}/{{$book->ebook_slug}}" class="btn btn-white">Listen</a>
            @endif
        </div>
    </div>
</div>
