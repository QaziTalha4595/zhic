<?php

namespace App\Models;

use Eloquent;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class SubCategory extends Model
{
    use HasFactory;
    protected $table = 'category__sub';
    protected $primaryKey = 'sub_cat_id';
    protected $fillable = [
        'category_id','sub_cat_name','sub_cat_name_ar','slug'
    ];
    public function category()
    {
        return $this->belongsTo('App\Models\Category','category_id','category_id');
    }

}
