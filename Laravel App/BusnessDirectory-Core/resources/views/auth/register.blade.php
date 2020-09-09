@extends("layouts.auth_master")
@section("content") 
<div class="">
<div class="panel-body">
<div class="col-md-12">
        <div class="col-md-8 col-md-offset-2">
            <div class="panel panel-default">
                <div class="panel-heading">{{App\Global_var::getLangString('Sign_Up', $language_strings)}}</div>

                <div class="panel-body">
                    <form class="post form-horizontal" method="POST" action="{{ route('register') }}">
                        {{ csrf_field() }}

                        <div class="form-group">
                            <label for="name" class="col-md-4 control-label">{{App\Global_var::getLangString('Email', $language_strings)}}</label>

                            <div class="col-md-6">
                                {{Form::email("email", null, ["class"=>"form-control", "required"=>"true", "autofocus"=>"true"])}}
                            </div>
                        </div>
                        <br>
                        <div class="form-group">
                            <label for="fullName" class="col-md-4 control-label">{{App\Global_var::getLangString('First_Name', $language_strings)}}</label>
                            <div class="col-md-6">
                                {{Form::text("firstName", null, ["class"=>"form-control", "required"=>"true"])}}
                            </div>
                        </div>
                        <br>
                        <div class="form-group">
                            <label for="fullName" class="col-md-4 control-label">{{App\Global_var::getLangString('Last_Name', $language_strings)}}</label>
                            <div class="col-md-6">
                                {{Form::text("lastName", null, ["class"=>"form-control", "required"=>"true"])}}
                            </div>
                        </div>
                        <br>
                        <div class="form-group">
                            <label for="fullName" class="col-md-4 control-label">{{App\Global_var::getLangString('Middle_Name', $language_strings)}}</label>
                            <div class="col-md-6">
                                {{Form::text("middleName", null, ["class"=>"form-control", "required"=>"true"])}}
                            </div>
                        </div>
                        <br>
                        <div class="form-group">
                            <label for="fullName" class="col-md-4 control-label">{{App\Global_var::getLangString('Phone_Number', $language_strings)}}</label>
                            <div class="col-md-6">
                                {{Form::text("phoneNumber", null, ["class"=>"phoneNumber number form-control", "required"=>"true"])}}
                            </div>
                        </div>
                        <br>
                        <div class="form-group">
                            <label for="password" class="col-md-4 control-label">{{App\Global_var::getLangString('Password', $language_strings)}}</label>
                            <div class="col-md-6">
                                {{Form::password("password", ["class"=>"form-control", "required"=>"true"])}}
                            </div>
                        </div>
                        <br>
                        <div class="form-group">
                            <label for="confirmPassword" class="col-md-4 control-label">{{App\Global_var::getLangString('Confirm_Password', $language_strings)}}</label>
                            <div class="col-md-6">
                                {{Form::password("confirmPassword", ["class"=>"form-control", "required"=>"true"])}}
                            </div>
                        </div>
                        <br>
                        <div class="form-group">
                            <div class="col-md-6 col-md-offset-4">
                                <button type="submit" class="btn btn-success btn-block">
                                    {{App\Global_var::getLangString('Register', $language_strings)}}
                                </button>
                            </div>
                              
                        </div>
                        <div class="social-auth-links text-center">
                              {{App\Global_var::getLangString('Already_have_an_account', $language_strings)}}? <a href="{{url('login')}}">{{App\Global_var::getLangString('Sign_In', $language_strings)}}</a>
                            </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
  </div>
  </div>

@stop
