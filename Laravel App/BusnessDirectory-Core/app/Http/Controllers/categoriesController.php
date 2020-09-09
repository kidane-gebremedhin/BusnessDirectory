<?php
namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\category;
use Auth;
use DB;

class categoriesController extends Controller
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
       
       $categories=category::orderBy("id", "desc")->paginate($this->paginationSize);

    \App\Global_var::logAction($request, 'Viewed categories List');
    if($request->ajax())
        return view("categories.ajax.index")->with('categories', $categories);

       return view("categories.http.index")->with('categories', $categories);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
public function create(Request $request){
    
       $complex_buildings=DB::table('complex_buildings')->pluck('name', 'id')->toArray();
    if($request->ajax())
        return view('categories.ajax.create')->with('complex_buildings', $complex_buildings);

        return view('categories.http.create')->with('complex_buildings', $complex_buildings);
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
            'name'=>'required',
            'buildingId'=>'required'
            ]);
 $category=category::where('name', '=', $request->name)->first();
        if($category!=null){
            if($request->ajax())
                return ['error', "Duplicate_Entry"];
            return back();
        }
        $category=new category;
        $category->name=$request->name;
        $category->buildingId=$request->buildingId;
        $category->description=$request->description;
        $category->createdByUserId=Auth::guard('web')->user()->id;
        $category->save();
    \App\Global_var::logAction($request, 'Created new category ID '.$category->id);

    /*$data = array('type' => 'notification', 'success' => true, 'message'=>'1 row inserted successfully');
    return response()->json($data);*/
        return redirect()->route("categories.index");
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id, Request $request)
    {
        $category=category::find($id);
    \App\Global_var::logAction($request, 'Viewed category ID '.$category->id.' details');
        if($request->ajax())
            return view("categories.ajax.show")->with('category', $category);
        return view("categories.http.show")->with('category', $category);
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id, Request $request)
    {
    $category=category::find($id);
    $complex_buildings=DB::table('complex_buildings')->pluck('name', 'id')->toArray();
    
    if($request->ajax())
        return view('categories.ajax.edit')->with('category', $category)->with('complex_buildings', $complex_buildings);

        return view('categories.http.edit')->with('category', $category)->with('complex_buildings', $complex_buildings);
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
        $category=category::where('name', '=', $request->name)->first();
        if($category!=null && $category->id!=$id){
            if($request->ajax())
                return ['error', "Duplicate_Entry"];
            return back();
        }

       $this->validate($request, [
            'name'=>'required',
            'buildingId'=>'required'
            ]);
        $category=category::find($id);
        $category->name=$request->name;
        $category->buildingId=$request->buildingId;
        $category->description=$request->description;
        $category->updatedByUserId=Auth::guard('web')->user()->id;
        $category->save();

    \App\Global_var::logAction($request, 'Updated category ID '.$category->id.'');
   return redirect()->route("categories.show", $id);
   }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function delete($id, Request $request)
    {
       $category=category::find($id);
       if($request->ajax())
        return view('categories.ajax.delete-confirm')->with('category', $category);
        
        return view('categories.http.delete-confirm')->with('category', $category);
    }
    public function destroy($id, Request $request)
    {
        $category=category::find($id);
        $category->delete();

    \App\Global_var::logAction($request, 'Deleted category ID '.$category->id);
        return redirect()->route('categories.index');
    }

}
