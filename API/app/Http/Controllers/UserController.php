<?php
namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Http\Controllers\BaseController as BaseController;
use App\Models\User;
use Validator;
use DB;
use App\Http\Resources\BaseResource as BaseResource;
use App\Imports\UsersImport;
use Maatwebsite\Excel\Facades\Excel;
   
class UserController extends BaseController
{
    public function index()
    {
        $User = User::all();
        return $this->sendResponse(BaseResource::collection($User), 'User retrieved successfully.');
    }

    public function show($id)
    {
        $User = User::find($id)
        ->leftJoin('status', 'users.status_id', '=', 'status.id')
        ->leftJoin('division', 'users.division_id', '=', 'division.id');
        if (is_null($User)) {
            return $this->sendError('User not found.');
        }
        return $this->sendResponse(new BaseResource($User), 'User retrieved successfully.');
    }

    public function list(Request $request)
    {
        $input = $request->all();
        $limit = isset($input['limit']) ? $input['limit'] : 10;
        $order = isset($input['order']) ? $input['order'] : 'id';
        $sort = isset($input['sort']) ? $input['sort'] : 'DESC';
        $division_id = isset($input['division_id']) ? $input['division_id'] : null;

        $User = User::select('users.*', 'status.status', 'division.division_name')->leftJoin('status', 'users.status_id', '=', 'status.id')->leftJoin('division', 'users.division_id', '=', 'division.id');
        if(isset($input['src'])){
            $search = $input['src']."";
            $User->where('users.name','LIKE', "%$search%")
            ->orWhere('users.nik','LIKE', "%$search%")
            ->orWhere('division.division_name','LIKE', "%$search%");
        }
        if(!empty($division_id)){
            $User->where('users.division_id','=', $division_id);
        }
        if(isset($input['id_not_in'])){
            $User->whereNotIn('users.id', $input['id_not_in']);
        }
        $result = $User->orderBy('users.'.$order, $sort)->paginate($limit);
        return $this->sendResponse(new BaseResource($result), 'User retrieved successfully.');
    }

    public function store(Request $request)
    {
        $input = $request->all();
        $validator = Validator::make($input, [
            'name' => 'required',
            'nik' => 'required|unique:users',
            'password' => 'required',
            'division_id' => 'required',
        ]);
        if($validator->fails()){
            return $this->sendError('Validation Error.', $validator->errors());       
        }
        $input['password'] = bcrypt($input['password']);
        $input['status_id'] = 1;
        $User = User::create($input);
        return $this->sendResponse(new BaseResource($User), 'User created successfully.');
    } 

    public function update(Request $request)
    {
        $input = $request->all();

        $validator = Validator::make($input, [
            'name' => 'required',
            'nik' => 'required',
            'division_id' => 'required',
        ]);
   
        if($validator->fails()){
            return $this->sendError('Validation Error.', $validator->errors());       
        }
   
        $User = User::find($input['id']);

        if (is_null($User)) {
            return $this->sendError('User not found.');
        }

        if(isset($input['password'])){
            $User->password = bcrypt($input['password']);
        }

        $User->name = $input['name'];
        $User->nik = $input['nik'];
        $User->division_id = $input['division_id'];
        $User->save();
        return $this->sendResponse(new BaseResource($User), 'User updated successfully.');
    }

    public function delete($id)
    {
        $User = User::find($id);
        $User->delete();
        return $this->sendResponse([], 'User deleted successfully.');
    }

    public function empty()
    {
        $User = User::where('division_id', '!=', -1);
        $User->delete();
        return $this->sendResponse([], 'User deleted successfully.');
    }

    public function import(Request $request)
    {
         $request->validate([
            'file' => 'required|file|mimes:xls,xlsx'
        ]);

        $path = $request->file('file');
        $data = Excel::import(new UsersImport, $path);

        return $this->sendResponse([], 'Uploaded successfully.');
    }


}
