<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use DB;

class Articles extends Model
{
    public $table = 'articles';

    protected $fillable = [
        'user_id', 'category_id', 'body', 'title', 'picture', 'featured'
    ];

    public function category()
    {
        return $this->belongsTo('App\Category', 'id');
    }

    public function photo()
    {
        return $this->belongsTo('App\Photos', 'picture');
    }

    public function getAll($limit,$offset)
    {
        return DB::table($this->table)
            ->join('photos','photos.id','=','articles.picture')
            ->select('photos.file_name','articles.id','articles.title','articles.body','articles.category_id','articles.featured','articles.created_at')
            ->offset($offset)
            ->limit($limit)
            ->orderBy('created_at', 'desc')
            ->get();
    }

}
