<?php
namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Http\Controllers\BaseController as BaseController;
use App\Models\Division;
use Validator;
use DB;
use App\Http\Resources\BaseResource as BaseResource;
   
class DivisionController extends BaseController
{
    public function index()
    {
        $Division = Division::all();
        return $this->sendResponse(BaseResource::collection($Division), 'Division retrieved successfully.');
    }

    public function show($id)
    {
        $Division = Division::find($id)->leftJoin('status', 'division.status_id', '=', 'status.id');
        if (is_null($Division)) {
            return $this->sendError('Division not found.');
        }
        return $this->sendResponse(new BaseResource($Division), 'Division retrieved successfully.');
    }

    public function list(Request $request)
    {
        $input = $request->all();
        $limit = isset($input['limit']) ? $input['limit'] : 10;
        $sort = isset($input['sort']) ? $input['sort'] : 'DESC';
        $order = isset($input['order']) ? $input['order'] : 'id';

        $Division = Division::select('division.*', 'status.status')->leftJoin('status', 'division.status_id', '=', 'status.id');
        if(isset($input['src'])){
            $search = $input['src']."";
            $Division->where('division.division_name','LIKE', "%$search%");
        }
        $result = $Division->orderBy('division.'.$order, $sort)->paginate($limit);
        return $this->sendResponse(new BaseResource($result), 'Division retrieved successfully.');
    }

    public function store(Request $request)
    {
        $input = $request->all();
        $input['status_id'] = 1;
        $validator = Validator::make($input, [
            'division_name' => 'required'
        ]);
        if($validator->fails()){
            return $this->sendError('Validation Error.', $validator->errors());       
        }
        $Division = Division::create($input);
        return $this->sendResponse(new BaseResource($Division), 'Division created successfully.');
    } 

    public function update(Request $request)
    {
        $input = $request->all();

        $validator = Validator::make($input, [
            'division_name' => 'required'
        ]);
   
        if($validator->fails()){
            return $this->sendError('Validation Error.', $validator->errors());       
        }
   
        $Division = Division::find($input['id']);

        if (is_null($Division)) {
            return $this->sendError('Division not found.');
        }

        $Division->division_name = $input['division_name'];
        $Division->desc = $input['desc'];
        $Division->save();
        return $this->sendResponse(new BaseResource($Division), 'Division updated successfully.');
    }

    public function delete($id)
    {
        $Division = Division::find($id);
        $Division->delete();
        return $this->sendResponse([], 'Division deleted successfully.');
    }


}
