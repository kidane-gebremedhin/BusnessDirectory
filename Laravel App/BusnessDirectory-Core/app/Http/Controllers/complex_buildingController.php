<?php
namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\complex_building;
use App\category;
use App\office;
use App\offices_image;
use App\letter;

use Auth;
use DB;

class complex_buildingController extends Controller
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

    public function index(Request $request)
    {
       
       $complex_buildings=complex_building::orderBy("id", "desc")->paginate($this->paginationSize);

    \App\Global_var::logAction($request, 'Viewed complex_buildings List ');

    if($request->ajax())
        return view("complex_buildings.ajax.index")->with('complex_buildings', $complex_buildings);

       return view("complex_buildings.http.index")->with('complex_buildings', $complex_buildings);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
public function create(Request $request){
    
        
    if($request->ajax())
        return view('complex_buildings.ajax.create');

        return view('complex_buildings.http.create');
    }


    /**
     * Stock a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        /*$this->validate($request, [
            'name'=>'required'
            ]);
 $complex_building=complex_building::where('name', '=', $request->name)->first();
        if($complex_building!=null){
            if($request->ajax())
                return ['error', "Duplicate_Entry"];
            return back();
        }*/
        $complex_building=new complex_building;
        $complex_building->name=$request->name;
        $complex_building->description=$request->description;
        $complex_building->createdByUserId=Auth::guard('web')->user()!=null? Auth::guard('web')->user()->id:0;
        $complex_building->save();
    \App\Global_var::logAction($request, 'Created new complex_building ID '.$complex_building->id);

    
    /*$data = array('type' => 'notification', 'success' => true, 'message'=>'1 row inserted successfully');
    return response()->json($data);*/

        return redirect()->route("complex_buildings.index");
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id, Request $request)
    {
        $complex_building=complex_building::find($id);
    \App\Global_var::logAction($request, 'Viewed complex_building ID '.$complex_building->id.' details');
        if($request->ajax())
            return view("complex_buildings.ajax.show")->with('complex_building', $complex_building);
        return view("complex_buildings.http.show")->with('complex_building', $complex_building);
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id, Request $request)
    {
    $complex_building=complex_building::find($id);
        
    if($request->ajax())
        return view('complex_buildings.ajax.edit')->with('complex_building', $complex_building);

        return view('complex_buildings.http.edit')->with('complex_building', $complex_building);
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
        $complex_building=complex_building::where('name', '=', $request->name)->first();
        if($complex_building!=null && $complex_building->id!=$id){
            if($request->ajax())
                return ['error', "Duplicate_Entry"];
            return back();
        }

       $this->validate($request, [
            'name'=>'required'
            ]);
        $complex_building=complex_building::find($id);
        $complex_building->name=$request->name;
        $complex_building->description=$request->description;
        $complex_building->updatedByUserId=Auth::guard('web')->user()->id;
        $complex_building->save();

    \App\Global_var::logAction($request, 'Updated complex_building ID '.$complex_building->id.'');
   return redirect()->route("complex_buildings.show", $id);
   }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function delete($id, Request $request)
    {
       $complex_building=complex_building::find($id);
       if($request->ajax())
        return view('complex_buildings.ajax.delete-confirm')->with('complex_building', $complex_building);
        
        return view('complex_buildings.http.delete-confirm')->with('complex_building', $complex_building);
    }
    public function destroy($id, Request $request)
    {
        $complex_building=complex_building::find($id);
        $complex_building->delete();

    \App\Global_var::logAction($request, 'Deleted complex_building ID '.$complex_building->id);
        return redirect()->route('complex_buildings.index');
    }

}
