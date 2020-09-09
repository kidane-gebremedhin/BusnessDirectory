<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class category extends Model
{
   protected $table="categories";


  	public function building(){
    	return $this->belongsTo('App\complex_building', 'buildingId', 'id');
    }
  	public function createdByUser(){
    	return $this->belongsTo('App\User', 'createdByUserId', 'id');
    }
  	public function updatedByUser(){
    	return $this->belongsTo('App\User', 'updatedByUserId', 'id');
    }

}
