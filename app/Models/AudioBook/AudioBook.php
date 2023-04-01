<?php

namespace App\Models\AudioBook;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class AudioBook extends Model
{
    use HasFactory;
    protected $table = 'audiobook';

    protected $primaryKey = 'audio_book_id';

    // protected $guarded = [];

    protected $fillable = [
        'category_id',
        'sub_cat_id',
        'audio_book_name',
        'audio_book_isbn',
        'audio_book_author',
        'audio_book_notes'
    ];
    public function audiobookcover()
    {
        return $this->belongsTo('App\Models\AudioBook\AudioBook_Cover','audio_book_id','file_id');
    }
    public function category()
    {
        return $this->belongsTo('App\Models\Category','category_id','id');
    }
    public function subcategory()
    {
        return $this->belongsTo('App\Models\SubCategory','sub_cat_id','id');
    }
}
