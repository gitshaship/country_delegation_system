<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Activity extends Model
{
    protected $table = 'activities';
    public $timestamps = false;

    protected $fillable = ['skill','title','description','startdate','enddate','participants'];

}
