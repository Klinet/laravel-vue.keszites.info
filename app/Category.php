<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Category extends Model
{

    public $table = 'categories';
    public function article()
    {
        return $this->belongsTo('App\Articles', 'category_id');
    }
}
