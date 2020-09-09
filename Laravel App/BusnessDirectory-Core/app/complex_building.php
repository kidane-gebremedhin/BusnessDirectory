<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class complex_building extends Model
{
   protected $table="complex_buildings";

  	public function createdByUser(){
    	return $this->belongsTo('App\User', 'createdByUserId', 'id');
    }
  	public function updatedByUser(){
    	return $this->belongsTo('App\User', 'updatedByUserId', 'id');
    }
}
