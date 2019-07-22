<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use DB;

class Category extends Model
{

    public $table = 'categories';

    public function articles()
    {
        return $this->hasMany('App\Articles', 'category_id', 'id');
    }

    public function getAll()
    {
        return DB::table($this->table)
            ->select('categories.id','categories.title')
            ->orderBy('created_at', 'desc')
            ->get();
    }

    public function getById($id)
    {
        return DB::table($this->table)
            ->select('categories.id','categories.title')
            ->where('id','=',$id)
            ->get();
    }

}
