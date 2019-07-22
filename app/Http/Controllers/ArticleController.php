<?php

namespace App\Http\Controllers;

use App\Category;
use Illuminate\Http\Request;
use App\Articles;
use App\Categories;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;

class ArticleController extends Controller
{

    public function getArticles()
    {

        $article = new Articles();
        $articles = $article->getAll(6,0);
            
        return response()->json($articles, 200);
    }

    public function getArticlesByCat($cat_id)
    {
        $article = new Articles();
        $articles = $article->getByCat(6,0,$cat_id);

        return response()->json($articles, 200);
    }

    public function getArticlesByPaginate($id)
    {
        $page = $id;
        echo $page;
        if($page>1){
            $page = $page*6-6;
        }else{
            $page = 0;
        };
        $article = new Articles();
        $articles = $article->getAll(6,$page);
        return response()->json($articles, 200);

    }

    public function getAllArticles()
    {
        $article = new Articles();
        $articles = $article->getAll(10,0);


        return response()->json($articles, 200);
    }

    public function getArticleById($id)
    {
        $article = Articles::find(1);
        if (!isset($article->id)) {
            return response()->json(['error' => 401], 200);
        }

        //$article->save();
        return response()->json($article, 200);
    }

    public function createArticle(Request $request)
    {
        $article = new Articles();
        $cat_nums = implode(',', $request->categories);
        $article->body = $request->body;
        $article->category_nums = $cat_nums;
        //$article->picture = $request->picture;
        $article->picture = 5;
        $article->title = $request->title;
        $article->featured = $request->featured;
        $article->user_id = $request->user_id;
        $article->save();

        return response()->json($article, 200);
    }

    public function updateArticle(Request $request)
    {
        $article = new Articles();
        $cat_nums = implode(',', $request->categories);
        $request->category_nums = $cat_nums;
        $article->id = $request->article_id;

        $article_data = [
            'id' => $request->article_id,
            'body' => $request->body,
            'category_nums' => $cat_nums,
            'picture' => $request->picture,
            'title' => $request->title,
            'featured' => $request->featured,
            'user_id' => $request->user_id,
        ];

        $article->updateArticleById($article->id, $article_data);

        return response()->json($article, 200);
    }

    public function editArticle($id)
    {
        $article = new Articles();
        $article->where('id', $id)->first();
        return $article;
    }

}
