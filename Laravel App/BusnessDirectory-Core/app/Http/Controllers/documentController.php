<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\document;
use App\author;
use App\publisher;
use App\document_edition;
use DB;
use Auth;
use mysqli;
use Hash;
use Maatwebsite\Excel\Facades\Excel;
use Validator;
use Illuminate\Support\Facades\Input;
use App\User_zone_wereda_tabya;
use Session;
use Illuminate\Support\Facades\Storage;
use File;

class documentController extends Controller
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

    public function download($editionId)
    {
        $document_edition=document_edition::find($editionId);
        if($document_edition==null)
            return ["error", "Requested file not found"];

        $file_path = $document_edition->path;
        $filename=$document_edition->getFileName();

        $headers = array(
        // 'Content-Type: text/pdf',
        'Content-Disposition: attachment; filename='.$filename,
        );
        if ( file_exists( $file_path ) ) {
        return \Response::download( $file_path, $filename, $headers );
        } else {
        exit( 'Requested file does not exist on our server!' );
        }
    }
    
    public function getDocument($id){
        return document::find($id);
    }


    public function approveNewDocument($id, $approvalStatus, Request $request){

        $document=document::find($id);
        if($approvalStatus==1){
            $document->isApproved='true';
            $document->approvedByUserId=Auth::guard('web')->user()->id;
        \App\Global_var::logAction($request, 'New document Id: '.$document->id.' Title: '.$document->title.' Approval Request Accepted');
        }
        else if($approvalStatus==0){
            $document->isDeleted='true';
            $document->deletedByUserId=Auth::guard('web')->user()->id;
        \App\Global_var::logAction($request, 'New document Id: '.$document->id.' Title: '.$document->title.' Approval Request Rejected');
        }

        $document->save();

        return redirect()->route("documents.newDocuments");
    }

    public function newDocuments(Request $request)
    {
       $documents=document::where('isDeleted', 'false')->where('isApproved', 'false')->orderBy("id", "desc")->paginate($this->paginationSize);

        \App\Global_var::logAction($request, 'New Documents list viewed');
       if($request->ajax())
        return view("documents.ajax.new_documents")->with('documents', $documents);

       return view("documents.http.new_documents")->with('documents', $documents);
    }

    public function index(Request $request, $category=null)
    {
       //$documents=document::where('isDeleted', 'false')->where('isApproved', 'true')->orderBy("id", "desc")->paginate($this->paginationSize);
    $documents=document::where('isDeleted', 'false')->where('isApproved', 'true');
       if($category!=null)
            $documents=$documents->where('category', $category);
            
        $documents=$documents->orderBy("id", "desc")->paginate($this->paginationSize);

        \App\Global_var::logAction($request, 'Documents list viewed');
       if($request->ajax())
        return view("documents.ajax.index")->with('documents', $documents);

       return view("documents.http.index")->with('documents', $documents);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create(Request $request)
    {
        $document_categories=\App\Global_var::documentCategories();
        $years=\App\Global_var::years();
       $authors=DB::table('authors')->where('isDeleted', 'false')->pluck('firstName', 'id')->toArray();
       $publishers=DB::table('publishers')->where('isDeleted', 'false')->pluck('name', 'id')->toArray();

        if($request->ajax())
            return view("documents.ajax.create")->with('document_categories', $document_categories)->with('years', $years)->with('authors', $authors)->with('publishers', $publishers);
        return view("documents.http.create")->with('document_categories', $document_categories)->with('years', $years)->with('authors', $authors)->with('publishers', $publishers);
    }


    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */

    public function store(Request $request)
    {
    $file_size=0;
    $file_path='';
    $document=document::where('title', '=', $request->title)->first();
        if($document!=null){
            if($request->ajax())
                return ['error', 'Title already exists. Please try another title.'];
            return back();
        } 
        if($request->password!=$request->confirmPassword){
                return ["error", "Passwords not match"];
            }               
    $this->validate($request, [
            'title'=>'required|unique:documents',
            'category'=>'required',
/*
            'firstName'=>'required',
            'middleName'=>'required',
            'lastName'=>'required',

            'name'=>'required',
            'yearOfEstablishment'=>'required',
            'edition'=>'required',*/
            ]);


    //Upload file
    if($request->hasFile('file')){
            $file = $request->file('file');
            $filename = time().'-'.$file->getClientOriginalName();
            $storage_path = storage_path().'/app/public/uploads/';
            $file->move($storage_path, $filename);
            $file_path=$storage_path.$filename;
            //$file_size = filesize($file_path);
            $file_size = File::size($file_path);//Storage::size($file_path);

        }

        $author=new author;
        $author->firstName=$request->firstName;
        $author->middleName=$request->middleName;
        $author->lastName=$request->lastName;
        $author->email=$request->author_email;
        $author->phoneNumber=$request->author_phoneNumber;
        $author->createdByUserId=Auth::guard('web')->user()->id;
        if($request->authorId==null)
            $author->save();

        $publisher=new publisher;
        $publisher->name=$request->name;
        $publisher->yearOfEstablishment=$request->yearOfEstablishment;
        $publisher->email=$request->publisher_email;
        $publisher->phoneNumber=$request->publisher_phoneNumber;
        $publisher->createdByUserId=Auth::guard('web')->user()->id;
        if($request->publisherId==null)
            $publisher->save();

        $document=new document;
        $document->title=$request->title;
        $document->category=$request->category;
        $document->uploadedDateTime=(new \App\Date_class)->getCurrentDate();
        $document->authorId=$request->authorId!=null? $request->authorId: $author->id;
        $document->createdByUserId=Auth::guard('web')->user()->id;
        $document->save();


        $document_edition=new document_edition;
        $document_edition->documentId=$document->id;
        $document_edition->edition=$request->edition;
        $document_edition->path=$file_path;
        $document_edition->sizeInBytes=$file_size/1000;
        $document_edition->uploadedDateTime=(new \App\Date_class)->getCurrentDate();
        $document_edition->publisherId=$request->publisherId!=null? $request->publisherId: $publisher->id;
        $document_edition->yearOfPublishment=$request->yearOfPublishment;
        $document_edition->description=$request->description;
        $document_edition->createdByUserId=Auth::guard('web')->user()->id;
        $document_edition->save();        

        \App\Global_var::logAction($request, 'Uploaded new document '.$document->title.'. Size: '.$file_size.' Bytes');

        //return redirect()->route("documents.index");
        return redirect()->route("permissions.document_role_permissions", $document->id);
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id, Request $request)
    {
        $document=document::find($id);
        \App\Global_var::logAction($request, 'Viewed document ID '.$document->id.' details');
        if($request->ajax())
            return view("documents.ajax.show")->with('document', $document);
        return view("documents.http.show")->with('document', $document);
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id, Request $request)
    {
        $user=User::find($id);
        /*$countries=DB::table('countries')->where("isDeleted", "=", "false")->pluck("name", "id")->toArray();
        $regions=DB::table('regions')->where("isDeleted", "=", "false")->pluck("name", "id")->toArray();
        $zones=DB::table('zones')->where("isDeleted", "=", "false")->pluck("name", "id")->toArray();
        $weredas=DB::table('weredas')->where("isDeleted", "=", "false")->pluck("name", "id")->toArray();
        $sub_weredas=DB::table('sub_weredas')->where("isDeleted", "=", "false")->pluck("name", "id")->toArray();
        $tabyas=DB::table('tabyas')->where("isDeleted", "=", "false")->pluck("name", "id")->toArray();
        $kebelles=DB::table('kebelles')->where("isDeleted", "=", "false")->pluck("name", "id")->toArray();*/
        $roles=DB::table('roles')->pluck('roleName', 'id')->toArray();
        $departments=DB::table('departments')->pluck('name', 'id')->toArray();
        if($request->ajax())
            return view("users.ajax.edit")->withUser($user)->with('departments', $departments)->withRoles($roles);
        return view("users.http.edit")->withUser($user)->with('departments', $departments)->withRoles($roles);
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
        $user=User::where('email', '=', $request->email)->first();
        if($user!=null && $user->id!=$id){
            if($request->ajax())
                return ['error', 'Email already taken. Please try another.'];
            return back();
        }
        
    $this->validate($request, [
            'name'=>'required',
            'roleId'=>'required',
            'departmentId'=>'required',
            ]);
    if($request->password!=$request->confirmPassword){
                return ["error", "Passwords not match"];
            }

        $user=User::find($id);
        $user->roleId=$request->roleId;
        $user->departmentId=$request->departmentId;
        /*$user->regionId=$request->regionId;
        $user->zoneId=$request->zoneId;
        $user->weredaId=$request->weredaId;*/
        $user->email=$request->email;
        $user->email=$request->email;
        $user->phoneNumber=$request->phoneNumber;
        if($request->password!="" && $request->password==$request->confirmPassword)
            $user->password=bcrypt($request->password);
        $user->updatedByUserId=Auth::guard('web')->user()->id;
        $user->save();

        \App\Global_var::logAction($request, 'Updated user ID: '.$user->id.' Email: '.$user->email.' details');
        return redirect()->route("users.show", $id);
   }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function delete($id, Request $request)
    {        
    $document=document::find($id);
       if($request->ajax())
        return view('documents.ajax.delete-confirm')->with('document', $document);
        
        return view('documents.http.delete-confirm')->with('document', $document);
    }

 public function destroy($id, Request $request)
    {   
        if(Auth::guard('web')->user()->id==$id){
                return ["error", "User can not delete itself."];
            }

        $document=document::find($id);
        $document->delete();

        \App\Global_var::logAction($request, 'Deleted document ID: '.$document->id.' Title: '.$document->title);
        return redirect()->route('documents.index');
    }

    public function usersImport(Request $request)
    {

        $roles=DB::table('roles')->pluck('roleName', 'id')->toArray(); 

        if($request->ajax())
            return view("users.ajax.import")->withRoles($roles);
        return view("users.http.import")->withRoles($roles);
    }

 
}
