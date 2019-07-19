<?php

namespace App\Http\Controllers;

use App\Category;
use App\Forum;
use App\Post;
use App\User;
use Illuminate\Http\Request;

class CategoryController extends Controller
{

    public function getCats()
    {
        $cats = Category::all();
        return response()->json($cats, 200);
    }


}
