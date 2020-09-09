<div class="col-md-12">
	<div class="col-md-8">
		<h4 class="text-danger">
			{{App\Global_var::getLangString('Confirm_Delete', $language_strings)}}
			<a href="{{route('offices.index')}}" class="get btn btn-default btn-sm" nextUrl="{{route('offices.destroy', $office->id)}}"> 
				{{App\Global_var::getLangString('No', $language_strings)}}
			</a>
			<a href="{{route('offices.destroy', $office->id)}}" value="{{$office->id}}" class="get btn btn-danger btn-sm" nextUrl="{{route('offices.index')}}"><i class="fa fa-trash"></i> 
				{{App\Global_var::getLangString('Yes', $language_strings)}}
			</a>
		</h4>	
	</div>
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
						<td><strong>{{App\Global_var::getLangString('Level', $language_strings)}}</strong></td><td><h4>{{$office->level}}</h4></td>
					</tr>
					<tr>
						<td><strong>{{App\Global_var::getLangString('Image', $language_strings)}}</strong></td><td><h4>{{$office->image}}</h4></td>
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

		</div>
			</div>
		</div>
	</div>
