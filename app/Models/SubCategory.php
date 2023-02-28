<?php

namespace App\Models;

use Eloquent;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class SubCategory extends Model
{
    use HasFactory;
    protected $table = 'sub_categories';

    protected $fillable = [
        'category_id',
        'sub_category_name'
    ];
    public function category()
    {
        return $this->belongsTo('App\Models\Category','category_id','id');
    }
}
