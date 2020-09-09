<div class="col-md-10 col-md-offset-1">
	<div class="panel panel-success ">
		<div class="panel-heading">
			<div class="panel-title">
				{{App\Global_var::getLangString('Set_Document_Permissions', $language_strings)}}
			</div>
		</div>
		<div class="panel-body">
			<div class="crud_resourceDiv">
				<div class="col-md-12 ">
					<div class="col-md-12">
						<h4> {{App\Global_var::getLangString('Document', $language_strings)}} <u> <strong>{{$document->title}}</strong></u> {{App\Global_var::getLangString('Access_Permissions', $language_strings)}}  &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 
						</h4>
					</div>
					<div class="col-md-12">
						<div id="myTabContent" class="tab-content">
							<div class="col-md-12">
								<table class="table table-striped table-hover table-bordered">
									<thead>
										<th clas="col-lg-1">#</th>
										<th clas="col-lg-4">{{App\Global_var::getLangString('Role', $language_strings)}}</th>
										<th clas="col-lg-1 pull-right">	
											<strong><u>{{App\Global_var::getLangString('Allow_Download', $language_strings)}}</u></strong>
											<!-- <br>
											
											<label><input class="permissions-checkAll" type="checkbox" roleId="{{$document->id}}" actionType="download"> {{App\Global_var::getLangString('Allow_All', $language_strings)}}
											</label> -->
										</th>
										<th clas="col-lg-1 pull-right">	
											<strong><u>{{App\Global_var::getLangString('Allow_Show', $language_strings)}}</u></strong>
											<!-- <br>
											
											<label><input class="permissions-checkAll" type="checkbox" roleId="{{$document->id}}" actionType="show"> {{App\Global_var::getLangString('Allow_All', $language_strings)}}
											</label> -->
										</th>
										<th clas="col-lg-1 pull-right">	
											<strong><u>{{App\Global_var::getLangString('Allow_Index', $language_strings)}}
											</u></strong>
											<!-- <br>
											<label><input class="permissions-checkAll" type="checkbox" roleId="{{$document->id}}" actionType="index"> {{App\Global_var::getLangString('Allow_All', $language_strings)}}
											</label> -->
										</th>
										<th clas="col-lg-1 pull-right">	
											<strong><u>{{App\Global_var::getLangString('Allow_Store', $language_strings)}}
											</u></strong>
											<!-- <br>
											<label><input class="permissions-checkAll" type="checkbox" roleId="{{$document->id}}" actionType="store"> {{App\Global_var::getLangString('Allow_All', $language_strings)}}
											</label> -->
										</th>
										<th clas="col-lg-1 pull-right">	
											<strong><u>{{App\Global_var::getLangString('Allow_Update', $language_strings)}}
											</u></strong>
											<!-- <br>
											<label><input class="permissions-checkAll" type="checkbox" roleId="{{$document->id}}" actionType="update"> {{App\Global_var::getLangString('Allow_All', $language_strings)}}
											</label> -->
										</th>
										<th clas="col-lg-1 pull-right">	
											<strong><u>{{App\Global_var::getLangString('Allow_Destroy', $language_strings)}}
											</u></strong>
											<!-- <br>
											<label><input class="permissions-checkAll" type="checkbox" roleId="{{$document->id}}" actionType="destroy"> {{App\Global_var::getLangString('Allow_All', $language_strings)}}
											</label> -->
										</th>
									</thead>
									<tbody>
										<?php $i=1 ?>
										@foreach($roles as $role)
										<?php 
											if($role->isAdmin()){
												continue;
											} ?>
										<tr>
											<td>{{$i}}</td>
											<td>{{$role->roleName}}</td>
											<td>
												<input class="document-permissions-save" type="checkbox" roleId="{{$role->id}}" resourceId="{{$document->id}}" actionType="download" {{$role->hasDocumentPermission($document->id, 'download')? 'checked':''}}>
											</td>
											<td>
												<input class="document-permissions-save" type="checkbox" roleId="{{$role->id}}" resourceId="{{$document->id}}" actionType="show" {{$role->hasDocumentPermission($document->id, 'show')? 'checked':''}}>
											</td>
											<td>
												<input class="document-permissions-save" type="checkbox" roleId="{{$role->id}}" resourceId="{{$document->id}}" actionType="index" {{$role->hasDocumentPermission($document->id, 'index')? 'checked':''}}>
											</td>
											<td>
												<input class="document-permissions-save" type="checkbox" roleId="{{$role->id}}" resourceId="{{$document->id}}" actionType="store" {{$role->hasDocumentPermission($document->id, 'store')? 'checked':''}}>
											</td>
											<td>
												<input class="document-permissions-save" type="checkbox" roleId="{{$role->id}}" resourceId="{{$document->id}}" actionType="update" {{$role->hasDocumentPermission($document->id, 'update')? 'checked':''}}>
											</td>
											<td>
												<input class="document-permissions-save" type="checkbox" roleId="{{$role->id}}" resourceId="{{$document->id}}" actionType="destroy" {{$role->hasDocumentPermission($document->id, 'destroy')? 'checked':''}}>
											</td>
										</tr>
										<?php $i++ ?>
										@endforeach
									</tbody>
								</table>
								<!-- </div>
								</div> -->

							</div>
							<div class="col-md-12">
							<div class="col-md-8 col-md-offset-2">
								<a class="get btn btn-success btn-block" href="{{route('documents.index')}}">{{App\Global_var::getLangString('Finish', $language_strings)}}
								</a>
							</div>
							</div>
						</div>
					</div>
				</div>
			</div>

		</div>
	</div>	
</div>
