<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Photos extends Model
{
    public $table = 'photos';
    public function article()
    {
        return $this->belongsTo('App\Articles', 'picture');
    }
}
