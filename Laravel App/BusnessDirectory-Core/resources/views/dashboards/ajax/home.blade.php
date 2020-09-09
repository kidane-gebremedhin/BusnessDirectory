<style type="text/css">
    .dashboard-menus{
        border-bottom: 10px solid  #94b8b8;
        border-right: 10px solid  #94b8b8;
        border-radius: 10px 20px; 
    }
    .dashboard-menus:hover{
        border-left: 10px solid  #94b8b8;
        border-right: none;

    }
</style>
<div class="col-md-12">
<div class="panel-success">
     <div class="panel-heading">
        <h3 class="panel-title">{{App\Global_var::getLangString('Dashboard', $language_strings)}} - <small style="font-size: 13px">{{App\Global_var::getLangString('Control_Panel', $language_strings)}}</small></h3>
    </div>
<div class="panel-body">

<div class="col-md-12">
@if($currentUser->isGranted('documents.index'))
    <a class="get" href="{{route('documents.index')}}">
    <div class="col-md-3">
        <div class="panel panel-info">
            <div class="dashboard-menus panel-body alert-success">
                <div class="col-xs-3">
                    <img src="{{asset('images/icons/documents-1.png')}}" style="width: 105px;height: 105px;">
                </div>
                
            <div class="col-xs-12" >
                <h4>{{App\Global_var::getLangString('All_Documents', $language_strings)}} </h4>
            </div>
            </div>
        </div>
    </div>
    </a>
@endif
@if($currentUser->isGranted('users.index'))
    <a class="get" href="{{route('users.index')}}">
    <div class="col-md-3">
        <div class="panel panel-info">
            <div class="dashboard-menus panel-body alert-danger">
                <div class="col-xs-3">
                    <img src="{{asset('images/icons/users-1.jpg')}}" style="width: 105px;height: 105px;">
                </div>
                
            <div class="col-xs-12" >
                <h4>{{App\Global_var::getLangString('Users', $language_strings)}} </h4>
            </div>
            </div>
        </div>
    </div>
    </a>
@endif
@if($currentUser->isGranted('logs.index'))
    <a class="get" href="{{route('logs.index')}}">
    <div class="col-md-3">
        <div class="panel panel-info">
            <div class="dashboard-menus panel-body alert-info">
                <div class="col-xs-3">
                    <img src="{{asset('images/icons/logs-1.png')}}" style="width: 105px;height: 105px;">
                </div>
                
            <div class="col-xs-12" >
                <h4>{{App\Global_var::getLangString('Logs', $language_strings)}} </h4>
            </div>
            </div>
        </div>
    </div>
    </a>
@endif
@if($currentUser->isGranted('approvals_intro'))
    <a class="get" href="{{route('approvals_intro')}}">
    <div class="col-md-3">
        <div class="panel panel-info">
            <div class="dashboard-menus panel-body alert-warning">
                <div class="col-xs-3">
                    <img src="{{asset('images/icons/approvals-1.png')}}" style="width: 105px;height: 105px;">
                </div>
                
            <div class="col-xs-12" >
                <h4>{{App\Global_var::getLangString('Approvals', $language_strings)}} </h4>
            </div>
            </div>
        </div>
    </div>
    </a>
@endif
</div>

<div class="col-md-12">
@if($currentUser->isGranted('documents.index'))
    <a class="get" href="{{route('documents.index', 'Video')}}">
    <div class="col-md-3">
        <div class="dashboard-menus panel panel-info">
            <div class="panel-body alert-success">
                <div class="col-xs-3">
                    <img src="{{asset('images/icons/videos-1.png')}}" style="width: 105px;height: 105px;">
                </div>
                
            <div class="col-xs-12" >
                <h4>{{App\Global_var::getLangString('Videos', $language_strings)}} </h4>
            </div>
            </div>
        </div>
    </div>
    </a>
@endif
@if($currentUser->isGranted('documents.index'))
    <a class="get" href="{{route('documents.index', 'Audio')}}">
    <div class="col-md-3">
        <div class="dashboard-menus panel panel-info">
            <div class="panel-body alert-danger">
                <div class="col-xs-3">
                    <img src="{{asset('images/icons/audios-1.png')}}" style="width: 105px;height: 105px;">
                </div>
                
            <div class="col-xs-12" >
                <h4>{{App\Global_var::getLangString('Audios', $language_strings)}} </h4>
            </div>
            </div>
        </div>
    </div>
    </a>
@endif
@if($currentUser->isGranted('documents.index'))
    <a class="get" href="{{route('documents.index', 'Image')}}">
    <div class="col-md-3">
        <div class="dashboard-menus panel panel-info">
            <div class="panel-body alert-info">
                <div class="col-xs-3">
                    <img src="{{asset('images/icons/images-1.png')}}" style="width: 105px;height: 105px;">
                </div>
                
            <div class="col-xs-12" >
                <h4>{{App\Global_var::getLangString('Images', $language_strings)}} </h4>
            </div>
            </div>
        </div>
    </div>
    </a>
@endif
@if($currentUser->isGranted('documents.index'))
    <a class="get" href="{{route('documents.index', 'Text_Document')}}">
    <div class="col-md-3">
        <div class="panel panel-info">
            <div class="dashboard-menus panel-body alert-warning">
                <div class="col-xs-3">
                    <img src="{{asset('images/icons/texts-1.png')}}" style="width: 105px;height: 105px;">
                </div>
                
            <div class="col-xs-12" >
                <h4>{{App\Global_var::getLangString('Text_Documents', $language_strings)}} </h4>
            </div>
            </div>
        </div>
    </div>
    </a>
@endif
</div>

</div>

</div>
</div>
