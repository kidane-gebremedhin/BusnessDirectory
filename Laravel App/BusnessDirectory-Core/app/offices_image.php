<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class offices_image extends Model
{
   protected $table="offices_images";

  	public function createdByUser(){
    	return $this->belongsTo('App\User', 'createdByUserId', 'id');
    }
  	public function updatedByUser(){
    	return $this->belongsTo('App\User', 'updatedByUserId', 'id');
    }
}
