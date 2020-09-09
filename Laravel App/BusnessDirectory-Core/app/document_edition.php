<?php

namespace App;

use Illuminate\Notifications\Notifiable;
use Illuminate\Foundation\Auth\User as Authenticatable;

class document_edition extends Authenticatable
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
    protected $table="document_editions";

    public function isVideo_Audio(){
        if($this->document==null)
            return false;

        return $this->document->category=='Audio' || $this->document->category=='Video';
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
        if($this->document==null)
            return false;

        return $this->document->category=='Text_Document' || $this->document->category=='Image';
    }
    public function getFileName(){
        $file_path = $this->path;
        $rev_path=strrev($file_path);
        $filename=substr($rev_path, 0, strpos($rev_path, '/'));
        $filename=strrev($filename);
        $filename=substr($filename, strpos($filename, '-')+1);
        return $filename;
    }

    public function document(){
        return $this->belongsTo('App\document', 'documentId', 'id');
    }
    public function publisher(){
        return $this->belongsTo('App\publisher', 'publisherId', 'id');
    }
    public function createdByUser(){
        return $this->belongsTo('App\User', 'createdByUserId', 'id');
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
