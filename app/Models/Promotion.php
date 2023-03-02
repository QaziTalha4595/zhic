<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Promotion extends Model
{
    use HasFactory;

    protected $table = 'promotion';

    protected $fillable = [
        'category_id',
        'sub_cat_id',
        'promotion_attachment'
    ];
    public function category()
    {
        return $this->belongsTo('App\Models\Category','category_id','id');
    }
    public function subcategory()
    {
        return $this->belongsTo('App\Models\SubCategory','sub_cat_id','id');
    }
}
