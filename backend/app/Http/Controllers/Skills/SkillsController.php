<?php

namespace App\Http\Controllers\Skills;

use App\Activity;
use App\Http\Controllers\Controller;
use App\Skill;

class SkillsController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth:api');
    }

    public function listView()
    {

        $skillList = Skill::all();
        $response = array();
        foreach ($skillList as $skill) {
            $activity = Activity::where('skill', $skill->id)->first();
            if ($activity) {
                $result['id'] = $skill->id;
                $result['skill_name'] = $skill->skill_name;
                array_push($response, $result);
            }
        }
        return response($response, 200);
    }
}
