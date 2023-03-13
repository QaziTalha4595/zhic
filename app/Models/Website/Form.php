<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Form extends Model
{
    use HasFactory;

    protected $table = 'book_request';

    protected $fillable = [
        'book_name',
        'user_name',
        'user_email',
        'user_nationality',
        'user_spoken',
        'user_message'
    ];
}
