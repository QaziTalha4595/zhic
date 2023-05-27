<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class ThirdCategory extends Model
{
    use HasFactory;
    protected $table = 'category__third';

    protected $fillable = [
        'category_id',
        'sub_category_id',
        'third_category_name',
        'third_category_slug'
    ];
    public function category()
    {
        return $this->belongsTo('App\Models\Category','category_id','category_id');
    }
    public function subcategory()
    {
        return $this->belongsTo('App\Models\SubCategory','sub_category_id','sub_cat_id');
    }
}
