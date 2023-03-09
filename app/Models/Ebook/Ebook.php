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
        'downloadable',
        'printable',
        'searchable',
        'featured'
    ];
}
