<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Book_Shelf extends Model
{
    use HasFactory;
    protected $table = 'book_shelf';

    protected $primaryKey = 'book_shelf_id';

    protected $fillable = [
        'file_id',
        'book_position'
    ];
    public function ebook()
    {
        return $this->belongsTo('App\Models\Ebook\Ebook','file_id','file_id');
    }
    public function ebook__cover()
    {
        return $this->belongsTo('App\Models\Ebook\Ebook__Cover','file_id','file_id');
    }
}
