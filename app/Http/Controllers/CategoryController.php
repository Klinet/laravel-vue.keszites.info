<?php

namespace App\Http\Controllers;

use App\Category;
use App\Articles;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class CategoryController extends Controller
{

    public function getCats()
    {
        $cat = new Category();
        $cats = $cat->getAll();
        return response()->json($cats, 200);
    }


}
