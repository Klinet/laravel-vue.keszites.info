<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Articles;
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
        $article->body = $request->body;
        $article->category_id = $request->category_id;
        $article->picture = $request->picture;
        $article->title = $request->title;
        $article->featured = $request->featured;
        $article->user_id = 1;
        $article->save();
        //$article->user_id = Auth::id();

        return response()->json($article, 200);
    }

    public function updateArticle(Request $request)
    {
        $article = new Articles();
        $article->id = $request->article_id;
        $article->picture = $request->photo_id;
        $article->update();

        return response()->json($article, 200);
    }

    public function editArticle($id)
    {
        $article = new Articles();
        $article->where('id', $id)->first();
        return $article;
    }

    public function saveArticle(Request $request)
    {
        return $this->createArticle($request);
    }

}
