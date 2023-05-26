<?php

namespace App\Models\Feedback;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class feedback extends Model
{
    use HasFactory;

    protected $table = 'feedback';


    protected $primaryKey = 'feedback_id';

    public function ebook()
    {
        return $this->belongsTo('App\Models\Ebook\Ebook','file_id','file_id');
    }
}
