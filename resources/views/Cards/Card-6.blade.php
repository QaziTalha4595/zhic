<div class="card book-card-1 my-3 bg-round" style="min-height: 0; padding-bottom: 0;">
    <div class="img-bg" style="background-color: {{$book->ebook_bg_color}};">
        <img class="" src="{{url('/public/Files/E-Book-CoverImg')}}/{{$book->ebook__cover}}"
            alt="{{$book->file_name}}">
    </div>
    <div class="sec-card-body bg-theme bg-bottom-round text-white d-flex justify-content-between">
        <!-- <div class="product-rating text-left mb-2">
            <ul>
                @for($i = 0; $i < 5; $i++) @if(round($book->avg_rating) > $i)
                    <li><a href="#"><i class="fa fa-star"></i></a></li>
                    @else
                    <li><a href="#"><i class="fa fa-star" style="color:grey;"></i></a></li>
                    @endif
                    @endfor
                    <li>{{round($book->avg_rating)}}.0</li>
            </ul>
        </div> -->
        <h5 class="text-white m-0 pt-1" style="font-size:16px;  font-weight: 100;"> {{  Request::is('en') ? Str::limit($book->file_name,14) : Str::limit($book->file_name_ar,14) ?? ''}}</h5>
        <!-- <p>{{Str::limit($book->file_note,29)}}</p> -->
        @if($book->book_type == 0)
        <a href="{{url('/EBook')}}/{{$book->ebook_slug}}" class="btn btn-white">Read</a>
        @else
        <a href="{{url('/EBook')}}/{{$book->ebook_slug}}" class="btn btn-white">Listen</a>
        @endif
    </div>
</div>
