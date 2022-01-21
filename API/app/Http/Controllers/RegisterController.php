<?php
   
namespace App\Http\Controllers;
   
use Illuminate\Http\Request;
use App\Http\Controllers\BaseController as BaseController;
use App\Models\User;
use Illuminate\Support\Facades\Auth;
use Validator;
   
class RegisterController extends BaseController
{
    public function register(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'name' => 'required',
            'nik' => 'required|integer|size:16',
            'password' => 'required',
            're_password' => 'required|same:password',
        ]);
   
        if($validator->fails()){
            return $this->sendError('Validation Error.', $validator->errors());       
        }
   
        $input = $request->all();
        $input['password'] = bcrypt($input['password']);
        $user = User::create($input);
        $success['token'] =  $user->createToken('MustikaApps')->accessToken;
        $success['name'] =  $user->name;
   
        return $this->sendResponse($success, 'User register successfully.');
    }
    
    public function login(Request $request)
    {
        if(Auth::attempt(['nik' => $request->nik, 'password' => $request->password])){ 
            $user = Auth::user(); 
            $success['token'] =  $user->createToken('MustikaApps')-> accessToken; 
            $success['id'] =  $user->id;
            $success['name'] =  $user->name;
            $success['division_id'] =  $user->division_id;
            if($user->division_id != -1){
                $division =  \DB::table('division')->find($user->division_id);
                $success['division_name'] = $division->division_name;
            } else {
                $success['division_name'] = 'Administrator';
            }
   
            return $this->sendResponse($success, 'User login successfully.');
        } 
        else{ 
            return $this->sendError('Unauthorized.', ['error'=>'Unauthorized']);
        } 
    }
}