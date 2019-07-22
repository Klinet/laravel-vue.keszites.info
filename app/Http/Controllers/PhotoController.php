<?php

namespace App\Http\Controllers;
use Illuminate\Http\Request;
use App\Photos;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Facades\Auth;
use Illuminate\Http\File;
class PhotoController extends Controller
{
    public function download($id)
    {
        $photo = Photos::find($id);
        return Storage::download($photo->path);
    }
    public function uploadPhoto(Request $request)
    {
        $this->validate($request, [
            'file' => 'required|mimes:jpg,png,jpeg'
        ]);
        if ($request->hasFile('file')) {
            $file = $request->file('file');
            $filename = time() . '.' . $file->getClientOriginalExtension();
            $path = $file->storeAs(
                'public', $filename
            );
            $photo = new Photos();
            $photo->user_id = Auth::id();
            $photo->file_name = $filename;
            $photo->save();
            return $this->viewAPhoto($filename, $photo->id);
            //return response()->json(['Upload Success']);
        }
    }
    public function readFile()
    {
        $files = scandir(storage_path('app/public'));
        $allFile = array_diff($files, ['.', '..', '.gitignore']);
        return response()->json($allFile, 200);
    }
    public function viewAPhoto($filename, $pid)
    {
        return response()->json(['message ' => 'Upload Success', 'file' => asset('storage/' . $filename), 'pid' => $pid]);
    }
    public function viewPhotos()
    {
    }
    public function viewUploadedPhoto($id)
    {
        $photo = Photos::find($id);
        return $photo;
    }
    public function update(Request $request, $id)
    {
        $photo = Photos::find($id);
        $photo->caption = $request->caption;
        $photo->save();
        return response()->json(true, 200);
    }
    public function delete($id)
    {
        $photo = Photos::find($id);
        $photo->delete();
        return response()->json(true, 200);
    }
}
