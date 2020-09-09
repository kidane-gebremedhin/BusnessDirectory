<?php
namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\letter;
use Auth;
use DB;

class letterController extends Controller
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
       
       $letters=letter::orderBy("id", "desc")->paginate($this->paginationSize);

    \App\Global_var::logAction($request, 'Viewed letters List');
    if($request->ajax())
        return view("letters.ajax.index")->with('letters', $letters);

       return view("letters.http.index")->with('letters', $letters);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
public function create(Request $request){
    
        
    if($request->ajax())
        return view('letters.ajax.create');

        return view('letters.http.create');
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
            'name'=>'required'
            ]);
 $letter=letter::where('name', '=', $request->name)->first();
        if($letter!=null){
            if($request->ajax())
                return ['error', "Duplicate_Entry"];
            return back();
        }
        $letter=new letter;
        $letter->name=$request->name;
        $letter->description=$request->description;
        $letter->createdByUserId=Auth::guard('web')->user()->id;
        $letter->save();
    \App\Global_var::logAction($request, 'Created new letter ID '.$letter->id);

    /*$data = array('type' => 'notification', 'success' => true, 'message'=>'1 row inserted successfully');
    return response()->json($data);*/
        return redirect()->route("letters.index");
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id, Request $request)
    {
        $letter=letter::find($id);
    \App\Global_var::logAction($request, 'Viewed letter ID '.$letter->id.' details');
        if($request->ajax())
            return view("letters.ajax.show")->with('letter', $letter);
        return view("letters.http.show")->with('letter', $letter);
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id, Request $request)
    {
    $letter=letter::find($id);
        
    if($request->ajax())
        return view('letters.ajax.edit')->with('letter', $letter);

        return view('letters.http.edit')->with('letter', $letter);
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
        $letter=letter::where('name', '=', $request->name)->first();
        if($letter!=null && $letter->id!=$id){
            if($request->ajax())
                return ['error', "Duplicate_Entry"];
            return back();
        }

       $this->validate($request, [
            'name'=>'required'
            ]);
        $letter=letter::find($id);
        $letter->name=$request->name;
        $letter->description=$request->description;
        $letter->updatedByUserId=Auth::guard('web')->user()->id;
        $letter->save();

    \App\Global_var::logAction($request, 'Updated letter ID '.$letter->id.'');
   return redirect()->route("letters.show", $id);
   }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function delete($id, Request $request)
    {
       $letter=letter::find($id);
       if($request->ajax())
        return view('letters.ajax.delete-confirm')->with('letter', $letter);
        
        return view('letters.http.delete-confirm')->with('letter', $letter);
    }
    public function destroy($id, Request $request)
    {
        $letter=letter::find($id);
        $letter->delete();

    \App\Global_var::logAction($request, 'Deleted letter ID '.$letter->id);
        return redirect()->route('letters.index');
    }

}
