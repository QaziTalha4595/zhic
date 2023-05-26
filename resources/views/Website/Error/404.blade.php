@extends('Layout')
@section('content')
<div class="book-not-found">
  <div class="img">
     <img src="{{url('public/web/assets/img/error-404.jpg')}}" alt="">
  </div>
  <div class="boot-text">
    <h3>This book is not available .</h3>
    <a href="{{url('/')}}" class="btn-1">Back To Home</a>
  </div>
</div>
@endsection
