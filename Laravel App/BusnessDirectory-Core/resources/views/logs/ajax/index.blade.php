<div id="ajaxContent">
  <div class="col-md-12">
  <h3>{{App\Global_var::getLangString('User_Activities', $language_strings)}}</h3>
    <div class="col-md-12 panel panel-success">
      <h4><label class="badge bg-green">{{$logs!=null? $logs->count(): 0}}</label> / <label class="badge">{{$logs->total()}}</label> 
        {{App\Global_var::getLangString('logs', $language_strings)}}
        <a class="get btn btn-danger" href="{{route('logs.clearLogs_confirmation')}}"><i class="fa fa-trash"> </i>{{App\Global_var::getLangString('Clear_Logs', $language_strings)}}</a>
      </h4>
      @if(count($logs)>0)
      
          <?php $count=1; ?>
          @foreach($logs as $log)
          <div class="col-md-12" style="background: #334d4d; color: white; padding: 20px; margin: 10px;">
            <div class="col-md-3" style="border-right: 2px solid pink">
            <u>{{$count++}}</u><br>
            <strong>{{date('M j Y H:i', strtotime($log->created_at))}}</strong>
            </div>
            <div class="col-md-9">
            Subject=>{{$log->subject}}<br>
            User ID=>{{$log->userId}} {{$log->user!=null? 'Email: '.$log->user->username():''}}<br>
            URL=> {{$log->url}}<br>
            METHOD=>{{$log->method}}<br>
            IP=>{{$log->id}}<br>
            Agent=>{{$log->agent}}<br>
            </div>
          </div>
          @endforeach
      @else
      <div class="col-md-12"><hr><h4 class="col-md-offset-2">
        {{App\Global_var::getLangString('List_Not_Found', $language_strings)}}
      </h4></div>
      @endif
    </div>
  </div>
  <div class="col-md-8">
    <center>
      {{$logs->links()}}
    </center>
  </div>
</div>
