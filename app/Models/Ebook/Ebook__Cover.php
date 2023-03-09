<?php

namespace App\Models\Ebook;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class ebook__cover extends Model
{
    use HasFactory;
    protected $table = 'ebook__cover';

    protected $primaryKey = 'ebook__cover_id';

    protected $fillable = [
        'file_id',
        'ebook__cover',
        'ebook_position',
        'ebook_bg_color'
    ];
}
