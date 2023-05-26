
@foreach($BookDetail as $book)
<div class="{{Request::get("mode") == "large" ? "col-xl-6 col-lg-6" : "col-xl-4 col-lg-4"}} col-md-6 col-sm-6">

    <!-- single-product-start -->
    @include('Cards.Card',['book'=> $book])
    <!-- single-product-end -->
</div>
@endforeach
