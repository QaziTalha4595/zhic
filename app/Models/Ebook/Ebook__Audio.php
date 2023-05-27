<?php

namespace App\Models\Ebook;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Ebook__Audio extends Model
{
    use HasFactory;
    protected $table = 'ebook__audios';

    protected $primaryKey = 'audio_id';

    protected $fillable = [
        'file_id',
        'audio_title',
        'audio_file',
        'audio_link',
        'audio_position'
    ];
}
