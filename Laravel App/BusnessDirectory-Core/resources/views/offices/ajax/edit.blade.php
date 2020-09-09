<div class="col-md-12">
  <div class="col-md-10">
    {{Form::model($office, array("route"=>["offices.update", $office->id], "method"=>"POST", "class"=>"post"))}}
    <label class="nextUrl" nextUrl="{{route('offices.index')}}" />
    <div class="panel panel-success">
      <div class="panel-heading"> 
        {{App\Global_var::getLangString('Edit_Crime_Type', $language_strings)}}
        <a href="{{route('offices.index')}}" class="get btn btn-success btn-sm pull-right" nextUrl="{{route('offices.index')}}"><i class="fa fa-eye"></i> 
          {{App\Global_var::getLangString('List', $language_strings)}}
        </a>  
      </div>
      <div class="panel-body">
        <div class="col-md-12" style="padding-top:15px;">
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
            <label class="label-control col-md-4">
              {{App\Global_var::getLangString('Category', $language_strings)}}
            </label>
            <div class="col-md-8">
                    {{ Form::select('categoryId', [null=>'-- Select Category --']+$categories, null, array('class'=>'select2 form-control', 'required'=>'true'))}}
            </div>
          </div>
          <div class="col-md-10 form-group">
            <label class="label-control col-md-4">
              {{App\Global_var::getLangString('Letter', $language_strings)}}
            </label>
            <div class="col-md-8">
                    {{ Form::select('letterId', [null=>'-- Select Letter --']+$letters, null, array('class'=>'select2 form-control', 'required'=>'true'))}}
            </div>
          </div>
          <div class="col-md-10 form-group">
            <label class="label-control col-md-4">
              {{App\Global_var::getLangString('Letter', $language_strings)}}
            </label>
            <div class="col-md-8">
                    {{ Form::select('level', [null=>'-- Select Level --']+$levels, null, array('class'=>'select2 form-control', 'required'=>'true'))}}
            </div>
          </div>
          <div class="col-md-10 form-group">
            <label class="label-control col-md-4">
              {{App\Global_var::getLangString('Number', $language_strings)}}
            </label>
            <div class="col-md-8">
              {{ Form::text('number', null, array('class'=>'form-control', 'required'=>'true'))}}
            </div>
          </div>
          <div class="col-md-12">
          @foreach($office->images as $image)
            <a href="{{route('offices.office_images', $image->id)}}" target="_blank"><img src="{{route('offices.office_images', $image->id)}}" style="height: 300px; width: 300px; margin: 10px" /></a>
            @endforeach
          </div>
          <div class="col-md-10" style="margin-top: 30px">
            <label class="label-control col-md-4">
              {{App\Global_var::getLangString('Add Image', $language_strings)}}
            </label>
            <div class="col-md-8">
              {{ Form::file('image', null, array('class'=>'form-control', 'required'=>'true'))}}
            </div>
          </div>
          <div class="col-md-10 form-group">
            <label class="label-control col-md-4">
              {{App\Global_var::getLangString('Longitude', $language_strings)}}
            </label>
            <div class="col-md-8">
              {{ Form::text('longitude', null, array('class'=>'form-control', 'required'=>'true'))}}
            </div>
          </div>
          <div class="col-md-10 form-group">
            <label class="label-control col-md-4">
              {{App\Global_var::getLangString('Latitude', $language_strings)}}
            </label>
            <div class="col-md-8">
              {{ Form::text('latitude', null, array('class'=>'form-control', 'required'=>'true'))}}
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
              {{App\Global_var::getLangString('Save', $language_strings)}}
            </button>
            </div>
          </div>
        </div>
      </div>
    </div>
    {{Form::close()}}
  </div>
</div>


