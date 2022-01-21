<?php
namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Http\Controllers\BaseController as BaseController;
use Validator;
use App\Http\Resources\BaseResource as BaseResource;
use Illuminate\Routing\UrlGenerator;
use Illuminate\Support\Facades\Storage;

class UploadController extends BaseController
{
    public function index(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'file' => 'required'
        ]);

        if($validator->fails()){
            return $this->sendError('Validation Error.', $validator->errors());       
        }

        $file = $request->file('file');

        $filenameWithExt = $file->getClientOriginalName();
        $filename = pathinfo($filenameWithExt, PATHINFO_FILENAME);
        $extension = $file->getClientOriginalExtension();
        $filenameSimpan = $filename.'_'.time().'.'.$extension;

        $path = $file->storeAs('public/speaker_image', $filenameSimpan);
        $url = url('/');
        $p = Storage::url($path);
        return $this->sendResponse($url.''.$p, 'Image Uploaded successfully.');
    }
}
