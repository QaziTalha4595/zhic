<?php

namespace App\Models\Ebook;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Ebook__Cover extends Model
{
    use HasFactory;
    protected $table = 'ebook__cover';

    protected $primaryKey = 'ebook__cover_id';

    protected $fillable = [
        'file_id',
        'ebook_cover',
        'ebook_position',
        'ebook_bg_color'
    ];

    public function ebookaudio()
    {
        return $this->belongsTo('App\Models\Ebook\Ebook__Audio','file_id','file_id');
    }
}
