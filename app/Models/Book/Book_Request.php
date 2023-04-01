<?php

namespace App\Models\Book;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Book_Request extends Model
{
    use HasFactory;

    protected $table = 'book_request';


    protected $primaryKey = 'request_id';

    // protected $fillable = [
    //     'category_id',
    //     'sub_cat_id',
    //     'third_cat_id',
    //     'language_id',
    //     'ebook_name',
    //     'ebook_isbn',
    //     'ebook_author',
    //     'ebook_note',
    //     'ebook_publisher',
    //     'publishing_date',
    //     'direction',
    //     'ebook_slug',
    //     'unique_id',
    //     'book_type',
    //     'downloadable',
    //     'printable',
    //     'searchable',
    //     'featured'
    // ];
}
