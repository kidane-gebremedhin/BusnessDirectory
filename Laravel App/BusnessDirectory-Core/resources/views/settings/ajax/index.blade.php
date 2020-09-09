<div id="ajaxContent">

  <div class="col-md-8 col-md-offset-2">
    <div class="panel panel-info ">
      <div class="panel-heading">
        <div class="panel-title">
          {{App\Global_var::getLangString('System_Settings', $language_strings)}}
        </div>
      </div>
      <div class="panel-body">

        <div class="col-md-5">
          <h4>{{App\Global_var::getLangString('System_Settings', $language_strings)}}</h4>
          {{Form::model($setting, array('route'=>['settings.update', $setting!=null? $setting->id: 1], 'method'=>'POST', 'class'=>'post'))}}
          <label class="nextUrl" nextUrl="{{route('settings.index')}}" />

          <table class="table table-bordered">
            <tr>
              <td>
                <b>{{App\Global_var::getLangString('Pagination_Size', $language_strings)}}</b>
                {{Form::number("paginationSize", null, ['class'=>'form-control', 'min'=>'1', 'required'=>'true'])}}
              </td>
            </tr>
            <tr>        
              <td>
                <b>{{App\Global_var::getLangString('Report_Generation_Date', $language_strings)}}</b>
                {{Form::text("reportGenerationDate", null, ['class'=>'eth_date form-control', 'required'=>'true'])}}
              </td>
            </tr>
            <tr>
              <td>
                <b>{{App\Global_var::getLangString('Report_Interval_In_Months', $language_strings)}}</b>
                {{Form::text("reportIntervalInMonths", null, ['class'=>'number form-control', 'required'=>'true'])}}</])}}
              </td>
            </tr>
            <tr><td><center>{{Form::submit(App\Global_var::getLangString('Update_System_Settings', $language_strings), ['class'=>'btn btn-primary'])}}</center></td>
            </tr>
          </table>
          {{Form::close()}}
        </div>

        <div class="col-md-5">
          <a class="btn-block bu btn btn-success" href="{{ route('backup') }}"><i class="glyphicon glyphicon-export" aria-hidden="true"></i> {{__("Backup Database")}}</a>
        </div>

      </div>
    </div>



  </div>
</div>

