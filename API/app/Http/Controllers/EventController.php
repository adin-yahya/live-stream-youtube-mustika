<?php
namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Http\Controllers\BaseController as BaseController;
use App\Models\Event;
use Validator;
use DB;
use App\Http\Resources\BaseResource as BaseResource;
   
class EventController extends BaseController
{
    public function active()
    {
        $Event = Event::where('status_id', '=', 4)->first();
        if(isset($Event)){
            $Event->substream = DB::select('SELECT B.*, C.division_name FROM substream B JOIN (
                SELECT event_id, division_id, min(id) as id FROM `substream` GROUP BY event_id,division_id
                ) A On A.id = B.id
                JOIN division C ON C.id = B.division_id where B.event_id = '.$Event->id.' ORDER BY B.division_id ASC');
            return $this->sendResponse(new BaseResource($Event), 'Event retrieved successfully.');
        } else {
            return $this->sendError('Event not found.');
        }
    }
    public function setActive($id)
    {
        $Event = Event::find($id);
        if (is_null($Event)) {
            return $this->sendError('Event not found.');
        }
        $activeEvent = Event::where('status_id', '=', 4)->first();
        if(isset($activeEvent)){
            $activeEvent->status_id = 3;
            $activeEvent->save();
        }
        $Event->status_id = 4;
        $Event->save();
        return $this->sendResponse(new BaseResource($Event), 'Event activated successfully.');
    }

    public function setInActive($id)
    {
        $Event = Event::find($id);
        if (is_null($Event)) {
            return $this->sendError('Event not found.');
        }
        $Event->status_id = 3;
        $Event->save();
        return $this->sendResponse(new BaseResource($Event), 'Event activated successfully.');
    }

    public function index()
    {
        $Event = Event::all();
        return $this->sendResponse(BaseResource::collection($Event), 'Event retrieved successfully.');
    }

    public function show($id)
    {
        $Event = Event::find($id);
        if (is_null($Event)) {
            return $this->sendError('Event not found.');
        }
        $Event->substream = DB::select('SELECT B.*, C.division_name FROM substream B JOIN (
            SELECT event_id, division_id, min(id) as id FROM `substream` GROUP BY event_id,division_id
            ) A On A.id = B.id
            JOIN division C ON C.id = B.division_id where B.event_id = '.$Event->id.' ORDER BY B.division_id ASC');
        return $this->sendResponse(new BaseResource($Event), 'Event retrieved successfully.');
    }

    public function list(Request $request)
    {
        $input = $request->all();
        $limit = isset($input['limit']) ? $input['limit'] : 10;
        $order = isset($input['order']) ? $input['order'] : 'date';
        $sort = isset($input['sort']) ? $input['sort'] : 'DESC';

        $Event = Event::select('event.*', 'status.status')->leftJoin('status', 'event.status_id', '=', 'status.id');
        if(isset($input['src'])){
            $search = $input['src']."";
            $Event->where('event.event_name','LIKE', "%$search%")
            ->orWhere('event.desc','LIKE', "%$search%");
        }
        $result = $Event->orderByRaw('DATE(date)=DATE(NOW()) DESC, DATE(date)<DATE(NOW()) DESC, DATE(date)>DATE(NOW()) ASC')->paginate($limit);
        return $this->sendResponse(new BaseResource($result), 'Event retrieved successfully.');
    }

    public function store(Request $request)
    {
        $input = $request->all();
        $input['status_id'] = 3;
        $validator = Validator::make($input, [
            'event_name' => 'required',
            'date' => 'required'
        ]);
        if($validator->fails()){
            return $this->sendError('Validation Error.', $validator->errors());       
        }

        $Event = Event::create($input);

        if(isset($Event)){
            foreach ($input['substream'] as $val) {
                $val['event_id'] = $Event['id'];
                $val['status_id'] = 1;
                DB::table('substream')->insert($val);
            };
        }
        return $this->sendResponse(new BaseResource($Event), 'Event created successfully.');
    } 

    public function update(Request $request)
    {
        $input = $request->all();

        $validator = Validator::make($input, [
            'event_name' => 'required',
            'date' => 'required',
        ]);
   
        if($validator->fails()){
            return $this->sendError('Validation Error.', $validator->errors());       
        }
   
        $Event = Event::find($input['id']);

        if (is_null($Event)) {
            return $this->sendError('Event not found.');
        }
        // if ($Event->status_id == 4) {
        //     return $this->sendError('Active Event can\'t be edited');
        // }

        $Event->event_name = $input['event_name'];
        $Event->desc = $input['desc'];
        $Event->date = $input['date'];
        $Event->meeting_link = $input['meeting_link'];
        $Event->livestream_link = $input['livestream_link'];
        $Event->sesion_limit_time = $input['sesion_limit_time'];
        $Event->waiting_time = $input['waiting_time'];
        $Event->save();

        foreach ($input['substream'] as $val) {
            DB::table('substream')->where('id','=',$val['id'])->update($val);
        };

        return $this->sendResponse(new BaseResource($Event), 'Event updated successfully.');
    }

    public function delete($id)
    {
        $Event = Event::find($id);
        DB::table('substream')->where('event_id','=',$id)->delete();
        $Event->delete();
        return $this->sendResponse([], 'Event deleted successfully.');
    }


}
