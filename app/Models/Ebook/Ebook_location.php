<?php

namespace App\Models\Ebook;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Ebook_location extends Model
{
    use HasFactory;
    protected $table = 'ebook__location';


    protected $primaryKey = 'location_id';

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
    public function ebook()
    {
        return $this->belongsTo('App\Models\Ebook\Ebook','file_id','file_id');
    }
}
