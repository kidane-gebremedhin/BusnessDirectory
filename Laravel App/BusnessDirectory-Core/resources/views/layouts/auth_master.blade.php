<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>{{App\Logo::orderBy('id', 'desc')->first()!=null? App\Logo::orderBy('id', 'desc')->first()->logoText:''}}</title>
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
  <link rel="stylesheet" href="{{asset('bootstrap/css/bootstrap.min.css')}}">
  <!-- <link rel="stylesheet" href="{{asset('https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css')}}">
  <link rel="stylesheet" href="{{asset('https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css')}}"> -->
  <link rel="stylesheet" href="{{asset('dist/css/AdminLTE.min.css')}}">
  <link rel="stylesheet" href="{{asset('plugins/iCheck/square/blue.css')}}">
  <link rel="stylesheet" type="text/css" href="{{asset('/fonts/font-awesome/css/font-awesome.css')}}">
</head>
<!-- <body class="hold-transition login-page"> -->

<body style="background-image:url({{asset('images/background.jpg')}}); background-repeat:no-repeat; background-size: cover;">

     <div class="messageArea" style="position: fixed; top: 80px; width: 90%; z-index: 99; display: none;" >
    <div class="col-md-12" style="height:50px">
    <div id="validation-error-message-displayer" style="display: none; height: 50px;">
        <div class="alert alert-warning alert-dismissible fade in" role="alert">
                    <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">×</span>
                    </button>
                    <h3 class='text-warnning'>Operation Failed </h3>
                   <strong id="validation-error-message"></strong>
          </div>
          </div>
       <div id="message-success-displayer" style="display: none">
        <div class="alert alert-success alert-dismissible fade in" role="alert">
                    <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">×</span>
                    </button>
                   <strong id="message-success"></strong>
          </div>
          </div>
          <div id="message-error-displayer" style="display: none">
        <div class="alert alert-danger alert-dismissible fade in" role="alert">
                    <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">×</span>
                    </button>
                   <strong id="message-error"></strong>
                  </div>
            </div>
       </div>
  </div>

<div class="col-md-12" style="position: fixed; top: 80px; width: 90%; z-index: 99;">
<!-- Session Messages -->
  @if (Session::has('danger'))
  <div class="alert alert-danger">{{ Session::get('danger') }}</div>
  @elseif (Session::has('success'))
  <div class="alert alert-success">{{ Session::get('success') }}</div>
  @endif
</div>

    @yield('content')
    
<!-- jQuery 2.2.3 -->
<script src="{{asset('plugins/jQuery/jquery-2.2.3.min.js')}}"></script>
<!-- Bootstrap 3.3.6 -->
<script src="{{asset('bootstrap/js/bootstrap.min.js')}}"></script>
<!-- iCheck -->
<script src="{{asset('plugins/iCheck/icheck.min.js')}}"></script>
@include("_Script._myScript")

<script>
  $(function () {
    $('input').iCheck({
      checkboxClass: 'icheckbox_square-blue',
      radioClass: 'iradio_square-blue',
      increaseArea: '20%' // optional
    });
  });
</script>
</body>
</html>

