<?php

namespace App\Models\Ebook;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Ebook extends Model
{
    use HasFactory;
    protected $table = 'ebook';


    protected $primaryKey = 'file_id';

    protected $fillable = [
        'category_id',
        'sub_cat_id',
        'third_cat_id',
        'language_id',
        'ebook_name',
        'ebook_isbn',
        'ebook_author',
        'ebook_note',
        'ebook_publisher',
        'publishing_date',
        'direction',
        'ebook_slug',
        'unique_id',
        'book_type',
        'downloadable',
        'printable',
        'searchable',
        'featured'
    ];
    public function category()
    {
        return $this->belongsTo('App\Models\Category','category_id','id');
    }
    public function subcategory()
    {
        return $this->belongsTo('App\Models\SubCategory','sub_cat_id','id');
    }
    public function thirdcategory()
    {
        return $this->belongsTo('App\Models\ThirdCategory','third_cat_id','id');
    }
    public function ebookcover()
    {
        return $this->belongsTo('App\Models\Ebook\Ebook__Cover','file_id','file_id');
    }
    public function ebookaudio()
    {
        return $this->belongsTo('App\Models\Ebook\Ebook__Audio','file_id','file_id');
    }
    public function language()
    {
        return $this->belongsTo('App\Models\Language','language_id','id');
    }
    public function ebooklocation()
    {
        return $this->belongsTo('App\Models\Ebook\Ebook_location','file_id','file_id');
    }
}
