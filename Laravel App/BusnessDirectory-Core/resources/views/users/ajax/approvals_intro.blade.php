  <div class="col-md-12 ">    
  <div class="col-md-10 col-md-offset-1 ">    
    <div class="panel panel-success"> 
        <div class="panel-heading">
          <h4>
            {{App\Global_var::getLangString('Approvals', $language_strings)}}
        </h4> 
        </div>
        <div class="panel-body">
        <table class="table table-hover">
          <tbody>
        @if($currentUser->isGranted('users.newUsers'))
            <tr>
              <td>
                <a class="get" href="{{route('users.newUsers')}}" style="color: orange">
                <h2><i class="fa fa-list"></i> {{count(App\User::where('isDeleted', 'false')->where('isApproved', 'false')->get())}} {{App\Global_var::getLangString('New_Users', $language_strings)}}
                </h2>
                </a>
              </td>
            </tr>
          @endif
        @if($currentUser->isGranted('documents.newDocuments'))
            <tr>
              <td>
                <a class="get" href="{{route('documents.newDocuments')}}" style="color: orange" ><h2><i class="fa fa-list"></i> 
                {{count(App\document::where('isDeleted', 'false')->where('isApproved', 'false')->get())}}  {{App\Global_var::getLangString('New_Documents', $language_strings)}}</h2>
                </a>
              </td>
            </tr>
        @endif
          </tbody>
        </table>
        </div>
    </div>
  </div>
