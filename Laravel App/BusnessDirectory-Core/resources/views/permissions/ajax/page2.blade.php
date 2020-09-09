<div class="col-md-10 col-md-offset-1">
	<div class="panel panel-success ">
		<div class="panel-heading">
			<div class="panel-title">
				{{App\Global_var::getLangString('Assign_Role_Permissions', $language_strings)}}
			</div>
		</div>
		<div class="panel-body">
			<div class="crud_resourceDiv">
				<div class="col-md-10 ">
					<div class="col-md-12">
						<h4><strong> {{App\Global_var::getLangString('Role', $language_strings)}} <span style="color: red"> {{$role->roleName}}</span></strong>:  {{App\Global_var::getLangString('Assign_Role_Permissions', $language_strings)}}  &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 
							<span style="color: red">{{App\Global_var::getLangString('Permissions_Will_Be_Saved_Automatically', $language_strings)}}</span><a href="#" value="{{$role->id}}" class="permissions-step0 pull-right"><i class="glyphicon glyphicon-arrow-left"></i> {{App\Global_var::getLangString('Back', $language_strings)}}</a>
						</h4>
					</div>
					<div class="col-md-12">
						<div class="col-md-12">
							<ul class="nav nav-tabs st-nav-tabs">
								<li><a class="tap_element" href="#first_tab" data-toggle="tab" style="color: red">{{App\Global_var::getLangString('Crud_Resources', $language_strings)}} </a></li>
								<li><a class="tap_element" href="#Action_Resources" data-toggle="tab" style="color: red">{{App\Global_var::getLangString('Action_Resources', $language_strings)}}</a></li>
							</ul>
						</div>
						<div id="myTabContent" class="tab-content">
							<div class="tab-pane fade in" id="first_tab">
								<table class="table  table-striped table-hover table-bordered">
									<thead>
										<th clas="col-lg-1">#</th>
										<th clas="col-lg-4">{{App\Global_var::getLangString('Resource_Name', $language_strings)}}</th>
										<th clas="col-lg-1 pull-right">	
											<strong><u>{{App\Global_var::getLangString('Allow_Show', $language_strings)}}</u></strong>
											<br>
											@if($role->hasFull_Permission('show'))
											<label><input class="permissions-checkAll checked" type="checkbox" roleId="{{$role->id}}" actionType="show" checked> {{App\Global_var::getLangString('Denie_All', $language_strings)}}
											</label>
											@else
											<label><input class="permissions-checkAll" type="checkbox" roleId="{{$role->id}}" actionType="show"> {{App\Global_var::getLangString('Allow_All', $language_strings)}}
											</label>
											@endif
										</th>
										<th clas="col-lg-1 pull-right">	
											<strong><u>{{App\Global_var::getLangString('Allow_Index', $language_strings)}}
											</u></strong>
											<br>
											@if($role->hasFull_Permission('index'))
											<label><input class="permissions-checkAll checked" type="checkbox" roleId="{{$role->id}}" actionType="index" checked> {{App\Global_var::getLangString('Denie_All', $language_strings)}}</label>
											@else
											<label><input class="permissions-checkAll" type="checkbox" roleId="{{$role->id}}" actionType="index"> {{App\Global_var::getLangString('Allow_All', $language_strings)}}
											</label>
											@endif
										</th>
										<th clas="col-lg-1 pull-right">	
											<strong><u>{{App\Global_var::getLangString('Allow_Store', $language_strings)}}
											</u></strong>
											<br>
											@if($role->hasFull_Permission('store'))
											<label><input class="permissions-checkAll checked" type="checkbox" roleId="{{$role->id}}" actionType="store" checked> {{App\Global_var::getLangString('Denie_All', $language_strings)}}</label>
											@else
											<label><input class="permissions-checkAll" type="checkbox" roleId="{{$role->id}}" actionType="store"> {{App\Global_var::getLangString('Allow_All', $language_strings)}}
											</label>
											@endif
										</th>
										<th clas="col-lg-1 pull-right">	
											<strong><u>{{App\Global_var::getLangString('Allow_Update', $language_strings)}}
											</u></strong>
											<br>
											@if($role->hasFull_Permission('update'))
											<label><input class="permissions-checkAll checked" type="checkbox" roleId="{{$role->id}}" actionType="update" checked> {{App\Global_var::getLangString('Denie_All', $language_strings)}}</label>
											@else
											<label><input class="permissions-checkAll" type="checkbox" roleId="{{$role->id}}" actionType="update"> {{App\Global_var::getLangString('Allow_All', $language_strings)}}
											</label>
											@endif
										</th>
										<th clas="col-lg-1 pull-right">	
											<strong><u>{{App\Global_var::getLangString('Allow_Destroy', $language_strings)}}
											</u></strong>
											<br>
											@if($role->hasFull_Permission('destroy'))
											<label><input class="permissions-checkAll checked" type="checkbox" roleId="{{$role->id}}" actionType="destroy" checked> {{App\Global_var::getLangString('Denie_All', $language_strings)}}</label>
											@else
											<label><input class="permissions-checkAll" type="checkbox" roleId="{{$role->id}}" actionType="destroy"> {{App\Global_var::getLangString('Allow_All', $language_strings)}}
											</label>
											@endif
										</th>
									</thead>
									<tbody>
										<?php $i=1 ?>
										@foreach($resources->where('is_crud', '=', 'true') as $resource)
										<tr>
											<td>{{$i}}</td>
											<td>{{$resource->entityName}}</td>
											<td>
												@if($role->hasPermission($resource->id, 'show'))
												<input class="permissions-save checked" type="checkbox" roleId="{{$role->id}}" resourceId="{{$resource->id}}" actionType="show" checked>
												@else
												<input class="permissions-save" type="checkbox" roleId="{{$role->id}}" resourceId="{{$resource->id}}" actionType="show">
												@endif
											</td>
											<td>
												@if($role->hasPermission($resource->id, 'index'))
												<input class="permissions-save checked" type="checkbox" roleId="{{$role->id}}" resourceId="{{$resource->id}}" actionType="index" checked>
												@else
												<input class="permissions-save" type="checkbox" roleId="{{$role->id}}" resourceId="{{$resource->id}}" actionType="index">
												@endif
											</td>
											<td>
												@if($role->hasPermission($resource->id, 'store'))
												<input class="permissions-save checked" type="checkbox" roleId="{{$role->id}}" resourceId="{{$resource->id}}" actionType="store" checked>
												@else
												<input class="permissions-save" type="checkbox" roleId="{{$role->id}}" resourceId="{{$resource->id}}" actionType="store">
												@endif
											</td>
											<td>
												@if($role->hasPermission($resource->id, 'update'))
												<input class="permissions-save checked" type="checkbox" roleId="{{$role->id}}" resourceId="{{$resource->id}}" actionType="update" checked>
												@else
												<input class="permissions-save" type="checkbox" roleId="{{$role->id}}" resourceId="{{$resource->id}}" actionType="update">
												@endif
											</td>
											<td>
												@if($role->hasPermission($resource->id, 'destroy'))
												<input class="permissions-save checked" type="checkbox" roleId="{{$role->id}}" resourceId="{{$resource->id}}" actionType="destroy" checked>
												@else
												<input class="permissions-save" type="checkbox" roleId="{{$role->id}}" resourceId="{{$resource->id}}" actionType="destroy">
												@endif
											</td>
										</tr>
										<?php $i++ ?>
										@endforeach
									</tbody>
								</table>
								<!-- </div>
								</div> -->

							</div>
							<div class="tab-pane fade in" id="Action_Resources">
			
								<!-- ----ACTION RESOURCE PERMISSIONS-------- -->

								<!-- 
								<div class="action_resourceDiv col-md-12">
								<div class="col-md-10 col-md-offset-1">
								<h3><u><strong>{{$role->roleName}}:</strong> {{App\Global_var::getLangString('Assign_Role_Permissions', $language_strings)}} </u> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 
								<label class="label label-info">{{App\Global_var::getLangString('Permissions_Will_Be_Saved_Automatically', $language_strings)}}</label><a value="{{$role->id}}" class="permissions-step0 pull-right"><i class="fa fa-share"></i>{{App\Global_var::getLangString('Back', $language_strings)}}</a>
								</h3> -->
								
								<table class="table  table-striped table-hover table-bordered">
									<thead>
										<th clas="col-lg-1">#</th>
										<th clas="col-lg-4">{{App\Global_var::getLangString('Resource_Name', $language_strings)}}</th>
										<th clas="col-lg-1 pull-right">	
											<strong><u>{{App\Global_var::getLangString('Allow_Action', $language_strings)}}</u></strong>
											<br>
											@if($role->hasFull_Permission('allow_action'))
											<label><input class="permissions-checkAll checked" type="checkbox" roleId="{{$role->id}}" actionType="allow_action" checked> {{App\Global_var::getLangString('Denie_All', $language_strings)}}
											</label>
											@else
											<label><input class="permissions-checkAll" type="checkbox" roleId="{{$role->id}}" actionType="allow_action"> {{App\Global_var::getLangString('Allow_All', $language_strings)}}
											</label>
											@endif
										</th>
									</thead>
									<tbody>
										<?php $i=1 ?>
										@foreach($resources->where('is_crud', '=', 'false') as $resource)
										<tr>
											<td>{{$i}}</td>
											<td>{{$resource->entityName}}</td>
											<td>
												@if($role->hasPermission($resource->id, 'allow_action'))
												<input class="permissions-save checked" type="checkbox" roleId="{{$role->id}}" resourceId="{{$resource->id}}" actionType="allow_action" checked>
												@else
												<input class="permissions-save" type="checkbox" roleId="{{$role->id}}" resourceId="{{$resource->id}}" actionType="allow_action">
												@endif
											</td>
										</tr>
										<?php $i++ ?>
										@endforeach
									</tbody>
								</table>
							</div>
						</div>
					</div>
				</div>
			</div>

		</div>
	</div>	
</div>
