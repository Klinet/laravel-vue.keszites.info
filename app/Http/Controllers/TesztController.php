<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class TesztController extends Controller
{
    public function index()
    {
        return view('teszt');
    }
}
