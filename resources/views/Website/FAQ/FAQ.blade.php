@extends('Layout')
@section('content')
<link rel="stylesheet" href="{{url('public/web/assets/css/faq.css')}}">
<div class="faq-section">

    <div class="my-5 text-center">
        <h3>FAQ</h3>
    </div>
    <div class="box">
        <div class="header  text-light p-3">
            Header <span id="span"><i class="fas fa-angle-right"></i></span>
        </div>
        <div class="content border">
            <p class="p-3">Lorem ipsum dolor sit amet consectetur, adipisicing elit. Magni alias vitae doloremque error
                vero, dolores praesentium maxime molestiae impedit eligendi accusantium iusto omnis eos tenetur,
                adipisci nam sit eveniet voluptatum.</p>
        </div>
        <div class="header_2 text-light p-3">
            Header <span id="span_2"><i class="fas fa-angle-right"></i></span>
        </div>
        <div class="content_2 border">
            <p class="p-3">Lorem, ipsum dolor sit amet consectetur adipisicing elit. Nam harum doloribus amet porro
                repellat magni dolor corrupti alias illum eum.</p>
        </div>
        <div class="header_3 text-light p-3">
            Header <span id="span_3"><i class="fas fa-angle-right"></i></span>
        </div>
        <div class="content_3 border">
            <p class="p-3">Lorem, ipsum dolor sit amet consectetur adipisicing elit. Nam harum doloribus amet porro
                repellat magni dolor corrupti alias illum eum.</p>
        </div>
    </div>
</div>

<script>
let content = document.querySelector('.content')

let span = document.getElementById('span')

let span_2 = document.getElementById('span_2')

let span_3 = document.getElementById('span_3')

document.querySelector('.header').addEventListener('click', () => {
    if (content.style.maxHeight) {
        content.style.maxHeight = null
        span.style.transform = 'rotate(0)'
    } else {
        span_2.style.transform = 'rotate(0)'
        span_3.style.transform = 'rotate(0)'
        span.style.transform = 'rotate(90deg)'
        content.style.maxHeight = content.scrollHeight + 'px'
        content_3.style.maxHeight = null
        content_2.style.maxHeight = null
    }
})


let content_2 = document.querySelector('.content_2')

document.querySelector('.header_2').addEventListener('click', () => {
    if (content_2.style.maxHeight) {
        span_2.style.transform = 'rotate(0)'
        content_2.style.maxHeight = null
    } else {
        span.style.transform = 'rotate(0)'
        span_3.style.transform = 'rotate(0)'
        span_2.style.transform = 'rotate(90deg)'
        content_2.style.maxHeight = content.scrollHeight + 'px';
        content.style.maxHeight = null;
        content_3.style.maxHeight = null
    }
})

let content_3 = document.querySelector('.content_3')

document.querySelector('.header_3').addEventListener('click', () => {
    if (content_3.style.maxHeight) {
        span_3.style.transform = 'rotate(0)'
        content_3.style.maxHeight = null
    } else {
        span_2.style.transform = 'rotate(0)'
        span.style.transform = 'rotate(0)'
        span_3.style.transform = 'rotate(90deg)'
        content_3.style.maxHeight = content.scrollHeight + 'px'
        content.style.maxHeight = null;
        content_2.style.maxHeight = null
    }
})
</script>
@endsection
