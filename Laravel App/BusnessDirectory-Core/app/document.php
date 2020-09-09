<?php

namespace App;

use Illuminate\Notifications\Notifiable;
use Illuminate\Foundation\Auth\User as Authenticatable;

class document extends Authenticatable
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
    protected $table="documents";

    public function isVideo_Audio(){
        return $this->category=='Audio' || $this->category=='Video';
    }
    public function isVideo(){
        if($this->document==null)
            return false;

        return $this->document->category=='Video';
    }
    public function isAudio(){
        if($this->document==null)
            return false;

        return $this->document->category=='Audio';
    }
    public function isText_Image(){
        return $this->category=='Text_Document' || $this->category=='Image';
    }
    public function editions(){
      return $this->hasMany('App\document_edition', 'documentId', 'id')->where('isDeleted', 'false')->orderBy('id', 'desc');
    }
    public function publishers(){
      return $this->hasMany('App\publisher', 'documentId', 'id')->where('isDeleted', 'false')->orderBy('id', 'desc');
    }
    public function createdByUser(){
        return $this->belongsTo('App\User', 'createdByUserId', 'id');
    }
    public function author(){
        return $this->belongsTo('App\author', 'authorId', 'id');
    }
    public function updatedByUser(){
        return $this->belongsTo('App\User', 'updatedByUserId', 'id');
    }
    public function approvedByUser(){
        return $this->belongsTo('App\User', 'approvedByUserId', 'id');
    }
    public function archivedByUser(){
        return $this->belongsTo('App\User', 'archivedByUserId', 'id');
    }
    public function deletedByUser(){
        return $this->belongsTo('App\User', 'deletedByUserId', 'id');
    }
}
