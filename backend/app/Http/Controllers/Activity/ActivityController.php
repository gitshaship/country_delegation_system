<?php

namespace App\Http\Controllers\Activity;

use App\Activity;
use App\Http\Controllers\Controller;
use App\Skill;
use App\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class ActivityController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth:api');
    }

    public function create(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'skill' => 'required|integer',
            'title' => 'required|string',
            'description' => 'required|string',
            'startdate' => 'required|date_format:Y-m-d',
            'enddate' => 'required|date_format:Y-m-d|after:startdate',
            'participants' => 'required',
        ]);

        if ($validator->fails() || !$this->isValidSkill($request) || !$this->checkUsersWithSameSkill($request)) {
            return response(["message" => "Data cannot be processed"], 422);
            //return response($validator->errors(), 422);
        }

        $activity = Activity::create($request->toArray());
        $response = ['message' => "created successfully"];
        return response($response, 200);
    }

    private function isValidSkill(Request $request)
    {
        $skill = Skill::find($request->toArray()['skill']);
        return $skill ? true : false;

    }

    private function checkUsersWithSameSkill(Request $request)
    {

        $participants = explode(',', $request->toArray()['participants']);
        $same_skill = true;
        foreach ($participants as $user) {
            $selected_user = User::where('id', $user)->first();
            $skill = $selected_user ? $selected_user->skill : 0;
            if ($request->toArray()['skill'] != $skill) {
                $same_skill = false;
            }
        }
        return $same_skill;
    }

    public function update(Request $request, $id)
    {
        $validator = Validator::make($request->all(), [
            'skill' => 'integer',
            'title' => 'string',
            'description' => 'string',
            'startdate' => 'date_format:Y-m-d',
            'enddate' => 'date_format:Y-m-d|after:startdate',

        ]);
        $activity = Activity::find($id);
        if ($validator->fails()) {
            return response(["message" => "Data cannot be processed"], 422);
        }
        $activity->update($request->all());
        $response = ['message' => 'updated successfully'];
        return response($response, 200);

    }

    // check all the participants have the same skill

    public function destroy($id)
    {
        $activity = Activity::find($id);
        if ($activity) {
            $activity->delete();
            $response = ['message' => "update successfully"];
            return response($response, 200);
        } else {
            return response(["message" => "Data cannot be processed"], 422);
        }
    }

    public function listView($skillId)
    {
        try {
            $skill = Skill::find($skillId);
            $activityList = Activity::where('skill', $skillId)->orderby('startdate', 'ASC')->get();
            $response = array();
            foreach ($activityList as $activity) {
                $result['skill_id'] = $skill->id;
                $result['skill_name'] = $skill->skill_name;
                $result['title'] = $activity->title;
                $result['description'] = $activity->description;
                $result['startdate'] = $activity->startdate;
                $result['enddate'] = $activity->enddate;
                $participants = explode(',', $activity->participants);
                $participantsArr = array();
                foreach ($participants as $member) {
                    $user = User::find($member);
                    if ($user) {
                        $participant['id'] = $user->id;
                        $participant['name'] = $user->name;
                        $participant['profile'] = $user->profile;
                        $participant['skill'] = $user->skill;
                        array_push($participantsArr, $participant);
                    }

                }
                $result['participants'] = $participantsArr;
                array_push($response, $result);

            }
            return response($response, 200);
        } catch (Throwable $e) {
            report($e);
            return response(["message" => "Data cannot be processed"], 422);
        }
    }


}
