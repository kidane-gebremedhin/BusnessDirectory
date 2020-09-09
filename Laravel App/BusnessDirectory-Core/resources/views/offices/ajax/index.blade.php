<div id="ajaxContent">
  <div class="col-md-12">
    <div class="col-md-8 panel panel-success">
      <h4><label class="badge bg-green">{{$offices!=null? $offices->count(): 0}}</label> / <label class="badge">{{$offices->total()}}</label> 
        {{App\Global_var::getLangString('offices', $language_strings)}}
        <a class="get btn btn-success btn-sm navbar-right" href="{{route('offices.create')}}" nextUrl="{{route('offices.create')}}"><i class="fa fa-plus"></i> 
          {{App\Global_var::getLangString('Add', $language_strings)}}
        </a>
      </h4>
      @if(count($offices)>0)
      <table class="table table-striped table-hover">
        <thead>
          <th>#</th>
          <th>
            {{App\Global_var::getLangString('Name', $language_strings)}}
          </th>
          <th>{{App\Global_var::getLangString('Complex_Building', $language_strings)}}</th>
          <th>
            {{App\Global_var::getLangString('Category', $language_strings)}}
          </th>
          <th>
            {{App\Global_var::getLangString('Level', $language_strings)}}
          </th>
          <th>
            {{App\Global_var::getLangString('Number', $language_strings)}}
          </th>
          <th>
            {{App\Global_var::getLangString('Status', $language_strings)}}
          </th>
          <th></th>
        </thead>
        <tbody>
          <?php $count=1; ?>
          @foreach($offices as $office)
          <tr>
            <td>{{$count++}}</td>
            <td>{{$office->name}}</td>
            <td>{{$office->category!=null? $office->category->name:''}}</td>
            <td>{{$office->building!=null? $office->building->name:''}}</td>
            <td>{{$office->level}} </td>
            <td>{{$office->number}} {{$office->letter!=null? $office->letter->name:''}} </td>
            <td><label style="color: {{$office->isApproved=='true'? 'green':'red'}}">{{$office->isApproved=='true'? 'Active':'Inactive'}}</label></td>
            <td>			
              <ul class="nav navbar-right">
                <li class="">
                  <a href="javascript:;" class="dropdown-toggle" data-toggle="dropdown" aria-expanded="false" style="height: 20px; background: #fff">
                    {{App\Global_var::getLangString('Actions', $language_strings)}}
                    <span class=" fa fa-angle-down"></span>
                  </a>
                  <ul class="dropdown-menu dropdown-officemenu pull-right">
                      <li><a class="get btn btn-lg" href="{{route('offices.changeStatus', $office->id)}}" value="{{$office->id}}" nextUrl="{{route('offices.index')}}"><i class="fa fa-user"></i> {{$office->isApproved=='true'? App\Global_var::getLangString('Deactivate', $language_strings): App\Global_var::getLangString('Activate', $language_strings)}} 
                        </a>
                      </li>
                    <li>
                      <a class="get btn btn-lg" href="{{route('offices.show', $office->id)}}" value="{{$office->id}}" nextUrl="{{route('offices.show', $office->id)}}">
                        <i class="fa fa-eye"></i> 
                        {{App\Global_var::getLangString('View', $language_strings)}}
                      </a>
                    </li>
                    <li>
                      <a class="get btn btn-lg" href="{{route('offices.edit', $office->id)}}" value="{{$office->id}}" nextUrl="{{route('offices.edit', $office->id)}}">
                        <i class="fa fa-edit"></i> 
                        {{App\Global_var::getLangString('Edit', $language_strings)}}
                      </a>
                    </li>
                    <li><a class="get btn btn-lg" href="{{route('offices.delete', $office->id)}}" value="{{$office->id}}" nextUrl="{{route('offices.delete', $office->id)}}"><i class="fa fa-trash"></i> 
                      {{App\Global_var::getLangString('Delete', $language_strings)}}
                    </a></li>
                  </ul>
                </li>
              </ul>
            </td>
          </tr>
          @endforeach
        </tbody>
      </table>
      @else
      <div class="col-md-12"><hr><h4 class="col-md-offset-2">
        {{App\Global_var::getLangString('List_Not_Found', $language_strings)}}
      </h4></div>
      @endif
    </div>
  </div>
  <div class="col-md-8">
    <center>
      {{$offices->links()}}
    </center>
  </div>
</div>
