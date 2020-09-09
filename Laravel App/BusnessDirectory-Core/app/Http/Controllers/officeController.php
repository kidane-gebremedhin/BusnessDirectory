<?php
namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\office;
use App\offices_image;
use Auth;
use DB;

class officeController extends Controller
{
    public $paginationSize;

    public function __construct(){
        $this->middleware('auth:web');
    
     $this->paginationSize=DB::table('settings')->first()!=null? DB::table('settings')->first()->paginationSize: 10;        

    }
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
public function changeStatus($id, Request $request){
    
        $office=office::find($id);
        $office->isApproved=($office->isApproved=='true'? 'false': 'true');
        $office->save();

        \App\Global_var::logAction($request, 'Office '.$office->name.' status changed to '.$office->status);
        return redirect()->route("offices.index");
    }

    public function index(Request $request)
    {
       
       $offices=office::orderBy("id", "desc")->paginate($this->paginationSize);

    \App\Global_var::logAction($request, 'Viewed offices List');
    if($request->ajax())
        return view("offices.ajax.index")->with('offices', $offices);

       return view("offices.http.index")->with('offices', $offices);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
public function create(Request $request){
    
    $complex_buildings=DB::table('complex_buildings')->pluck('name', 'id')->toArray();
    $categories=DB::table('categories')->pluck('name', 'id')->toArray();
    $letters=DB::table('letters')->pluck('name', 'id')->toArray();
    $levels=\App\Global_var::levels();
    if($request->ajax())
        return view('offices.ajax.create')->with('complex_buildings', $complex_buildings)->with('categories', $categories)->with('letters', $letters)->with('levels', $levels);

        return view('offices.http.create')->with('complex_buildings', $complex_buildings)->with('categories', $categories)->with('letters', $letters)->with('levels', $levels);
    }


    /**
     * Stock a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $this->validate($request, [
            'buildingId'=>'required',
            'categoryId'=>'required',
            'letterId'=>'required',
            'name'=>'required',
            'level'=>'required',
            'number'=>'required',
            'longitude'=>'required',
            'latitude'=>'required',
            ]);
 $office=office::where('name', '=', $request->name)->first();
        if($office!=null){
            if($request->ajax())
                return ['error', "Duplicate_Entry"];
            return back();
        }

        $image_file = $request->file('image');
        $image_contents = $image_file!=null? $image_file->openFile()->fread($image_file->getSize()):null;

$base64_str=file_get_contents($image_file);
// Create a new image resource
$img = \Image::make($base64_str);
$location='images/tempImg.jpg';
// Resize
$img->resize(150, 150)->save($location);
$byte_arr=file_get_contents($location);

        $office=new office;
        $office->buildingId=$request->buildingId;
        $office->categoryId=$request->categoryId;
        $office->letterId=$request->letterId;
        $office->name=$request->name;
        $office->level=$request->level;
        $office->image=$byte_arr;//base64_encode(file_get_contents($image_file));//base64_encode($image_contents);
        $office->number=$request->number;
        $office->longitude=$request->longitude;
        $office->latitude=$request->latitude;
        $office->description=$request->description;
        $office->createdByUserId=Auth::guard('web')->user()->id;
        $office->save();

        if($image_contents!=null){
                $offices_image=new offices_image;
                $offices_image->officeId=$office->id;
                $offices_image->image=$office->image;//$byte_arr;//$image_contents;
                $offices_image->save();
            }

    \App\Global_var::logAction($request, 'Created new office ID '.$office->id);

    /*$data = array('type' => 'notification', 'success' => true, 'message'=>'1 row inserted successfully');
    return response()->json($data);*/
        return redirect()->route("offices.index");
    }

    public function add_office_image($officeId, Request $request){
        $image_file = $request->file('image');
        $image_contents = $image_file!=null? $image_file->openFile()->fread($image_file->getSize()):null;
        
$base64_str=file_get_contents($image_file);
// Create a new image resource
$img = \Image::make($base64_str);
$location='images/tempImg.jpg';
// Resize
$img->resize(150, 150)->save($location);
$byte_arr=file_get_contents($location);

        if($image_contents!=null){
                $offices_image=new offices_image;
                $offices_image->officeId=$officeId;
                $offices_image->image=$byte_arr;//$image_contents;
                $offices_image->save();
            }
    
    \App\Global_var::logAction($request, 'Added new office Image');
   return redirect()->route("offices.show", $officeId);
    }
    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function office_images($id, Request $request){
        $offices_image=offices_image::find($id);
        return response()->make($offices_image->image, 200, array('Content-Type' => 'image/jpeg'));
    }

    public function show($id, Request $request)
    {
        $office=office::find($id);
        $image=response()->make($office->image, 200, array('Content-Type' => 'image/jpeg'));

    \App\Global_var::logAction($request, 'Viewed office ID '.$office->id.' details');
        if($request->ajax())
            return view("offices.ajax.show")->with('office', $office)->with('image', $image);
        return view("offices.http.show")->with('office', $office)->with('image', $image);
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id, Request $request)
    {
    $office=office::find($id);
    $complex_buildings=DB::table('complex_buildings')->pluck('name', 'id')->toArray();
    $categories=DB::table('categories')->pluck('name', 'id')->toArray();
    $letters=DB::table('letters')->pluck('name', 'id')->toArray();
    $levels=\App\Global_var::levels();

    if($request->ajax())
        return view('offices.ajax.edit')->with('office', $office)->with('complex_buildings', $complex_buildings)->with('categories', $categories)->with('letters', $letters)->with('levels', $levels);

        return view('offices.http.edit')->with('office', $office)->with('complex_buildings', $complex_buildings)->with('categories', $categories)->with('letters', $letters)->with('levels', $levels);
   }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        $old_office=office::where('name', '=', $request->name)->first();
        if($old_office!=null && $old_office->id!=$id){
            if($request->ajax())
                return ['error', "Duplicate_Entry"];
            return back();
        }

       $this->validate($request, [
            'buildingId'=>'required',
            'categoryId'=>'required',
            'letterId'=>'required',
            'name'=>'required',
            'level'=>'required',
            'number'=>'required',
            'longitude'=>'required',
            'latitude'=>'required',
            ]);
        

        $image_file = $request->file('image');
        $image_contents = $image_file!=null? $image_file->openFile()->fread($image_file->getSize()):null;

$base64_str=file_get_contents($image_file);
// Create a new image resource
$img = \Image::make($base64_str);
$location='images/tempImg.jpg';
// Resize
$img->resize(150, 150)->save($location);
$byte_arr=file_get_contents($location);

        $office=office::find($id);
        $office->buildingId=$request->buildingId;
        $office->buildingId=$request->buildingId;
        $office->categoryId=$request->categoryId;
        $office->letterId=$request->letterId;
        $office->name=$request->name;
        $office->level=$request->level;
        $office->image=$byte_arr;//$image_contents;
        $office->number=$request->number;
        $office->longitude=$request->longitude;
        $office->latitude=$request->latitude;
        $office->description=$request->description;
        $office->createdByUserId=Auth::guard('web')->user()->id;
        $office->save();

        if($image_contents!=null){
                $offices_image=new offices_image;
                $offices_image->officeId=$office->id;
                $offices_image->image=$office->image;//$byte_arr;//$image_contents;
                $offices_image->save();
            }


    \App\Global_var::logAction($request, 'Updated office ID '.$office->id.'');
   return redirect()->route("offices.show", $id);
   }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function delete($id, Request $request)
    {
       $office=office::find($id);
       if($request->ajax())
        return view('offices.ajax.delete-confirm')->with('office', $office);
        
        return view('offices.http.delete-confirm')->with('office', $office);
    }
    public function destroy($id, Request $request)
    {
        $office=office::find($id);

        $offices_images=offices_image::whereIn('id', $office->images->pluck('id'));
        foreach ($offices_images as $office_image) {
            $office_image->delete();
        }

        $office->delete();

    \App\Global_var::logAction($request, 'Deleted office ID '.$office->id);
        return redirect()->route('offices.index');
    }

}
