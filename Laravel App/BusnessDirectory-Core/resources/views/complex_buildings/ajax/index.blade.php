<div id="ajaxContent">
  <div class="col-md-12">
    <div class="col-md-8 panel panel-success">
      <h4><label class="badge bg-green">{{$complex_buildings!=null? $complex_buildings->count(): 0}}</label> / <label class="badge">{{$complex_buildings->total()}}</label> 
        {{App\Global_var::getLangString('complex_buildings', $language_strings)}}
        <a class="get btn btn-success btn-sm navbar-right" href="{{route('complex_buildings.create')}}" nextUrl="{{route('complex_buildings.create')}}"><i class="fa fa-plus"></i> 
          {{App\Global_var::getLangString('Add', $language_strings)}}
        </a>
      </h4>
      @if(count($complex_buildings)>0)
      <table class="table table-striped table-hover">
        <thead>
          <th>#</th>
          <th>
            {{App\Global_var::getLangString('Name', $language_strings)}}
          </th>
          <th>
            {{App\Global_var::getLangString('Description', $language_strings)}}
          </th>
          <th></th>
        </thead>
        <tbody>
          <?php $count=1; ?>
          @foreach($complex_buildings as $complex_building)
          <tr>
            <td>{{$count++}}</td>
            <td>{{$complex_building->name}}</td>
            <td>{{strlen($complex_building->description)>50? substr($complex_building->description, 0, 50).'...': $complex_building->description}}
            </td>
            <td>			
              <ul class="nav navbar-right">
                <li class="">
                  <a href="javascript:;" class="dropdown-toggle" data-toggle="dropdown" aria-expanded="false" style="height: 20px; background: #fff">
                    {{App\Global_var::getLangString('Actions', $language_strings)}}
                    <span class=" fa fa-angle-down"></span>
                  </a>
                  <ul class="dropdown-menu dropdown-complex_buildingmenu pull-right">
                    <li>
                      <a class="get btn btn-lg" href="{{route('complex_buildings.show', $complex_building->id)}}" value="{{$complex_building->id}}" nextUrl="{{route('complex_buildings.show', $complex_building->id)}}">
                        <i class="fa fa-eye"></i> 
                        {{App\Global_var::getLangString('View', $language_strings)}}
                      </a>
                    </li>
                    <li>
                      <a class="get btn btn-lg" href="{{route('complex_buildings.edit', $complex_building->id)}}" value="{{$complex_building->id}}" nextUrl="{{route('complex_buildings.edit', $complex_building->id)}}">
                        <i class="fa fa-edit"></i> 
                        {{App\Global_var::getLangString('Edit', $language_strings)}}
                      </a>
                    </li>
                    <li><a class="get btn btn-lg" href="{{route('complex_buildings.delete', $complex_building->id)}}" value="{{$complex_building->id}}" nextUrl="{{route('complex_buildings.delete', $complex_building->id)}}"><i class="fa fa-trash"></i> 
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
      {{$complex_buildings->links()}}
    </center>
  </div>
</div>
