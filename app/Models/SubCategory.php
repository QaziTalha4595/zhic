<?php

namespace App\Models;

use Eloquent;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class SubCategory extends Model
{
    use HasFactory;
    protected $table = 'category__sub';

    protected $fillable = [
        'category_id','sub_category_name'
    ];
    protected $guarded = [];
    public function category()
    {
        return $this->belongsTo('App\Models\Category','category_id','id');
    }
    
}
