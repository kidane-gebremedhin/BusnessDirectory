@extends("layouts.auth_master")
@section("content") 
  <div id="container" class="col-md-12" style="padding-top: 40px">
  <?php $logoImage=App\Logo::orderBy('id', 'desc')->first()!=null? App\Logo::orderBy('id', 'desc')->first()->logoImage:''; ?>
    <div class="text-center">
      <img class="text-center" src="{{asset('images/'.$logoImage)}}" alt="Logo" style="height: 160px; border-radius: 50%;padding-bottom: 10px;">
    </div>
      <div class="col-md-12">
    <h3 style="font-family: algerian; color: orange"> <center>{{App\Logo::orderBy('id', 'desc')->first()!=null? App\Logo::orderBy('id', 'desc')->first()->logoText : App\Global_var::getLangString('App_Name', $language_strings)}}</center> </h3>
  </div>
<div class="login-box" style="margin-top:100px; ">
<div class="panel panel-success">
<div class="panel-heading">
  {{App\Global_var::getLangString('Sign_In', $language_strings)}}
</div>
<div class="panel-body">
  <div class="login-box-body">
    <p class="login-box-msg">
  {!!Form::model(array( url('/login') , "method"=>"POST", "class"=>"post"))!!}
      <div class="form-group has-feedback">
        <input autocomplete="off" id="email" type="text" class="form-control" name="email" value="{{ old('email') }}"  placeholder="{{App\Global_var::getLangString('Email', $language_strings)}}" autofocus="true">
        <span class="glyphicon glyphicon-envelope form-control-feedback"></span>
      </div>
      <div class="form-group has-feedback">
        <input id="password" type="password" class="form-control" name="password" placeholder="{{App\Global_var::getLangString('Password', $language_strings)}}">
        <span class="glyphicon glyphicon-lock form-control-feedback"></span>
      </div>
      <div class="row">
          <!-- /.col -->
        <div class="col-md-12">
          <button type="submit" class="btn btn-success btn-block btn-flat"><i> </i> 
  {{App\Global_var::getLangString('Log_In', $language_strings)}}
          </button>
        </div>
        <!-- /.col -->
      </div>
{{Form::close()}}
  </div>
  <div class="social-auth-links text-center">
      {{App\Global_var::getLangString('Have_not_you_an_account', $language_strings)}}? <a href="{{url('register')}}">  {{App\Global_var::getLangString('Sign_Up', $language_strings)}}</a>
    </div>
    <div class="social-auth-links text-center">
      <a href="{{ url('/password/reset') }}"></i> {{App\Global_var::getLangString('Forgot_password', $language_strings)}}</a>
    </div>
  </div>
  </div>

  <!-- /.login-box-body -->
</div>
<!-- /.login-box -->
</div>
@stop
