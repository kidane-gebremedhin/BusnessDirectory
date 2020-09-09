<?php

namespace App;

use Illuminate\Notifications\Notifiable;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Carbon\Carbon;
use Auth;

class User extends Authenticatable
{

    use Notifiable;

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'email', 'password', 'roleId',
    ];

    /**
     * The attributes that should be hidden for arrays.
     *
     * @var array
     */
    protected $hidden = [
        'password', 'remember_token',
    ];

    public function logs(){
        return $this->hasMany('App\log', 'userId', 'id');
    }
    public function documents(){
      return $this->hasMany('App\document', 'createdByUserId', 'id')->orderBy('id', 'desc');
    }
   public static function currentUser(){
        return Auth::guard('web')->user();
   }

   public function isGranted_ID($routeName, $id){
        if($this->isAdmin())
            return true;
   }
   public function isGranted($routeName){
        if($this->isAdmin())
            return true;

        $actionType=substr($routeName, strpos($routeName, '.')+1);
        $entityName="";
        if($actionType=='create' || $actionType=='show' || $actionType=='edit' || $actionType=='update' || $actionType=='index' || $actionType=='store' || $actionType=='destroy'){
            
            $entityName=substr($routeName, 0, strpos($routeName, '.'));
            $pathUrl=str_replace('.', '-', $routeName);

        }
        else{
            $resource=Resource::where('routeName', '=', $routeName)->first();
            if($resource!=null){
                $pathUrl=$resource->entityName;
                if(!$this->isAllowed_ToAccess(null, $pathUrl))
                    return false;
            }
        }

    $resource=Resource::where('routeName', '=', $entityName)->first();
    if($resource!=null){
        if(!$this->isAllowed_ToAccess(null, $pathUrl))
            return false;
    }
    
    return true;
   }

    public function resources(){
        return $this->belongsToMany('App\Resource', 'user_resource', 'userId', 'resourceId')->withPivot('roleId');
    }

    public function role(){
        return $this->belongsTo('App\Role', 'roleId', 'id');
    }
    public function username(){
        return $this->email;//name
    }

    public function region(){
        return $this->belongsTo('App\region', 'regionId', 'id');
    }
    public function zone(){
        return $this->belongsTo('App\zone', 'zoneId', 'id');
    }
    public function wereda(){
        return $this->belongsTo('App\wereda', 'weredaId', 'id');
    }
    public function subWereda(){
        return $this->belongsTo('App\Sub_wereda', 'subWeredaId', 'id');
    }
    public function department(){
        return $this->belongsTo('App\department', 'departmentId', 'id');
    }

    public function isCrime_Department(){
        return true;

        if($this->isAdmin())
            return true;
        return $this->department!=null && ($this->department->name=="ገበን" || $this->department->name=="ገበንን ፍታብሄርን");
    }
    public function isCivil_Case_Department(){
        return true;
        
        if($this->isAdmin())
            return true;
        return $this->department!=null && ($this->department->name=="ፍታብሄር" || $this->department->name=="ገበንን ፍታብሄርን");
    }
    public function zones(){
        return $this->belongsToMany('App\zone', 'user_zone_wereda_kebelles', 'userId', "zoneId")->withPivot('zoneId');
    }
    public function weredas(){
        return $this->belongsToMany('App\wereda', 'user_zone_wereda_kebelles', 'userId', "weredaId")->withPivot('weredaId');
    }
    public function tabyas(){
        return $this->belongsToMany('App\tabya', 'user_zone_wereda_kebelles', 'userId', "tabyaId")->withPivot('tabyaId');
    }

    public function kebelles(){
        return $this->belongsToMany('App\kebelle', 'user_zone_wereda_kebelles', 'userId', "kebelleId")->withPivot('kebelleId');
    }

    public function createdByUser(){
        return $this->belongsTo('App\User', 'createdByUserId', 'id');
    }
    public function updatedByUser(){
        return $this->belongsTo('App\User', 'updatedByUserId', 'id');
    }
    
    public function isAdmin(){
        return $this->role!=null && $this->role->isAdmin();
    }
    public function isZone_Admin(){
       
        return $this->isZone() && $this->role!=null && $this->role->roleName=="superadmin";
    }
    public function isSubWereda(){
        return $this->brki!=null && $this->brki->keyWord=="Sub_wereda";
    }
    public function isWereda(){
        return $this->brki!=null && $this->brki->keyWord=="Wereda";
    }
    public function isZone(){
        return $this->brki!=null && $this->brki->keyWord=="Zone";
    }
    public function isRegion(){
        //Consider Above Region As Region
        if($this->isBreaking_Region() || $this->isBreaking_Federal() || $this->isHF_Region() || $this->isHF_Federal() || $this->isFederal()){
            return true;
            }
    return $this->brki!=null && $this->brki->keyWord=="Region";
    }


// Access control
    public function isAllowed_ToAccess($request, $pathUrl=""){
        return true;


   if($this->role==null)
        return false;
        if($this->isAdmin())
            return true;

   if($pathUrl==""){
     if($request==null)
        return false; 
      $pathUrl=$request->path(); //$request->url();  
   }


    $separatorPos=strpos($pathUrl, '-');
    if($separatorPos>0){
    $entityName=substr($pathUrl, 0, $separatorPos);
            $slashPos=strpos($pathUrl, '/')>0? strpos($pathUrl, '/'): strlen($pathUrl);

            $actionType=substr($pathUrl, $separatorPos+1, $slashPos-$separatorPos-1);
            $actionType=$actionType=='create'? 'store': $actionType;
            $actionType=$actionType=='edit'? 'update': $actionType;
            $actionType=$actionType=='confirm_delete'? 'destroy': $actionType;

            $resource=Resource::where('entityName', '=', $entityName)->first();
            if($resource!=null){
            if(!$this->role->hasPermission($resource->id, $actionType)){
               return false;
            }
            }
        }
        else{
            $actionType='allow_action';
            $slashPos=strpos($pathUrl, '/')>0? strpos($pathUrl, '/'): strlen($pathUrl);
            $entityName=substr($pathUrl, 0, $slashPos);
            
            $resource=Resource::where('entityName', '=', $entityName)->first();
            if($resource!=null){
            if(!$this->role->hasPermission($resource->id, $actionType)){
               return false;
            }
            }
        }
        return true;
    }


}
