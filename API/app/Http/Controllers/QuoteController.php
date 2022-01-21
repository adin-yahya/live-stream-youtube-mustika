<?php
namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Http\Controllers\BaseController as BaseController;
use App\Models\Quote;
use Validator;
use DB;
use App\Http\Resources\BaseResource as BaseResource;
   
class QuoteController extends BaseController
{
    public function index()
    {
        $Quote = Quote::all();
        return $this->sendResponse(BaseResource::collection($Quote), 'Quote retrieved successfully.');
    }

    public function show($id)
    {
        $Quote = Quote::find($id)->leftJoin('status', 'quote.status_id', '=', 'status.id')->leftJoin('users', 'quote.users_id', '=', 'users.id');
        if (is_null($Quote)) {
            return $this->sendError('Quote not found.');
        }
        return $this->sendResponse(new BaseResource($Quote), 'Quote retrieved successfully.');
    }

    public function list(Request $request)
    {
        $input = $request->all();
        $offset = isset($input['offset']) ? $input['offset'] : 0;
        $limit = isset($input['limit']) ? $input['limit'] : 10;
        $order = isset($input['order']) ? $input['order'] : 'id';
        $sort = isset($input['sort']) ? $input['sort'] : 'DESC';

        if(!isset($input['event_id'])){
            return $this->sendError('Event ID Tidak Ditemukan', []);       
        }

        $Quote = Quote::select('quote.*', 'status.status', 'users.name')->leftJoin('status', 'quote.status_id', '=', 'status.id')->leftJoin('users', 'quote.users_id', '=', 'users.id');
        $Quote->where('quote.event_id','=', $input['event_id']);

        if(isset($input['src'])){
            $search = $input['src']."";
            $Quote->where('quote.quote','LIKE', "%$search%");
            $Quote->where('users.name','LIKE', "%$search%");
        }
        $result = $Quote->orderBy('quote.'.$order, $sort)->paginate($limit);
        return $this->sendResponse(new BaseResource($result), 'Quote retrieved successfully.');
    }

    public function store(Request $request)
    {
        $input = $request->all();
        $input['status_id'] = 3;
        $validator = Validator::make($input, [
            'quote' => 'required',
            'users_id' => 'required',
            'event_id' => 'required'
        ]);
        if($validator->fails()){
            return $this->sendError('Validation Error.', $validator->errors());       
        }
        $Quote = Quote::create($input);
        return $this->sendResponse(new BaseResource($Quote), 'Quote created successfully.');
    } 

    public function update(Request $request)
    {
        $input = $request->all();

        $validator = Validator::make($input, [
            'quote' => 'required'
        ]);
   
        if($validator->fails()){
            return $this->sendError('Validation Error.', $validator->errors());       
        }
   
        $Quote = Quote::find($input['id']);

        if (is_null($Quote)) {
            return $this->sendError('Quote not found.');
        }

        $Quote->quote = $input['quote'];
        $Quote->save();
        return $this->sendResponse(new BaseResource($Quote), 'Quote updated successfully.');
    }

    public function delete($id)
    {
        $Quote = Quote::find($id);
        $Quote->delete();
        return $this->sendResponse([], 'Quote deleted successfully.');
    }

    public function empty()
    {
        $Quote = Quote::truncate();
        // $Quote->truncate();
        return $this->sendResponse([], 'Quote deleted successfully.');
    }


}
