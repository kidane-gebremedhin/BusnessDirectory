<div id="ajaxContent">
  <div class="col-md-12 ">    
    <div class="col-md-12 panel panel-success"> 
        <h4><label class="badge bg-green">{{$documents!=null? $documents->count(): 0}}</label> / <label class="badge">{{$documents->total()}}</label> 
          {{App\Global_var::getLangString('documents', $language_strings)}}
          @if($currentUser->isGranted('documents.create'))
          <a class="get btn btn-success btn-sm navbar-right" href="{{route('documents.create')}}" nextUrl="{{route('documents.create')}}"><i class="fa fa-plus"></i> 
            @endif
            {{App\Global_var::getLangString('Add', $language_strings)}}
          </a></h4> 
        <div class="panel-body">
          @if($documents!=null)
          <table class="table table-bordered table-striped table-hover">
            <thead>
              <tr>
                <th>#</th>
                <th>{{App\Global_var::getLangString('Title', $language_strings)}}</th>
                <th>{{App\Global_var::getLangString('Category', $language_strings)}}</th>
                <th>{{App\Global_var::getLangString('Author', $language_strings)}}</th>
                <th>{{App\Global_var::getLangString('Phone_Number', $language_strings)}}</th>
                <th>{{App\Global_var::getLangString('Uploaded at', $language_strings)}}</th>
                <th></th>
                <th></th>
              </tr>
            </thead>
            <tbody>
              <?php $counter=0; ?>

              @foreach($documents as $document)
              <?php $counter+=1; ?>

              <tr>
                <td>{{$counter}}</td>
                <td>{{strlen($document->title)<=30? $document->title: substr($document->title, 0, 30).' ...'}}</td>
                <td>{{$document->category}}</td>
                <td>{{$document->author!=null? $document->author->firstName.' '.$document->author->lastName.' '.$document->author->middleName: ''}}</td>
                <td>{{$document->phoneNumber}}</td>
                <td>{{$document->uploadedDateTime}}</td>
                <td>
              @if(count($document->editions)>0)
              <?php 
                $document_edition=$document->editions->first();
               ?>
                @if($currentUser->isGranted_ID('medias.show', $document_edition->id))
              <u><a class="get btn btn-success btn-sm" href="{{route('medias.show', $document_edition->id)}}"><i class="fa fa-play"></i></a></u> 
              @endif
              @if($currentUser->isGranted_ID('documents.download', $document_edition->id))
              <a class="btn btn-success btn-sm" href="{{ route('documents.download', $document_edition->id) }}"><i class="fa fa-download"></i>
                 </a>
              @endif
                @endif
                </td>
                <td>
                  <ul class="nav navbar-right">
                    <li class="">
                      <a href="javascript:;" class="dropdown-toggle" data-toggle="dropdown" aria-expanded="false" style="height: 20px; background: #fff">
                        {{App\Global_var::getLangString('Actions', $language_strings)}}
                        <span class=" fa fa-angle-down"></span>
                      </a>
                      <ul class="dropdown-menu dropdown-usermenu pull-right">
                        @if($currentUser->isGranted_ID('permissions.document_role_permissions', $document->id))
                        <li>
                          <a class="get btn btn-lg" href="{{route('permissions.document_role_permissions', $document->id)}}" value="{{$document->id}}">
                            <i class="fa fa-gear"></i> {{App\Global_var::getLangString('Permissions', $language_strings)}} 
                          </a>
                        </li>
                        @endif
                        @if($currentUser->isGranted_ID('documents.show', $document->id))
                        <li>
                          <a class="get btn btn-lg" href="{{route('documents.show', $document->id)}}" value="{{$document->id}}">
                            <i class="fa fa-eye"></i> {{App\Global_var::getLangString('View', $language_strings)}} 
                          </a>
                        </li>
                        @endif
                        @if($currentUser->isGranted_ID('documents.edit', $document->id))
                        <li>
                          <a class="get btn btn-lg" href="{{route('documents.edit', $document->id)}}" value="{{$document->id}}">
                            <i class="fa fa-edit"></i> {{App\Global_var::getLangString('Edit', $language_strings)}} 
                          </a>
                        </li>
                        @endif
                        @if($currentUser->isGranted_ID('documents.delete', $document->id))
                        <li><a class="get btn btn-lg" href="{{route('documents.delete', $document->id)}}" value="{{$document->id}}"><i class="fa fa-trash"></i> {{App\Global_var::getLangString('Delete', $language_strings)}} 
                        </a></li>
                        @endif
                        

                      </ul>
                    </li>
                  </ul>
                </td>
              </tr>
              @endforeach
            </tbody>
          </table>
          @else
          <div class="panel">
            <h4>{{App\Global_var::getLangString('List_Not_Found', $language_strings)}}</h4>
          </div>
          @endif
        </div> 
      </div>
      <div class="col-md-12">
        <center>
          {{$documents->links()}}
        </center>
      </div>
    </div>
  </div>