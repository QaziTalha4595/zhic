<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Slider extends Model
{
    use HasFactory;
    protected $table = 'main_slider';
    protected $primaryKey = 'slider_id';
    protected $fillable = [
        'slider_heading',
        'slider_caption',
        'link',
        'slider_bg',
        'slider_position',
        'slider_img'
    ];
}
