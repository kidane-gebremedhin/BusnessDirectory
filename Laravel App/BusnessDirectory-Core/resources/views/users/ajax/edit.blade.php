<div class="col-md-12">
    <div class="col-md-10 col-md-offset-0">
        <div class="panel panel-info">
            <div class="panel-heading">
                <h4>
                    {{App\Global_var::getLangString('Edit', $language_strings)}}
                </h4>
            </div>
            <div class="panel-body">
                <div id="myTabContent" class="tab-content">
                    <div class="tab-pane fade active in" id="orgDetails">
                        {!!Form::model($user, array("route"=>["users.update", $user->id], "method"=>"POST", "class"=>"post"))!!}
                        <label class="nextUrl" nextUrl="{{route('users.show', $user->id)}}" />
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label for="password" class="control-label"> {{App\Global_var::getLangString('Adminstrative_Level', $language_strings)}}</label>
                                    {{ Form::select('brkiId', [null=>'-- --']+$brkitat, null, array('class'=>'brkiId select2 form-control', 'required'=>'true'))}}<br>
                                </div>
                                <div class="form-group">
                                    <label for="password" class="control-label"> {{App\Global_var::getLangString('Role', $language_strings)}}</label>
                                    {{ Form::select('roleId', [null=>'-- --']+$roles, null, array('class'=>'roleId select2 form-control', 'required'=>'true'))}}
                                </div>
                                <div class="form-group">
                                    <label for="password" class="control-label"> {{App\Global_var::getLangString('User_Name', $language_strings)}}</label>
                                    {{ Form::text('name', null, array('class'=>'form-control', 'required'=>'true'))}}
                                </div>
                                <div class="form-group">
                                    <label for="password" class="control-label"> {{App\Global_var::getLangString('Password', $language_strings)}}</label>
                                    {{Form::password("password", ['id'=>'password', 'class'=>'form-control'])}}
                                    <span id="formErrors" class="text-danger"></span>
                                </div>
                            </div>
                            <div class="col-md-4">                             
                                <!-- <div class="form-group">
                                    <label for="roleId" class="control-label"> {{App\Global_var::getLangString('Department', $language_strings)}}</label>
                                    {{ Form::select('departmentId', [null=>'-- --']+$departments, null, array('class'=>'departmentId select2 form-control', 'required'=>'true'))}}<br>
                                </div> -->                            
                                <div class="form-group">
                                    <label class="control-label"> {{App\Global_var::getLangString('Email', $language_strings)}}({{App\Global_var::getLangString('Optional', $language_strings)}})</label>
                                    {{ Form::text('email', null, array('class'=>'form-control'))}}
                                </div>
                                <div class="form-group">
                                    <label class="control-label" > {{App\Global_var::getLangString('Phone_Number', $language_strings)}}</label>
                                    {{ Form::text('phoneNumber', null, array('class'=>'phoneNumber number form-control'))}}
                                </div>
                                <div class="form-group">
                                    <label for="confirmPassword" class="control-label" > {{App\Global_var::getLangString('Confirm_Password', $language_strings)}}</label>
                                    {{Form::password("confirmPassword", ['id'=>'confirmPassword', 'class'=>'form-control'])}}
                                </div>
                            </div>
                            <div class="col-md-4">                             
                                <div class="form-group">
                                    <label for="roleId" class="control-label"> {{App\Global_var::getLangString('Region', $language_strings)}}</label>
                                    {{ Form::select('regionId', [null=>'-- --']+$regions, null, array('class'=>'regionId region select2 form-control', $user->isRegion() || $user->isZone() || $user->isWereda() || $user->isSubWereda()? 'required':'disabled'))}}<br>
                                </div>                            
                                <div class="form-group">
                                    <label class="control-label">{{App\Global_var::getLangString('Zone', $language_strings)}}</label>
                                    {{ Form::select('zoneId', [null=>"-- --"]+$zones, null, array('class'=>'zoneId zone region form-control select2', $user->isZone() || $user->isWereda() || $user->isSubWereda()? 'required':'disabled'))}}<br>

                                </div>
                                <div class="form-group">
                                    <label class="control-label" > {{App\Global_var::getLangString('Wereda', $language_strings)}}</label>
                                    {{ Form::select('weredaId', [null=>"-- --"]+$weredas, null, array('class'=>'weredaId wereda weredaId_withSubW zone region form-control select2', $user->isWereda() || $user->isSubWereda()? 'required':'disabled'))}}<br>
                                </div>
                                <!-- <div class="form-group">
                                    <label for="confirmPassword" class="control-label" > {{App\Global_var::getLangString('Sub_Wereda', $language_strings)}}</label>
                                    {{ Form::select('subWeredaId', [null=>"-- --"]+$sub_weredas, null, array('class'=>'subWeredaId subWereda wereda zone region form-control select2', $user->isSubWereda()? 'required':'disabled'))}}
                                </div> -->
                            </div>
                            <div class="col-md-12">
                                <button type="submit" class="btn btn-primary col-md-6 col-md-offset-3">
                                    {{App\Global_var::getLangString('Save', $language_strings)}}
                                </button>
                            </div>
                            {{Form::close()}}
                        </div>
                    </div>
                </div> 
            </div>
        </div>
    </div>