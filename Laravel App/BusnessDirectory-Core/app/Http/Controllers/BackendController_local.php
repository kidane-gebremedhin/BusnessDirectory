<?php

namespace App\Http\Controllers;

use Andegna;
use DateTime;
use Illuminate\Http\Request;
use PDO;
use Hash;
use App\letter;
use App\category;
use App\office;
use App\offices_image;
use App\complex_building;
use App\user;

class BackendController_local extends Controller
{


    public function load_server_data(Request $request)
    {
       
       $complex_buildings=complex_building::orderBy("id", "desc")->get();
       $categories=category::orderBy("id", "desc")->get();
       $letters=letter::orderBy("id", "desc")->get();
       $offices=office::orderBy("id", "desc")->get();
       $offices_images=offices_image::orderBy("id", "desc")->get();

       $offices_encoded=array();
        foreach ($offices as $office) {
            $office->image=base64_encode($office->image);// mb_convert_encoding($office->image, 'UTF-8', 'UTF-8');
            array_push($offices_encoded, $office);
        }
       $offices_images_encoded=array();
        foreach ($offices_images as $office_img) {
            $office_img->image=base64_encode($office_img->image);//mb_convert_encoding($office_img->image, 'UTF-8', 'UTF-8');
            array_push($offices_images_encoded, $office_img);
        }

    $responseData=array(
        'type'=>'data',
        'complex_buildings'=>$complex_buildings->toArray(),
        'categories'=>$categories->toArray(),
        'letters'=>$letters->toArray(),
        'offices'=>$offices_encoded,//$offices->toArray(),
        'offices_images'=>$offices_images_encoded,

        );

    return response()->json($responseData);
    }

    public function create_letters(Request $request)
    {
        $this->validate($request, [
            'name'=>'required'
            ]);
        $letter=letter::where('name', '=', $request->name)->first();
        if($letter!=null){
           $data = array('type' => 'notification', 'success' => false, 'message'=>'Letter already exists');
            return response()->json($data);
        }

        $letter=new letter;
        $letter->name=$request->name;
        $letter->description=$request->description;
        $letter->createdByUserId=0;
        $letter->save();

    $data = array('type' => 'notification', 'success' => true, 'message'=>'1 row inserted successfully');
    return response()->json($data);
    }

    public function create_categories(Request $request)
    {
        $this->validate($request, [
            'name'=>'required',
            'buildingId'=>'required'
            ]);

        $category=category::where('name', $request->name)->where('buildingId', $request->buildingId)->first();
       if($category!=null){
            $data = array('type' => 'notification', 'success' => false, 'message'=>'Category already exists in this Building');
            return response()->json($data);
        }
        $category=new category;
        $category->name=$request->name;
        $category->buildingId=$request->buildingId;
        $category->description=$request->description;
        $category->createdByUserId=0;
        $category->save();

    $data = array('type' => 'notification', 'success' => true, 'message'=>'1 row inserted successfully');
    return response()->json($data);
    }

    public function create_offices(Request $request)
    {

        $office=office::where('name', '=', $request->name)->where('buildingId', $request->buildingId)->where('categoryId', $request->categoryId)->first();
        if($office!=null){
            $data = array('type' => 'notification', 'success' => false, 'message'=>'Office already exists in this Building');
            return response()->json($data);
        }

/*$image=$request->imageByteString;
$img = preg_replace('/^data:image\/\w+;base64,/', '', $image);
$type = explode(';', $image)[0];
$image_file = explode('/', $type)[1]; // png or jpg etc*/
/*
$data = array('type' => 'notification', 'success' => false, 'message'=>$image_file);
return response()->json($data);*/

// $data = array('type' => 'notification', 'success' => false, 'message'=>base64_decode($request->imageByteString), false);
// return response()->json($data);

$base64_str=$request->imageByteString;
// Create a new image resource
$img = \Image::make($base64_str);
$location='images/aaa.jpg';
// Resize
$img->resize(50, 50)->save($location);
$byte_arr=file_get_contents($location);

        $office=new office;
        $office->buildingId=$request->buildingId;
        $office->categoryId=$request->categoryId;
        $office->letterId=$request->letter;
        $office->name=$request->name;
        $office->level=$request->level;
       $office->image=$byte_arr;//base64_decode($request->imageByteString, false);//$request->imageByteString;
        $office->number=$request->number;
        $office->longitude=$request->longitude;
        $office->latitude=$request->latitude;
        $office->description=$request->description;
        $office->createdByUserId=0;
        $office->save();

        if($office->image!=null){
                $offices_image=new offices_image;
                $offices_image->officeId=$office->id;
                $offices_image->image=$office->image;
                $offices_image->save();
            }

    $data = array('type' => 'notification', 'success' => true, 'message'=>'1 row inserted successfully');
    return response()->json($data);
    }


    public function add_office_image(Request $request)
    {

        $this->validate($request, [
            'officeId'=>'required',
            'imageByteString'=>'required',
            ]);
       
        if($request->officeId==null || $request->imageByteString==null){
            $data = array('type' => 'notification', 'success' => false, 'message'=>'Please fill the fields');
            return response()->json($data);
        }

$base64_str=$request->imageByteString;
// Create a new image resource
$img = \Image::make($base64_str);
$location='images/aaa.jpg';
// Resize
$img->resize(50, 50)->save($location);
$byte_arr=file_get_contents($location);
        
        $offices_image=new offices_image;
        $offices_image->officeId=$request->officeId;
        $offices_image->image=$byte_arr;//base64_decode($request->imageByteString, false);//$request->image;
        $offices_image->save();
            
    $data = array('type' => 'notification', 'success' => true, 'message'=>'Office image added successfully');
    return response()->json($data);
    }

    public function create_complex_buildings(Request $request)
    {
        $this->validate($request, [
            'name'=>'required'
            ]);
 $complex_building=complex_building::where('name', '=', $request->name)->first();
        if($complex_building!=null){
            $data = array('type' => 'notification', 'success' => false, 'message'=>'Building already exists');
            return response()->json($data);
        }
        $complex_building=new complex_building;
        $complex_building->name=$request->name;
        $complex_building->description=$request->description;
        $complex_building->createdByUserId=0;
        $complex_building->save();
    
    $data = array('type' => 'notification', 'success' => true, 'message'=>'1 row inserted successfully');
    return response()->json($data);
    }

    public function remote_login(Request $request)
    {

        $username=$request->username;
        $password=$request->password;

        if($username==null || $password==null){
            $data = array('type' => 'notification', 'success' => false, 'message'=>'Login Failed! Please fill the fields.');
            return response()->json($data);
        }

        $this->validate($request, [
            'username'=>'required',
            'password'=>'required',
            ]);
            \App\Global_var::logAction($request, 'Login attempt |username:'.$username.'|password:'.$password.'|');

        $user=user::where('email', '=', $username)->first();
        if($user!=null && Hash::check($password, $user->password)){
            $data = array('type' => 'authentication', 'success' => true, 'message'=>'Login successful.');
            return response()->json($data);
        }
        
    $data = array('type' => 'notification', 'success' => false, 'message'=>'Login Failed! Incorrect Credentials');
    return response()->json($data);
    }


    
}
