<?php
namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Http\Controllers\BaseController as BaseController;
use App\Models\Status;
use Validator;
use App\Http\Resources\BaseResource as BaseResource;

class StatusController extends BaseController
{
    public function index()
    {
        $status = Status::all();
        return $this->sendResponse(new BaseResource($status), 'Status retrieved successfully.');
    }
}
