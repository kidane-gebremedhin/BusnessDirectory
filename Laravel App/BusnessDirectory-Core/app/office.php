<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class office extends Model
{
   protected $table="offices";


    public function images(){
        return $this->hasMany('App\offices_image', 'officeId', 'id');
    }
    public function building(){
      return $this->belongsTo('App\complex_building', 'buildingId', 'id');
    }
  	public function category(){
    	return $this->belongsTo('App\category', 'categoryId', 'id');
    }
  	public function letter(){
    	return $this->belongsTo('App\letter', 'letterId', 'id');
    }
  	public function createdByUser(){
    	return $this->belongsTo('App\User', 'createdByUserId', 'id');
    }
  	public function updatedByUser(){
    	return $this->belongsTo('App\User', 'updatedByUserId', 'id');
    }
}
