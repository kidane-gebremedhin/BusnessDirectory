<div class="col-md-12">
  <div class="col-md-10 ">
    <center><h3 style="margin-left: 190px;margin-top: -10px;"> Manage Your Account<small>
      <hr>
    </center>
    </div>
</div>
  <div class="col-md-12">
    {{Form::open(['route'=>['users.manageAccounts'], 'method'=>'POST', 'class'=>'post'])}}
    <label class="nextUrl" nextUrl="{{route('home')}}"></label>
    <div class="col-md-12">
    <div class="col-md-3 col-md-offset-3">
      {{Form::label('firstName', 'First Name')}}
      {{Form::text('firstName', $user->firstName, ['class'=>'form-control', 'placeholder'=>'First Name'])}}<br>
      {{Form::label('lastName', 'Last Name')}}
      {{Form::text('lastName', $user->lastName, ['class'=>'form-control','placeholder'=>'Last Name'])}}<br>
      {{Form::label('middleName', 'Middle Name')}}
      {{Form::text('middleName', $user->middleName, ['class'=>'form-control','placeholder'=>'Middle Name'])}}<br>
      {{Form::label('phoneNumber', 'Phone Number')}}
      {{Form::text('phoneNumber', $user->phoneNumber, ['class'=>'form-control','placeholder'=>'Phone Number'])}}<br>
    </div>
    <div class="col-md-3">
      {{Form::label('email', 'Email')}}
      {{Form::text('email', $user->email, ['disabled'=>'disabled', 'class'=>'form-control'])}}<br>{{Form::label('oldPassword', 'Old Password')}}
      {{Form::password('oldPassword', ['class'=>'form-control','placeholder'=>'Old Password'])}}<br>
      {{Form::label('password', 'New Password')}}
      {{Form::password('password', ['class'=>'form-control','placeholder'=>'New Password','style'=>'margin-top: 4px'])}}<br>
      {{Form::label('cpassword', 'Confirm New Password')}}
      {{Form::password('cpassword', ['class'=>'form-control','placeholder'=>'Confirm New Password'])}}
    </div>
    </div>  
    <div class="col-md-12">
    <div class="col-md-6 col-md-offset-3">
      {{Form::submit('Save Changes', ['class'=>'btn btn-success btn-block'])}}
      {{Form::close()}}
    </div>
    </div>
  </div>



