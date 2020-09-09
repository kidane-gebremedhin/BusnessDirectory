<div id="ajaxContent">
  <div class="col-md-10 col-md-offset-1">
    <div class="panel panel-info ">
      <div class="panel-heading">
        <center>
          <b>{{App\Global_var::getLangString('Report', $language_strings)}}</b>
        </center> 
      </div>
    </div>
    
    @if($currentUser->isCivil_Case_Department())
    <div class="col-md-6">
      <table class="table table-striped">
        <thead>
          <th>{{App\Global_var::getLangString('Civil_Cases', $language_strings)}}</th>
        </thead>
        <tbody>
          <tr>
            <td><a class="get" href="{{route('Free_Law_Support_For_Needy')}}"><i class="fa fa-check"></i> 
              {{App\Global_var::getLangString('Free_Law_Support_For_Needy', $language_strings)}} 
            </a></td>
          </tr>
          <tr>
            <td><a class="get" href="{{route('Free_Law_Support_For_Organizations')}}"><i class="fa fa-check"></i> 
              {{App\Global_var::getLangString('Free_Law_Support_For_Organizations', $language_strings)}} 
            </a></td>
          </tr>
          <tr>
            <td><a class="get" href="{{route('Complains_By_Customer')}}"><i class="fa fa-check"></i> 
              {{App\Global_var::getLangString('Complains_By_Customer', $language_strings)}} 
            </a></td>
          </tr>
          
          <tr>
            <td><a class="get" href="{{route('Civil_Case_Lawyer_Decision_Time_Efficiency')}}"><i class="fa fa-check"></i> 
              {{App\Global_var::getLangString('Civil_Case_Lawyer_Decision_Time_Efficiency', $language_strings)}} 
            </a></td>
          </tr>
          <tr>
            <td><a class="get" href="{{route('Lawyer_Winning_Status_Of_Civil_Cases')}}"><i class="fa fa-check"></i> 
              {{App\Global_var::getLangString('Lawyer_Winning_Status_Of_Civil_Cases', $language_strings)}} 
            </a></td>
          </tr>
          <tr>
            <td><a class="get" href="{{route('Individual_Winning_Status_Of_Civil_Cases')}}"><i class="fa fa-check"></i> 
              {{App\Global_var::getLangString('Individual_Winning_Status_Of_Civil_Cases', $language_strings)}} 
            </a></td>
          </tr>
          <tr>
            <td><a class="get" href="{{route('Court_Process_Of_Direct_Civil_Case_Documents')}}"><i class="fa fa-check"></i> 
              {{App\Global_var::getLangString('Court_Process_Of_Direct_Civil_Case_Documents', $language_strings)}} 
            </a></td>
          </tr>
          <tr>
            <td><a class="get" href="{{route('Winning_Status_Of_Civil_Case_Documents_Appealed_By_Lawyer')}}"><i class="fa fa-check"></i> 
              {{App\Global_var::getLangString('Winning_Status_Of_Civil_Case_Documents_Appealed_By_Lawyer', $language_strings)}} 
            </a></td>
          </tr>
          <tr>
            <td><a class="get" href="{{route('Winning_Status_Of_Civil_Case_Documents_Appealed_By_Individual')}}"><i class="fa fa-check"></i> 
              {{App\Global_var::getLangString('Winning_Status_Of_Civil_Case_Documents_Appealed_By_Individual', $language_strings)}} 
            </a></td>
          </tr>
          <tr>
            <td><a class="get" href="{{route('Winning_Status_Of_Breaking_Civil_Case_Documents_Appealed_By_Lawyer')}}"><i class="fa fa-check"></i> 
              {{App\Global_var::getLangString('Winning_Status_Of_Breaking_Civil_Case_Documents_Appealed_By_Lawyer', $language_strings)}} 
            </a></td>
          </tr>
          <tr>
            <td><a class="get" href="{{route('Winning_Status_Of_Breaking_Civil_Case_Documents_Appealed_By_Individual')}}"><i class="fa fa-check"></i> 
              {{App\Global_var::getLangString('Winning_Status_Of_Breaking_Civil_Case_Documents_Appealed_By_Individual', $language_strings)}} 
            </a></td>
          </tr>
          <tr>
            <td><a class="get" href="{{route('Execution_Status_Of_Civil_Case_Documents')}}"><i class="fa fa-check"></i> 
              {{App\Global_var::getLangString('Execution_Status_Of_Civil_Case_Documents', $language_strings)}} 
            </a></td>
          </tr>
          <tr>
            <td><a class="get" href="{{route('Not_Executed_Civil_Cases')}}"><i class="fa fa-check"></i> 
              {{App\Global_var::getLangString('Not_Executed_Civil_Cases', $language_strings)}} 
            </a></td>
          </tr>
          <tr>
            <td><a class="get" href="{{route('Execution_Process_Of_Civil_Cases')}}"><i class="fa fa-check"></i> 
              {{App\Global_var::getLangString('Execution_Process_Of_Civil_Cases', $language_strings)}} 
            </a></td>
          </tr>
        </tbody>
      </table>
    </div>
    @endif

    @if($currentUser->isCrime_Department())
    <div class="col-md-6">
      <table class="table table-striped">
        <thead>
          <th>{{App\Global_var::getLangString('Crime_Cases', $language_strings)}}</th>
        </thead>
        <tbody>
          <tr>
            <td><a class="get" href="{{route('Leading_Investigation_Of_Heavy_Weight_Crimes')}}"><i class="fa fa-check"></i> 
              {{App\Global_var::getLangString('Leading_Investigation_Of_Heavy_Weight_Crimes', $language_strings)}} 
            </a></td>
          </tr> 
          <tr>
            <td><a class="get" href="{{route('Human_Rights_of_Suspected')}}"><i class="fa fa-check"></i> 
              {{App\Global_var::getLangString('Human_Rights_of_Suspected/Accused', $language_strings)}} 
            </a></td>
          </tr>
          <tr>
            <td><a class="get" href="{{route('Human_Rights_in_Prison')}}"><i class="fa fa-check"></i> 
              {{App\Global_var::getLangString('Human_Rights_in_Prison', $language_strings)}} 
            </a></td>
          </tr>
          <tr>
            <td><a class="get" href="{{route('Witness_Services_And_Protection')}}"><i class="fa fa-check"></i> 
              {{App\Global_var::getLangString('Witness_Services_And_Protection', $language_strings)}} 
            </a></td>
          </tr>
          <tr>
            <td><a class="get" href="{{route('Lawyer_Decision_Time_Efficiency')}}"><i class="fa fa-check"></i> 
              {{App\Global_var::getLangString('Lawyer_Decision_Time_Efficiency', $language_strings)}} 
            </a></td>
          </tr>
          <tr>
            <td><a class="get" href="{{route('Returned_For_Further_Investigation')}}"><i class="fa fa-check"></i> 
              {{App\Global_var::getLangString('Returned_For_Further_Investigation', $language_strings)}} 
            </a></td>
          </tr>
          <tr>
            <td><a class="get" href="{{route('Not_Accused_Due_To_Lack_Of_Information')}}"><i class="fa fa-check"></i> 
              {{App\Global_var::getLangString('Not_Accused_Due_To_Lack_Of_Information', $language_strings)}} 
            </a></td>
          </tr>
          <tr>
            <td><a class="get" href="{{route('Picked_Over_Documents')}}"><i class="fa fa-check"></i> 
              {{App\Global_var::getLangString('Picked_Over_Documents', $language_strings)}} 
            </a></td>
          </tr>
          <tr>
            <td><a class="get" href="{{route('Direct_Accusal_Documents')}}"><i class="fa fa-check"></i> 
              {{App\Global_var::getLangString('Direct_Accusal_Documents', $language_strings)}} 
            </a></td>
          </tr>
          <tr>
            <td><a class="get" href="{{route('Court_Process_Of_Direct_Crime_Documents')}}"><i class="fa fa-check"></i> 
              {{App\Global_var::getLangString('Court_Process_Of_Direct_Crime_Documents', $language_strings)}} 
            </a></td>
          </tr>
          <tr>
            <td><a class="get" href="{{route('Winning_Status_Of_Crime_Documents_Appealed_By_Lawyer_On_Free')}}"><i class="fa fa-check"></i> 
              {{App\Global_var::getLangString('Winning_Status_Of_Crime_Documents_Appealed_By_Lawyer_On_Free', $language_strings)}} 
            </a></td>
          </tr>
          <tr>
            <td><a class="get" href="{{route('Winning_Status_Of_Crime_Documents_Appealed_By_Lawyer_On_Punishment')}}"><i class="fa fa-check"></i> 
              {{App\Global_var::getLangString('Winning_Status_Of_Crime_Documents_Appealed_By_Lawyer_On_Punishment', $language_strings)}} 
            </a></td>
          </tr>
          <tr>
            <td><a class="get" href="{{route('Winning_Status_Of_Crime_Documents_Appealed_By_Individual_On_Free')}}"><i class="fa fa-check"></i> 
              {{App\Global_var::getLangString('Winning_Status_Of_Crime_Documents_Appealed_By_Individual_On_Free', $language_strings)}} 
            </a></td>
          </tr>
          <tr>
            <td><a class="get" href="{{route('Winning_Status_Of_Crime_Documents_Appealed_By_Individual_On_Punishment')}}"><i class="fa fa-check"></i> 
              {{App\Global_var::getLangString('Winning_Status_Of_Crime_Documents_Appealed_By_Individual_On_Punishment', $language_strings)}} 
            </a></td>
          </tr>
          <tr>
            <td><a class="get" href="{{route('Winning_Status_Of_Breaking_Crime_Documents_Appealed_By_Lawyer_On_Free')}}"><i class="fa fa-check"></i> 
              {{App\Global_var::getLangString('Winning_Status_Of_Breaking_Crime_Documents_Appealed_By_Lawyer_On_Free', $language_strings)}} 
            </a></td>
          </tr>
          <tr>
            <td><a class="get" href="{{route('Winning_Status_Of_Breaking_Crime_Documents_Appealed_By_Lawyer_On_Punishment')}}"><i class="fa fa-check"></i> 
              {{App\Global_var::getLangString('Winning_Status_Of_Breaking_Crime_Documents_Appealed_By_Lawyer_On_Punishment', $language_strings)}} 
            </a></td>
          </tr>
          <tr>
            <td><a class="get" href="{{route('Winning_Status_Of_Breaking_Crime_Documents_Appealed_By_Individual_On_Free')}}"><i class="fa fa-check"></i> 
              {{App\Global_var::getLangString('Winning_Status_Of_Breaking_Crime_Documents_Appealed_By_Individual_On_Free', $language_strings)}} 
            </a></td>
          </tr>
          <tr>
            <td><a class="get" href="{{route('Winning_Status_Of_Breaking_Crime_Documents_Appealed_By_Individual_On_Punishment')}}"><i class="fa fa-check"></i> 
              {{App\Global_var::getLangString('Winning_Status_Of_Breaking_Crime_Documents_Appealed_By_Individual_On_Punishment', $language_strings)}} 
            </a></td>
          </tr>
        </tbody>
      </table>
    </div>
    @endif

  </div>

</div>
