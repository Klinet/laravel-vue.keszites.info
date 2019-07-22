<?php

namespace App;

use App\Category;
use Illuminate\Database\Eloquent\Model;
use DB;

class Articles extends Model
{
    public $table = 'articles';

    protected $fillable = [
        'user_id', 'category_nums', 'body', 'title', 'picture', 'featured'
    ];

    public function category()
    {
        return $this->belongsTo('App\Category', 'category_id');
    }

    public function photo()
    {
        return $this->belongsTo('App\Photos', 'picture');
    }

    public function getAll($limit,$offset)
    {

        $articles = DB::table($this->table)
            ->orderBy('created_at', 'DESC')
            ->join('photos', 'photos.id', '=', 'articles.picture')
            ->select('photos.file_name', 'articles.id', 'articles.title', 'articles.body', 'articles.category_nums', 'articles.category_id', 'articles.featured', 'articles.created_at')
            ->offset($offset)
            ->limit($limit)
            ->get();

        foreach ($articles as $item) {

            $category_nums = explode(',', $item->category_nums);
            $in_cats = $this->getCatTitle($category_nums);

            $item->categories[] = $in_cats;
        }

        return $articles;
    }

    public function getCatTitle($category_nums)
    {

        return DB::table('categories')->select('categories.id','categories.title','categories.color')
                ->whereIn('categories.id',$category_nums)
                ->get();

    }

    public function getByCat($limit,$offset,$cat_id)
    {
        $articles = DB::table($this->table)
            ->orderBy('created_at', 'DESC')
            ->join('photos', 'photos.id', '=', 'articles.picture')
            ->select('photos.file_name', 'articles.id', 'articles.title', 'articles.body', 'articles.category_nums', 'articles.category_id', 'articles.featured', 'articles.created_at')
            ->where('articles.category_nums', 'like', '%'.$cat_id.'%')
            ->offset($offset)
            ->limit($limit)
            ->get();

        foreach ($articles as $item) {

            $category_nums = explode(',', $item->category_nums);
            $in_cats = $this->getCatTitle($category_nums);

            $item->categories[] = $in_cats;
        }

        return $articles;
    }

    public function updateArticleById($id,$data)
    {
        return DB::table($this->table)
            ->where('id', $id)
            ->update($data);

    }

}
