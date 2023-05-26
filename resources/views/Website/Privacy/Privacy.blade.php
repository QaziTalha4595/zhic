@extends('Layout')
@section('content')
<link rel="stylesheet" href="{{url('public/web/assets/css/faq.css')}}">
<div class="faq-section">

    <div class="my-5 text-center">
        <h3>Privacy Policy</h3>
    </div>
    <div class="box">
        <div class="card">
            <div class="card-body">
                <p class="mb-50">Protecting your data is our top priority as per our strict standards to protect your
                    rights as a
                    consumer. This notice clarifies the way we deal with your personal data including but not limited to
                    payment and other information provided while using our Website or App to reach service (herein
                    referred
                    to as Service). Please read the following carefully to understand our practices regarding data. As
                    using
                    our services, you agree to dealing with data in compliance with our privacy policy. The second
                    person
                    pronoun (or the like) is a signal of address to you as a person or legal person as the case may be.

                </p>

                <h4>Information we collect about you and other sources</h4> <br>
                <h6>We may collect and process the following data:</h6>
                <ul class="mb-50">
                    <li>Protecting your data is our top priority as per our strict standards to protect your
                    rights as a
                    consumer. This notice clarifies the way we deal with your personal data including but not limited to
                    payment and other information provided while using our Website or App to reach service (herein
                    referred
                    to as Service). Please read the following carefully to understand our practices regarding data. As
                    using
                    our services, you agree to dealing with data in compliance with our privacy policy. The second
                    person
                    pronoun (or the like) is a signal of address to you as a person or legal person as the case may be.</li>
                </ul>
                <h4>Information we collect about you and other sources</h4> <br>
                <h6>We may collect and process the following data:</h6>
                <ul>
                    <li>Protecting your data is our top priority as per our strict standards to protect your
                    rights as a
                    consumer. This notice clarifies the way we deal with your personal data including but not limited to
                    payment and other information provided while using our Website or App to reach service (herein
                    referred
                    to as Service). Please read the following carefully to understand our practices regarding data. As
                    using
                    our services, you agree to dealing with data in compliance with our privacy policy. The second
                    person
                    pronoun (or the like) is a signal of address to you as a person or legal person as the case may be.</li>
                </ul>
            </div>
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
