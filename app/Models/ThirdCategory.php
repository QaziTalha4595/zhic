<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class ThirdCategory extends Model
{
    use HasFactory;
    protected $table = 'category__third';
    protected $primaryKey = 'third_cat_id';
    protected $fillable = [
        'category_id',
        'sub_cat_id',
        'third_cat_name',
        'third_cat_name_ar',
        'third_cat_slug'
    ];
    public function category()
    {
        return $this->belongsTo('App\Models\Category','category_id','category_id');
    }
    public function subcategory()
    {
        return $this->belongsTo('App\Models\SubCategory','sub_cat_id','sub_cat_id');
    }
}
