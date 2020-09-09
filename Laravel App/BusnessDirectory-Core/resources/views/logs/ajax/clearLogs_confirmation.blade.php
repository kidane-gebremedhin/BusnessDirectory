<div class="col-md-12">
		<div class="col-md-6 col-md-offset-3" style="border: 1px solid red">
		<h2 class="text-danger" style="font-family: algerian">
			{{App\Global_var::getLangString('Are_you_sure_to_Clear_All_Logs', $language_strings)}}
			<hr>
			<a href="{{route('logs.index')}}" class="get_ btn btn-success btn-block" nextUrl="{{route('logs.clearLogs')}}"> 
				{{App\Global_var::getLangString('No', $language_strings)}}
			</a>
			<a href="{{route('logs.clearLogs')}}" class="get btn btn-danger btn-block" nextUrl="{{route('logs.index')}}"><i class="fa fa-trash"></i> 
				{{App\Global_var::getLangString('Yes', $language_strings)}}
			</a>
		</h2>	
	</div>
</div>