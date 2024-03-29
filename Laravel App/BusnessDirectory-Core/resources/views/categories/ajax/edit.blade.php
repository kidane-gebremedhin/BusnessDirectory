<div class="col-md-12">
  <div class="col-md-8">
    {{Form::model($category, array("route"=>["categories.update", $category->id], "method"=>"POST", "class"=>"post"))}}
    <label class="nextUrl" nextUrl="{{route('categories.index')}}" />
    <div class="panel panel-success">
      <div class="panel-heading"> 
        {{App\Global_var::getLangString('Edit_Crime_Type', $language_strings)}}
        <a href="{{route('categories.index')}}" class="get btn btn-success btn-sm pull-right" nextUrl="{{route('categories.index')}}"><i class="fa fa-eye"></i> 
          {{App\Global_var::getLangString('List', $language_strings)}}
        </a>  
      </div>
      <div class="panel-body">
        <div class="col-md-10" style="padding-top:15px;">
          <div class="col-md-10 form-group">
            <label class="label-control col-md-4">
              {{App\Global_var::getLangString('Name', $language_strings)}}          
            </label>
            <div class="col-md-8">
              {{ Form::text('name', null, array('class'=>'form-control', 'required'=>'true'))}}
            </div>
          </div>
          <div class="col-md-10 form-group">
            <label class="label-control col-md-4">
              {{App\Global_var::getLangString('Complex_Building', $language_strings)}}
            </label>
            <div class="col-md-8">
                    {{ Form::select('buildingId', [null=>'-- Select Building --']+$complex_buildings, null, array('class'=>'select2 form-control', 'required'=>'true'))}}
            </div>
          </div>
          <div class="col-md-10 form-group">
            <label class="col-md-4 control-label"> 
              {{App\Global_var::getLangString('Description', $language_strings)}}
            </label>
            <div class="form-group col-md-8">
              {!! Form::textarea('description', null, array('class'=>'form-control', 'rows'=>'3'));!!}
            </div>
          </div>
          <div class="col-md-10 form-group text-center">
          <div class="col-md-offset-4">
            <button type="submit" class="btn btn-success btn-block">
              <i class="fa fa-save"></i> 
              {{App\Global_var::getLangString('Update', $language_strings)}}
            </button>
            </div>
          </div>
        </div>
      </div>
    </div>
    {{Form::close()}}
  </div>
</div>


