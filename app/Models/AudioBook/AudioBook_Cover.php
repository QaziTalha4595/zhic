<?php

namespace App\Models\AudioBook;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class AudioBook_Cover extends Model
{
    use HasFactory;
    protected $table = 'audiobook__cover';


    protected $primaryKey = 'audio_book_cover_id';

    protected $fillable = [
        'file_id',
        'audio_book_cover',
        'audio_book_position',
        'audio_book_bg_color'
    ];
}
