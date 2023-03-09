<div class="card book-card my-3">
    <div class="img-bg" style="background-color: {{$book->ebook_bg_color}};">
        <img class="" src="{{url('/public/Files/E-Book-CoverImg')}}/{{$book->ebook__cover}}"
            alt="{{$book->file_name}}">
    </div>
    <div class="card-body custom-card-body">
    <div class="product-rating text-left mb-2">
        <ul>
            @for($i = 0; $i < 5; $i++)
            @if(round($book->avg_rating) > $i)
            <li><a href="#"><i class="fa fa-star"></i></a></li>
            @else
            <li><a href="#"><i class="fa fa-star" style="color:grey;"></i></a></li>
            @endif
            @endfor
            <li>{{round($book->avg_rating)}}.0</li>
        </ul>
    </div>
        <h5 class="card-title"> {{  Request::is('Home/en') ? $book->file_name : $book->file_name_ar ?? ''}}</h5>
        <p class="card-text">{{  Request::is('Home/en') ? $book->file_note : $book->file_note_ar ?? ''}}</p>
        @if($book->book_type == 0)
        <a href="{{url('/')}}/{{$book->ebook_slug}}/Detail" class="btn card-btn">Read</a>
        @else
        <a href="{{url('/')}}/{{$book->ebook_slug}}/Detail" class="btn card-btn">Listen</a>
        @endif
    </div>
    <div class="book-card-overlay">
        <p> {{Str::limit($book->file_note, 80, $end='...')}} </p>

        @if($book->book_type == 0)
        <a href="{{url('/')}}/{{$book->ebook_slug}}/Detail">Read More <i
                class="fas fa-angle-double-right right-icon"></i></a>
        @else
        <a href="{{url('/')}}/{{$book->ebook_slug}}/Detail">Listen <i
                class="fas fa-angle-double-right right-icon"></i></a>
        @endif
    </div>
</div>
