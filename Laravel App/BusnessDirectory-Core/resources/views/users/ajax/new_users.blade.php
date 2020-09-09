<div id="ajaxContent">
  <div class="col-md-12 ">    
    <div class="col-md-12 panel panel-info"> 
        <h4><label class="badge bg-green">{{$users!=null? $users->count(): 0}}</label> / <label class="badge">{{$users->total()}}</label> 
          {{App\Global_var::getLangString('users', $language_strings)}}
        </h4> 
        <div class="panel-body">
          @if($users!=null)
          <table class="table table-bordered table-striped">
            <thead>
              <tr>
                <th>#</th>
                <th>{{App\Global_var::getLangString('Email', $language_strings)}}</th>
                <th>{{App\Global_var::getLangString('Role', $language_strings)}}</th>
                <!-- <th>{{App\Global_var::getLangString('Department', $language_strings)}}</th> -->
                <th>{{App\Global_var::getLangString('Phone_Number', $language_strings)}}</th>
                <th>{{App\Global_var::getLangString('Registration_Date', $language_strings)}}</th>
                <th></th>
              </tr>
            </thead>
            <tbody>
              <?php $counter=0; ?>

              @foreach($users as $user)
              <?php $counter+=1; ?>

              <tr>
                <td>{{$counter}}</td>
                <td>{{$user->email}}</td>
                <td>{{$user->role!=null? $user->role->roleName: ''}}</td>
                <!-- <td>{{$user->department!=null? $user->department->name: ''}}</td> -->
                <td>{{$user->phoneNumber}}</td>
                <td>{{date('M j Y H:i', strtotime($user->created_at))}}</td>
                <td>
                    <a class="get btn btn-md btn-success" href="{{route('users.approveNewUser', [$user->id, 1])}}">{{App\Global_var::getLangString('Approve', $language_strings)}}</a>
                    <a class="get btn btn-md btn-danger" href="{{route('users.approveNewUser', [$user->id, 0])}}">{{App\Global_var::getLangString('Reject', $language_strings)}}</a>
                </td>
              </tr>
              @endforeach
            </tbody>
          </table>
          @else
          <div class="panel">
            <h4>{{App\Global_var::getLangString('List_Not_Found', $language_strings)}}</h4>
          </div>
          @endif
        </div> 
      </div>
      <div class="col-md-12">
        <center>
          {{$users->links()}}
        </center>
      </div>
    </div>
  </div>