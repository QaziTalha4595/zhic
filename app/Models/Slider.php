<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Slider extends Model
{
    use HasFactory;
    protected $table = 'sliders';

    protected $fillable = [
        'slider_heading',
        'slider_caption',
        'slider_link',
        'slider_bg_color',
        'slider_position',
        'slider_image'
    ];
}
