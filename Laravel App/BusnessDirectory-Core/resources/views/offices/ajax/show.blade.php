<div class="col-md-8">
	<div class="panel panel-success">
		<div class="panel-heading">
			{{App\Global_var::getLangString('Detail', $language_strings)}}

			<a href="{{route('offices.index')}}" class="get btn btn-success btn-sm pull-right" nextUrl="{{route('offices.index')}}"><i class="fa fa-eye"></i>  
				{{App\Global_var::getLangString('List', $language_strings)}}
			</a> 		
		</div>
		<div class="panel-body">
			<table class="table">
				<tbody>
					<tr>
						<td><strong>{{App\Global_var::getLangString('Name', $language_strings)}}</strong></td><td><h4>{{$office->name}}</h4></td>
					</tr>
					<tr>
						<td><strong>{{App\Global_var::getLangString('Complex_Building', $language_strings)}}</strong></td><td><h4>{{$office->building!=null? $office->building->name:''}}</h4></td>
					</tr>
					<tr>
						<td><strong>{{App\Global_var::getLangString('Category', $language_strings)}}</strong></td><td><h4>{{$office->category!=null? $office->category->name:''}}</h4></td>
					</tr>
					<tr>
						<td><strong>{{App\Global_var::getLangString('Letter', $language_strings)}}</strong></td><td><h4>{{$office->letter!=null? $office->letter->name:''}}</h4></td>
					</tr>
					<tr>
						<td>
						<strong>{{App\Global_var::getLangString('Level', $language_strings)}}</strong></td><td><h4>{{$office->level}}</h4></td>
					</tr>
					<tr>
						<td>
						<strong>{{App\Global_var::getLangString('Image', $language_strings)}}</strong></td><td>
						@foreach($office->images as $image)
						<a href="{{route('offices.office_images', $image->id)}}" target="_blank"><img src="{{route('offices.office_images', $image->id)}}" style="height: 300px; width: 300px; margin: 10px" /></a>
						@endforeach
    				{{Form::open(array("route"=>["offices.add_office_image", $office->id], "method"=>"POST", "files"=>"true", "class"=>"post"))}}
			          <div class="col-md-10 form-group" style="margin-top: 30px">
			            <label class="label-control col-md-4">
			              {{App\Global_var::getLangString('Add New Image', $language_strings)}}
			            </label>
			            <div class="col-md-8">
			              {{ Form::file('image', null, array('class'=>'form-control', 'required'=>'true'))}}
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
				    {{Form::close()}}

						</td>
					</tr>

					<tr>
						<td><strong>{{App\Global_var::getLangString('Number', $language_strings)}}</strong></td><td><h4>{{$office->number}}</h4></td>
					</tr>
					<tr>
						<td><strong>{{App\Global_var::getLangString('longitude', $language_strings)}}</strong></td><td><h4>{{$office->longitude}}</h4></td>
					</tr>
					<tr>
						<td><strong>{{App\Global_var::getLangString('Latitude', $language_strings)}}</strong></td><td><h4>{{$office->latitude}}</h4></td>
					</tr>

					<tr>
						<td><strong>{{App\Global_var::getLangString('Description', $language_strings)}}</strong></td><td><h4>{{$office->description}}</h4></td>
					</tr>

				</tbody>
			</table>

<div class="col-md-12">
<hr>
	<div class="col-md-12">
	{{App\Global_var::getLangString('Created_By', $language_strings)}}:
	<label class="label label-default">{{$office->createdByUser!=null? $office->createdByUser->username():''}}</label>

	{{App\Global_var::getLangString('Updated_By', $language_strings)}}:
	<label class="label label-default">{{$office->updatedByUser!=null? $office->updatedByUser->username():''}}	</label>
	<br>

	{{App\Global_var::getLangString('Created_At', $language_strings)}}:
	<label class="label label-default">{{date('M j Y H:i', strtotime($office->created_at))}}</label>
	{{App\Global_var::getLangString('Updated_At', $language_strings)}}:
	<label class="label label-default">{{date('M j Y H:i', strtotime($office->updated_at))}}</label> 		 

</div>
</div>
<div class="col-md-12">
<hr>
	<div class="col-md-4 pull-right">

	<a href="{{route('offices.edit', $office->id)}}" value="{{$office->id}}" class="get btn btn-sm btn-primary" nextUrl="{{route('offices.edit', $office->id)}}"><i class="fa fa-edit"></i> 
		{{App\Global_var::getLangString('Edit', $language_strings)}}
	</a>
	<a href="{{route('offices.delete', $office->id)}}" value="{{$office->id}}" class="get btn btn-sm btn-danger" nextUrl="{{route('offices.delete', $office->id)}}"><i class="fa fa-trash"></i> 
		{{App\Global_var::getLangString('Delete', $language_strings)}}
	</a>
</div>
</div>
		</div>
	</div>

</div>

