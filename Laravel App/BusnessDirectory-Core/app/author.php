<?php

namespace App;

use Illuminate\Notifications\Notifiable;
use Illuminate\Foundation\Auth\User as Authenticatable;

class author extends Authenticatable
{

    use Notifiable;

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    
    /**
     * The attributes that should be hidden for arrays.
     *
     * @var array
     */
    protected $table="authors";

    public function documents(){
        return $this->hasMany('App\document', 'authorId', 'id');
    }
    public function createdByUser(){
        return $this->belongsTo('App\User', 'createdByUserId', 'id');
    }
    public function updatedByUser(){
        return $this->belongsTo('App\User', 'updatedByUserId', 'id');
    }
    public function deletedByUser(){
        return $this->belongsTo('App\User', 'deletedByUserId', 'id');
    }
}
