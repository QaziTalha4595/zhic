@extends('Admin.AdminLayout')
@section('content')
<script src="{{url('public/plugins/jquery/jquery.min.js')}}"></script>
<link href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.13/css/select2.min.css" rel="stylesheet">
<script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.13/js/select2.min.js"></script>

<div class="col-lg-8 mx-auto">
    <div class="card">
        <div class="card-header">
            <h3>E-Book Update</h3>
        </div>
        <div class="card-body">
            <form id="FileStoreForm">
                <input type="hidden" name="_token" value="{{ csrf_token() }}" />
                <input type="hidden" name="file_id" id="file_id" value="" />
                <div class="form-group">
                    <label>Category</label>
                    <select class="form-control select2" name="category_id" id="category_id" style="width:100%;">
                        @foreach($Categories as $category)
                        <option selected value="{{$category->category_id}}">
                            {{$category->category_name}}</option>
                        @endforeach
                    </select>
                </div>
                <div class="form-group">
                    <label>Sub Category</label>
                    <select class="form-control select2" name="sub_cat_id" id="sub_cat_id" style="width:100%;">
                        <option selected disabled>Select</option>
                    </select>
                </div>
                <div class="form-group">
                    <lable class="text-bold">Book Title</lable>
                    <input type="text" class="form-control form-control-user border-primary required " id="file_name"
                        name="file_name" autocomplete=" off" value="{{$Ebook->ebook_name}}">
                </div>
                <div class="form-group">
                    <lable class="text-bold">Book ISBN</lable>
                    <input type="text" class="form-control form-control-user border-primary" id="file_isbn"
                        name="file_isbn" autocomplete=" off" value="{{$Ebook->ebook_isbn}}">
                </div>
                <div class="form-group">
                    <lable class="text-bold">Book Author</lable>
                    <input type="text" class="form-control form-control-user border-primary" id="file_author"
                        name="file_author" autocomplete=" off" value="{{$Ebook->ebook_author}}">
                </div>
                <div class="form-group">
                    <lable class="text-bold">Book Short Notes</lable>
                    <textarea class="form-control border-primary" id="file_note"
                        name="file_note">{{$Ebook->ebook_note}}</textarea>
                </div>
                <div class="form-group">
                    <lable class="text-bold">Book</lable>
                    <input type="file" class="form-control form-control-user border-primary required"
                        id="file_attachment" name="file_attachment" autocomplete=" off" accept=".pdf">
                </div>
                <div class="form-group">
                    <lable class="text-bold">Book Thumbnail</lable>
                    <input type="file" class="form-control form-control-user border-primary" id="file_thumbnail"
                        name="file_thumbnail" autocomplete=" off" accept="image/*">
                </div>
            </form>
        </div>
        <div class="error mx-3 text-center">
            <div id="show_error"></div>
        </div>
        <div class="card-footer text-center">
            <button type="button" id="btnSubmit" onclick="EbookUpdate()" class="btn btn-primary">Update</button>
        </div>
    </div>
</div>

<!-- Main Script -->
<script>

</script>
<!-- Main Script -->
@endsection