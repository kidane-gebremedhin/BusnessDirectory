<script type="text/javascript">
var message_life_time=3000;
var xhr;

$(document).on('change', '.authorId', function(e){
  $obj=$('.author_elem');
  if($(this).val()=='')
    $obj.removeAttr('disabled');
  else
    $obj.attr('disabled', 'disabled');
})
$(document).on('change', '.publisherId', function(e){
  $obj=$('.publisher_elem');
  if($(this).val()=='')
    $obj.removeAttr('disabled');
  else
    $obj.attr('disabled', 'disabled');
})

$(document).on('change', '.witness_correctness_statusId', function(e){
  if($(this).val()=='Witnessed_A_Lie'){
    $('.witness_not_correct_accusedDiv').css('display', 'block');
    $('.witness_not_correct_accused').attr('required', 'true');
    }else{
    $('.witness_not_correct_accused').removeAttr('required');
    $('.witness_not_correct_accusedDiv').css('display', 'none');
  }
});

$(document).on('change', '.aynet_trean', function(e){
  $parentModal=$(this).closest('.aynet_treanDiv');
  if($parentModal.find(".aynet_trean option:selected").text()=='ሓቂ ዝኮነ'){
    $parentModal.find('.truthness_status_solvedDiv').css('display', 'block');
  }else{
    $parentModal.find('.truthness_status_solvedDiv').css('display', 'none');
  }
});

function abortAjaxRequest(){
  if(xhr==null || xhr==undefined)
    return;
 xhr.abort();
 console.log("ajax request aborted successfully!");
}

$(document).on('click', '.generateReportByDateIntervalBtn', function(e){
  e.preventDefault();
  $parentDiv = $(this).closest(".generateReportByDateIntervalDiv");
  var searchUrl = $parentDiv.attr('searchUrl');
  var nextUrl = $parentDiv.attr('nextUrl');
  var startDate = $parentDiv.find('.startDate').val();
  var endDate = $parentDiv.find('.endDate').val();
if(startDate==undefined && endDate==undefined)
  return;
  $.ajax({
    type:'get',
    url:searchUrl,
    data: {nextUrl: nextUrl, startDate: startDate, endDate: endDate},
    success:function(data){
    alert(data);
      console.log("success")
      //$(".ajaxContent").empty().append(data);
      $("#container").empty().append(data);
      $(".eth_date").calendarsPicker({calendar: $.calendars.instance('ethiopian')});
    },
    error:function(err){
      console.log("error")
    }
  })
});

/*----------Follow Up -------------*/
$(document).on('change', '.crime_weight', function(e){
  if($(this).val()=='Easy'){
    $('.easy_efficiency_in_timeDiv').css('display', 'block');
    $('.heavy_efficiency_in_timeDiv').css('display', 'none');
  }
  else if($(this).val()=='Heavy'){
    $('.easy_efficiency_in_timeDiv').css('display', 'none');
    $('.heavy_efficiency_in_timeDiv').css('display', 'block');
  }
})

$(document).on('change', '.complain_satisfaction', function(e){
  if($('.complain_satisfaction option:selected').text()=='ዘይዓገበ'){
    $('.not_satisfied_reasonDiv').css('display', 'block');
    $('.not_satisfied_reason').attr('required', 'true');
  }
  else{
    $('.not_satisfied_reasonDiv').css('display', 'none');
    $('.not_satisfied_reason').removeAttr('required');
  }

  optionalFieldsHandler();
})

$(document).on('change', '.crimeWeight', function(e){
  if($(this).val()=='Medium_And_Havy'){
    $('.is_followed_upDiv').css('display', 'block');
    $('.is_followed_up').attr('required', 'true');
  }
  else{
    $('.is_followed_upDiv').css('display', 'none');
    $('.is_followed_up').removeAttr('required');
  }

  optionalFieldsHandler();
})

$(document).on('change', '.is_followed_up', function(e){
  if($(this).val()=='Followed_Up'){
    $('.followed_up_by_lawyerDiv').css('display', 'block');
      $('.followed_up_by_lawyer').attr('required', 'true');
    }
  else{
    $('.followed_up_by_lawyerDiv').css('display', 'none');
    $('.followed_up_by_lawyer').removeAttr('required');
  }
})
/*-----------------------*/
$(document).on('input', '.Search_by_Defendant_Name', function(e){
  e.preventDefault();
  var defendantName = $(this).val();
  var url=$(this).attr('searchUrl');
  $.ajax({
    type:'get',
    data: {defendantName: defendantName},
    url: url,
    success:function(data){
      console.log("success")
      $(".searchResultDiv").empty().append(data);
    },
    error:function(err){
      console.log("error")
    }
  })
})

/*--LIVE COUNTERS--*/
setInterval(function(){
$.ajax({
  type:'get',
  url: "{{url('getLiveCount')}}",
  success: function(data){
    $(".ksiMezgeb").text(data.ksiMezgeb);
    $(".ksiMezgebClosed").text(data.ksiMezgebClosed);
    $(".ksiMezgebAppeal").text(data.ksiMezgebAppeal);
    $(".ksiMezgebNotDecided").text(data.ksiMezgebNotDecided);

    $(".ksiZtemesretelom").text(data.ksiZtemesretelom);
    $(".bezhiAkabiHgiZretalu").text(data.bezhiAkabiHgiZretalu);
    $(".bezhiBAkabiHgiZtedegefu").text(data.bezhiBAkabiHgiZtedegefu);
    $(".bezhiAkabiHgiZretalomYgbeaniMezagbti").text(data.bezhiAkabiHgiZretalomYgbeaniMezagbti);
    $(".bezhiKebedtiMezagbti").text(data.bezhiKebedtiMezagbti);
    $(".bezhiKttlZtegeberelomKebedtiMezagbti").text(data.bezhiKttlZtegeberelomKebedtiMezagbti);


    $(".ftabherMezgeb").text(data.ftabherMezgeb);
    $(".ftabherMezgebClosed").text(data.ftabherMezgebClosed);
    $(".ftabherMezgebAppeal").text(data.ftabherMezgebAppeal);
    $(".ftabherMezgebNotDecided").text(data.ftabherMezgebNotDecided);
    
    $(".ftabher_ksiZtemesretelom").text(data.ftabher_ksiZtemesretelom);
    $(".ftabher_bezhiAkabiHgiZretalu").text(data.ftabher_bezhiAkabiHgiZretalu);
    $(".ftabher_bezhiBAkabiHgiZtedegefu").text(data.ftabher_bezhiBAkabiHgiZtedegefu);
    $(".ftabher_bezhiAkabiHgiZretalomYgbeaniMezagbti").text(data.ftabher_bezhiAkabiHgiZretalomYgbeaniMezagbti);

    if(data.unViewed_ksi_mezgeb_brki_count>0){
      $(".unViewed_ksi_mezgeb_brki_badge").css("display", "block");
    
      $(".unViewed_ksi_mezgeb_brki_count").empty()
    .text(data.unViewed_ksi_mezgeb_brki_count+" <?php echo App\Global_var::getLangString('New_Appeals', $language_strings); ?>");
    }else{
      $(".unViewed_ksi_mezgeb_brki_count").empty()
     /// $(".unViewed_ksi_mezgeb_brki_badge").css("display", "none");
    }

    if(data.unViewed_ftbher_mezgeb_brki_count>0){
      $(".unViewed_ftbher_mezgeb_brki_badge").css("display", "block");
      $(".unViewed_ftbher_mezgeb_brki_count").empty()
    .text(data.unViewed_ftbher_mezgeb_brki_count+" <?php echo App\Global_var::getLangString('New_Appeals', $language_strings); ?>");
    }else{
     $(".unViewed_ftbher_mezgeb_brki_count").empty()
     // $(".unViewed_ftbher_mezgeb_brki_badge").css("display", "none");
    }
  
},
  error: function(err){
    $(".unViewed_ftbher_mezgeb_brki_count").text(0);
    $(".unViewed_ksi_mezgeb_brki_count").text(0);
  }
});
}, 1000);
/*--END OF COUNTERS--*/

$(document).on('change', '.brki_search_elem', function(e){
  e.preventDefault();
  var regionId = $(".regionId").val();
  var zoneId = $(".zoneId").val();
  var weredaId = $(".weredaId").val();
  var url=$(".searchUrlDiv").attr('searchUrl');
//  alert(regionId+' '+zoneId+' '+weredaId+' '+url);
  $.ajax({
    type:'get',
    data: {regionId: regionId, zoneId: zoneId, weredaId: weredaId},
    url: url,
    success:function(data){
      $(".searchResultDiv").empty().append(data);
    },
    error:function(err){
      console.log("live counter error")
    }
  })
})

$(document).on('change', '.crime_typeId_search', function(e){
  e.preventDefault();
$( ".crime_type_searchForm" ).submit();
})

$(document).on('submit', '.crime_type_searchForm', function(e){
  e.preventDefault();
  var data=$(this).serialize();
  var url=$(this).attr('action');
  $.ajax({
    type:'get',
    url: url,
    data: data,
    success: function(data){
      $(".searchResultDiv").empty().append(data);
    },
    error: function(err){
      console.log('ksi_mezgeb_searchForm search error')
    }
  })
})

$(document).on('submit', '.ksi_mezgeb_searchForm', function(e){
  e.preventDefault();

  var data=$(this).serialize();
  var url=$(this).attr('action');
  $.ajax({
    type:'get',
    url: url,
    data: data,
    success: function(data){
      $(".searchResultDiv").empty().append(data);
    },
    error: function(err){
      console.log("error")
      console.log('ksi_mezgeb_searchForm search error')
    }
  })
})

/*---Tab--------*/
$(document).ready(function(){
    activateTab('first_tab');
});

$(document).on('click', '.tap_element', function(e){
  var id=$(this).attr('href');
  id=id.substr(1);
  activateTab(id);
})
function activateTab(tab){
  return;

  if(tab==undefined)
    tab="first_tab";
    $('.nav-tabs a[href="#' + tab + '"]').tab('show');
}
/*--End of Tab---*/

$(document).on('change', '.healthStatusId', function(e){
  $parentDiv=$(this).closest('.only_forHealthStatus');
  var healthStatus=$parentDiv.find('.healthStatusId option:selected').text();
  if(healthStatus=='ኣካል ጉድእ'){
    $parentDiv.find('.disabilityDiv').css('display', 'block');
    $parentDiv.find('.disabilityTypeIds').attr('required', 'true');
    //initializeSelect2();
  }
  else{
    $parentDiv.find('.disabilityTypeIds').html($('.disabilityTypeIds').html().replace('selected', ''));
    $parentDiv.find('.disabilityDiv').css('display', 'none');
    $parentDiv.find('.disabilityTypeIds').removeAttr('required');
  }
})

/*-------Back functionality*/
$(document).ready(function($) {
  if (window.history.pushState) {
   // window.history.pushState('forward', null, './#forward');
    $(window).on('popstate', function() {
      location.reload();
    });
  }
});

window.onpopstate = function() {
     var referrer =  document.referrer;
     //console.log(referrer+" referrer")
   //activateFullUrl(referrer);
     // location.reload();
history.pushState({}, referrer);
}; 
/*-------end of back------*/

$(document).on('change', '.execution_ablility', function(e){
  $parentModal=$(this).closest('.ModalContentDiv');
  if($(this).val()=='Able_To_Execute'){
    $parentModal.find('.is_able_to_execute_reasonDiv').css('display', 'block');
    $parentModal.find('.unable_to_execute_reasonDiv').css('display', 'none');
    $parentModal.find('.execution_accusal_statusDiv').css('display', 'block');
  }else{
    $parentModal.find('.is_able_to_execute_reasonDiv').css('display', 'none');
    $parentModal.find('.execution_accusal_statusDiv').css('display', 'none');
    $parentModal.find('.unable_to_execute_reasonDiv').css('display', 'block');
  }
});
$(document).on('change', '.execution_accusal_status', function(e){
  $parentModal=$(this).closest('.ModalContentDiv');
  if($(this).val()=='Accused_On_Execution'){
    $parentModal.find('.execution_court_decision_typeDiv').css('display', 'block');
  }else{
    $parentModal.find('.execution_court_decision_typeDiv').css('display', 'none');
  }
});
$(document).on('change', '.execution_court_decision_type', function(e){
  $parentModal=$(this).closest('.ModalContentDiv');
  if($(this).val()=='Executed'){
    $parentModal.find('.not_executed_court_decision_reasonDiv').css('display', 'none');
    $parentModal.find('.execution_court_decision_arguementTypeDiv').css('display', 'block');
  }else{
    $parentModal.find('.execution_court_decision_arguementTypeDiv').css('display', 'none');
    $parentModal.find('.not_executed_court_decision_reasonDiv').css('display', 'block');
  }
});



$(document).on('change', '.agentType', function(e){
    var agentType=$(this).val();
   if(agentType=='Justice_Office'){
    $('.individualDiv').css('display', 'none');
    $('.organizationDiv').css('display', 'block');
    $('.organizationDiv').find('input').removeAttr('disabled');
   }else{
    //hide both and show name and phone only
    $('.individualDiv').css('display', 'none');
    $('.organizationDiv').css('display', 'none');
   }
});

$(document).on('change', '.supervise_quality_checkbox', function(e){
    var isPositive=$(this).is(':checked');
    var qualityType=$(this).attr('qualityType');
    var url=$(this).attr('actionUrl')+'/'+isPositive+'/'+qualityType;
    e.preventDefault();
                  $.ajax({
                    type: 'get',
                    url: url,
                    success: function(data){
                      showSuccessMessage(showLang_successMessage(data[1]));
    },
    error:function(err){
      console.log('error')
    }
  })
});
$(document).on('change', '.isAppealerLawyer_CheckBox', function(e){
  $parentModal=$(this).closest('.modal');
  var checked=$(this).is(":checked");
  if(!checked){
    $parentModal.find('.appealRequestedByDiv').find('.appealRequestedBy').attr('disabled', 'disabled');
    $parentModal.find('.appealRequestedByDiv').find('.appealRequestedBy').removeAttr('required');
    
    $parentModal.find('.appealRespondedByDiv').css('display', 'block');
    $parentModal.find('.appealRespondedByDiv').find('.appealRespondedBy').attr('required', 'true');
    $parentModal.find('.appealRespondedByDiv').find('.appealRespondedBy_phoneNumber').removeAttr('required');
  }else{
    $parentModal.find('.appealRespondedByDiv').css('display', 'none');
    $parentModal.find('.appealRespondedByDiv').find('.appealRespondedBy').removeAttr('required');

    $parentModal.find('.appealRequestedByDiv').find('.appealRequestedBy').removeAttr('disabled');
    $parentModal.find('.appealRequestedByDiv').find('.appealRequestedBy').attr('required', 'true');
    $parentModal.find('.appealRespondedByDiv').find('.appealAllowedBy_phoneNumber').removeAttr('required');
  }
});
$(document).on('change', '.isOpponentDecisionMaker_akabiHgiCkeckBox', function(e){
  $parentModal=$(this).closest('.ModalContentDiv');
  var checked=$(this).is(":checked");
  if(!checked){
    $parentModal.find('.oppenent_akabiHgiDiv').css('display', 'block');
    $parentModal.find('.oppenent_akabiHgiDiv').find('.oppenent_akabiHgi').attr('required', 'true');
  }else{
    $parentModal.find('.oppenent_akabiHgiDiv').css('display', 'none');
    $parentModal.find('.oppenent_akabiHgiDiv').find('.oppenent_akabiHgi').removeAttr('required');
  }
});

$(document).on('change', '.brkiId', function(e){
  var brkiName=$('.brkiId option:selected').text();
  /*if(brkiName=='ፌዴራል'){
    $('.region').html($('.region').html().replace('selected', ''));
    $('.region').removeAttr('required');
    $('.region').attr('disabled', 'disabled');
  }
  else*/
   if(brkiName=='ላዕለዋይ ቤት ፍርዲ ክልል' || brkiName=='ሰበር ክልል' || brkiName=='ላዕለዋይ ቤት ፍርዲ ፌዴራል' || brkiName=='ሰበር ፌዴራል' || brkiName=='ቤት ምኽሪ ክልል' || brkiName=='ቤት ምኽሪ ፌዴራል'){
    $('.region').removeAttr('disabled');
    $('.region').attr('required', 'true');
    
    $('.zone').html($('.zone').html().replace('selected', ''));
    $('.zone').removeAttr('required');
    $('.zone').attr('disabled', 'disabled');

  }
  else if(brkiName=='ዞባ ቤት ፍርዲ'){
    $('.region').removeAttr('disabled');
    $('.region').attr('required', 'true');
    
    $('.wereda').html($('.wereda').html().replace('selected', ''));
    $('.wereda').removeAttr('required');
    $('.wereda').attr('disabled', 'disabled');
  }
  else if(brkiName=='ወረዳ'){
    $('.region').removeAttr('disabled');
    $('.region').attr('required', 'true');
    
    //$('.subWereda').html($('.subWereda').html().replace('selected', ''));
    $('.subWereda').removeAttr('required');
    $('.subWereda').attr('disabled', 'disabled');
  }
  else if(brkiName=='ንኡስ ወረዳ'){
    $('.region').removeAttr('disabled');
    $('.region').attr('required', 'true');
  }
  else{
    $('.region').removeAttr('disabled');
    $('.region').attr('required', 'true');
  }
});

$(document).on('click', '.AccuserDetailBtn', function(e){
  e.preventDefault();
  $(this).closest('td').find('.AccuserDetailModal').css('display', 'block');
});

$(document).on('click', '.DefendantDetailBtn', function(e){
  e.preventDefault();
  $(this).closest('td').find('.DefendantDetailModal').css('display', 'block');
});

$(document).on('click', '.akabiHgiDesisionTypeDetailBtn', function(e){
  e.preventDefault();
  showakabiHgiDesisionTypeDetailModal($(this));
});

function showakabiHgiDesisionTypeDetailModal($obj){
  $obj.closest('td').find('.akabiHgiDesisionTypeDetailModal').css('display', 'block');
}
function closeakabiHgiDesisionTypeDetailModal(){
  $('.akabiHgiDesisionTypeDetailModal').css('display', 'none');
}

$(document).on('click', '.betFrdiDesisionTypeDetailBtn', function(e){
  e.preventDefault();
  showBetFrdiDesisionTypeDetailModal($(this));
});

$(document).on('click', '.executionStatusDetailBtn', function(e){
  e.preventDefault();
  showexecutionStatusDetailModal($(this));
});

function showexecutionStatusDetailModal($obj){
  $obj.closest('td').find('.executionStatusDetailModal').css('display', 'block');
}
function closeexecutionStatusDetailModal(){
  $('.executionStatusDetailModal').css('display', 'none');
}
function showBetFrdiDesisionTypeDetailModal($obj){
  $obj.closest('td').find('.betFrdiDesisionTypeDetailModal').css('display', 'block');
}
function closeBetFrdiDesisionTypeDetailModal(){
  $('.betFrdiDesisionTypeDetailModal').css('display', 'none');
}

$(document).on('click', '.appealAllowedByBtn', function(e){
  e.preventDefault();
  showAppealAllowedByModal($(this));
  $('.AppealForm_RequiredElement').attr('required', 'true');  
    $('.eth_date, .eth_date_hidden').attr('autocomplete', 'off');
});

function showAppealAllowedByModal($obj){
  $obj.closest('.FormDiv').find('.appealAllowedByModal').css('display', 'block');
}
function closeAppealAllowedByModal(){
  $('.appealAllowedByModal').css('display', 'none');
}

$(document).on('click', '.appointmentDateBtn', function(e){
  e.preventDefault();
  showAppointmentDateModal();
  ksi_mezgebId=$(this).attr('ksi_mezgebId');
  $('.ksi_mezgebId').val(ksi_mezgebId);
  ksi_mezgeb_brkiId=$(this).attr('ksi_mezgeb_brkiId');
  $('.ksi_mezgeb_brkiId').val(ksi_mezgeb_brkiId);
  $('.eth_date, .eth_date_hidden').attr('autocomplete', 'off');

});

$(document).on('click', '.betFrdiMezgebKutsriBtn', function(e){
  e.preventDefault();

  $("#betFrdiMezgebKutsriModal").css("display", "block");

  ksi_mezgebId=$(this).attr('ksi_mezgebId');
  $('.ksi_mezgebId').val(ksi_mezgebId);
  ksi_mezgeb_brkiId=$(this).attr('ksi_mezgeb_brkiId');
  $('.ksi_mezgeb_brkiId').val(ksi_mezgeb_brkiId);
  $('.eth_date, .eth_date_hidden').attr('autocomplete', 'off');

});

function showAppointmentDateModal(){
 var appointmentDateModal = document.getElementById('appointmentDateModal');
  if(appointmentDateModal!=null && appointmentDateModal!=undefined)
    appointmentDateModal.style.display = "block";
  $('.appointmentDateModal').find(".eth_date").calendarsPicker({calendar: $.calendars.instance('ethiopian')});
  
}
function closeAppointmentDateModal(){
var appointmentDateModal = document.getElementById('appointmentDateModal');
  if(appointmentDateModal!=null && appointmentDateModal!=undefined)
  appointmentDateModal.style.display = "none";
}

$(document).on('change', '.checkAll_appealCheckBox', function(e){
  var checked=$(this).is(":checked");
var ksi_mezgeb_brkiId=$(this).attr('ksi_mezgeb_brkiId');
  if(checked){
    $('.'+ksi_mezgeb_brkiId+'_appealCheckBox').prop('checked', 'checked');
  }else{
    $('.'+ksi_mezgeb_brkiId+'_appealCheckBox').removeAttr('checked');
  }
});

$(document).on('change', '.akabiHgi_decisionTypeId', function(e){
  $parentModal=$(this).closest('.ModalContentDiv');
  if($parentModal.find('.akabiHgi_decisionTypeId option:selected').text()=='ክሲ ዝተመስረቶ'){
    $parentModal.find('.afterCrimeCommitedDiv').css('display', 'none');
    $parentModal.find('.documentReturnDateDiv').css('display', 'none');
    $parentModal.find('.afterCrimeCommited').removeAttr('required');
    $parentModal.find('.lawyerPoliceDocumentReturnDate').removeAttr('required');
    $parentModal.find('.modification_statusDiv').css('display', 'block');
  
    $parentModal.find('.akabiHgi_numericValueDiv').css('display', 'block');
    $parentModal.find('.akabiHgi_numericValue').attr('required', 'true');
    }else{
   if($parentModal.find('.akabiHgi_decisionTypeId option:selected').text()=='መረዳእታ ብዘይምርካብ ዝተዓፀወ'){
    $parentModal.find('.documentReturnDateDiv').css('display', 'none');
    $parentModal.find('.lawyerPoliceDocumentReturnDate').removeAttr('required');
    $parentModal.find('.modification_statusDiv').css('display', 'none');

    $parentModal.find('.afterCrimeCommitedDiv').css('display', 'block');
    $parentModal.find('.afterCrimeCommited').attr('required', 'true');
  }else if($parentModal.find('.akabiHgi_decisionTypeId option:selected').text()=='ንተወሳኺ ምፅራይ ዝተመለሰ'){
    $parentModal.find('.afterCrimeCommitedDiv').css('display', 'none');
    $parentModal.find('.afterCrimeCommited').removeAttr('required');
    $parentModal.find('.modification_statusDiv').css('display', 'none');

    $parentModal.find('.documentReturnDateDiv').css('display', 'block');
    $parentModal.find('.lawyerPoliceDocumentReturnDate').attr('required', 'true');
  }else{
    $parentModal.find('.afterCrimeCommitedDiv').css('display', 'none');
    $parentModal.find('.afterCrimeCommited').removeAttr('required');
    $parentModal.find('.documentReturnDateDiv').css('display', 'none');
    $parentModal.find('.lawyerPoliceDocumentReturnDate').removeAttr('required');
    $parentModal.find('.modification_statusDiv').css('display', 'none');
  }
  
    $parentModal.find('.akabiHgi_numericValueDiv').css('display', 'none');
    $parentModal.find('.akabiHgi_numericValue').removeAttr('required');
    }
});

$(document).on('click', '.activate_akabiHgiRecordBtn', function(e){
    e.preventDefault();
    recordId=$(this).attr('recordId');
    ksi_mezgeb_brkiId=$(this).attr('ksi_mezgeb_brkiId');
    kesasiId=$(this).attr('kesasiId');
    tekesasiId=$(this).attr('tekesasiId');
    crimeTypeId=$(this).attr('crimeTypeId');

    showactivate_akabiHgiRecordModal(ksi_mezgeb_brkiId);
    
    $('.recordId').val(recordId)
    $('.ksi_mezgeb_brkiId').val(ksi_mezgeb_brkiId)
    $('.kesasiId').val(kesasiId)
    $('.tekesasiId').val(tekesasiId)
    $('.crimeTypeId').val(crimeTypeId)

    $('.eth_date, .eth_date_hidden').attr('autocomplete', 'off');
});
$(document).on('click', '.activate_betFrdiRecordBtn', function(e){
    e.preventDefault();
    recordId=$(this).attr('recordId');
    ksi_mezgeb_brkiId=$(this).attr('ksi_mezgeb_brkiId');
    kesasiId=$(this).attr('kesasiId');
    tekesasiId=$(this).attr('tekesasiId');
    crimeTypeId=$(this).attr('crimeTypeId');

    showactivate_betFrdiRecordModal(ksi_mezgeb_brkiId);
    
    $('.recordId').val(recordId)
    $('.ksi_mezgeb_brkiId').val(ksi_mezgeb_brkiId)
    $('.kesasiId').val(kesasiId)
    $('.tekesasiId').val(tekesasiId)
    $('.crimeTypeId').val(crimeTypeId)
    $('.eth_date, .eth_date_hidden').attr('autocomplete', 'off');

});

$(document).on('click', '.akabiHgiDesisionBtn', function(e){
    e.preventDefault();
    $('.eth_date, .eth_date_hidden').attr('autocomplete', 'off');
    $('.LawyerForm_RequiredElement').attr('required', 'true');

    recordId=$(this).attr('recordId');
    ksi_mezgeb_brkiId=$(this).attr('ksi_mezgeb_brkiId');
    kesasiId=$(this).attr('kesasiId');
    tekesasiId=$(this).attr('tekesasiId');
    crimeTypeId=$(this).attr('crimeTypeId');

    showakabiHgiDesisionModal(ksi_mezgeb_brkiId);
    
    $('.recordId').val(recordId)
    $('.ksi_mezgeb_brkiId').val(ksi_mezgeb_brkiId)
    $('.kesasiId').val(kesasiId)
    $('.tekesasiId').val(tekesasiId)
    $('.crimeTypeId').val(crimeTypeId)

    $('.eth_date, .eth_date_hidden').attr('autocomplete', 'off');
});

$(document).on('click', '.executionStatusBtn', function(e){
    e.preventDefault();
    ksi_mezgeb_brkiId=$(this).attr('ksi_mezgeb_brkiId');
    recordId=$(this).attr('recordId');
    kesasiId=$(this).attr('kesasiId');
    tekesasiId=$(this).attr('tekesasiId');
    crimeTypeId=$(this).attr('crimeTypeId');
 
    $('.LawyerForm_RequiredElement').attr('required', 'true');
    showExecutionDesisionModal(ksi_mezgeb_brkiId);
    $('.recordId').val(recordId)    
    $('.ksi_mezgeb_brkiId').val(ksi_mezgeb_brkiId)
    $('.kesasiId').val(kesasiId)
    $('.tekesasiId').val(tekesasiId)
    $('.crimeTypeId').val(crimeTypeId)

    $('.eth_date, .eth_date_hidden').attr('autocomplete', 'off');
});

$(document).on('change', '.lifeSentenceCheckBox', function(e){
  var checked=$(this).is(":checked");
  var row=$(this).closest('.lengthOfPrisonDiv');
  if(checked){
    row.find('.lengthOfPrison').removeAttr('required');
    row.find('.lengthOfPrison').attr('disabled', 'disabled');
  }else{
    row.find('.lengthOfPrison').attr('required', 'true');
    row.find('.lengthOfPrison').removeAttr('disabled');
  }
});

$(document).on('change', '.compensationType', function(e){
  $parentModal=$(this).closest('.modal');
if($(this).val()=='Property'){
    $parentModal.find('.amountOfMoneyDiv').css('display', 'none');
    $parentModal.find('.amountOfMoney').removeAttr('required');
    $parentModal.find('.amountOfMoneyLb').css('display', 'none');
    $parentModal.find('.amountOfPropertyLb').css('display', 'block');

    $parentModal.find('.propertyTypeDiv').css('display', 'block');
    $parentModal.find('.propertyType').attr('required', 'true');
  }else{
    $parentModal.find('.amountOfPropertyLb').css('display', 'none');
    $parentModal.find('.amountOfMoneyLb').css('display', 'block');

    $parentModal.find('.propertyTypeDiv').css('display', 'none');
    $parentModal.find('.propertyType').removeAttr('required');
  }
});

$(document).on('change', '.inherit_typeId', function(e){
  $parentModal=$(this).closest('.inheritTypeDiv');

if($parentModal.find('.inherit_typeId option:selected').text()=='ንብረት'){
    $parentModal.find('.inheritAmountDiv').css('display', 'none');
    $parentModal.find('.inheritAmount').removeAttr('required');
    $parentModal.find('.propertyTypesDiv').css('display', 'block');
    $parentModal.find('.propertyTypes').attr('required', 'true');
  }else{
    $parentModal.find('.propertyTypesDiv').css('display', 'none');
    $parentModal.find('.propertyTypes').removeAttr('required');
    $parentModal.find('.inheritAmountDiv').css('display', 'block');
    $parentModal.find('.inheritAmount').attr('required', 'true');
  }
});
$(document).on('change', '.punishmentType', function(e){
$parentModal=$(this).closest('.punishmentType_oneRow');
if($(this).val()=='Money'){
    $parentModal.find('.lengthOfPrisonDiv').css('display', 'none');
    $parentModal.find('.lengthOfPrison').removeAttr('required');
    $parentModal.find('.lengthOfRestrictionDiv').css('display', 'none');
    $parentModal.find('.lengthOfRestriction').removeAttr('required');
    $parentModal.find('.amountOfMoneyDiv').css('display', 'block');
    $parentModal.find('.amountOfMoney').attr('required', 'true');
  }else if($(this).val()=='Restriction'){
    $parentModal.find('.lengthOfPrisonDiv').css('display', 'none');
    $parentModal.find('.lengthOfPrison').removeAttr('required');
    $parentModal.find('.amountOfMoneyDiv').css('display', 'none');
    $parentModal.find('.amountOfMoney').removeAttr('required');
    $parentModal.find('.lengthOfRestrictionDiv').css('display', 'block');
    $parentModal.find('.lengthOfRestriction').attr('required', 'true');
  }else if($(this).val()=='Prison'){
    $parentModal.find('.amountOfMoneyDiv').css('display', 'none');
    $parentModal.find('.amountOfMoney').removeAttr('required');
    $parentModal.find('.lengthOfRestrictionDiv').css('display', 'none');
    $parentModal.find('.lengthOfRestriction').removeAttr('required');
    $parentModal.find('.lengthOfPrisonDiv').css('display', 'block');
    $parentModal.find('.lengthOfPrison').attr('required', 'true');
  }else if($(this).val()=='Death'){
    $parentModal.find('.amountOfMoneyDiv').css('display', 'none');
    $parentModal.find('.amountOfMoney').removeAttr('required');
    $parentModal.find('.lengthOfRestrictionDiv').css('display', 'none');
    $parentModal.find('.lengthOfRestriction').removeAttr('required');
    $parentModal.find('.lengthOfPrisonDiv').css('display', 'none');
    $parentModal.find('.lengthOfPrison').removeAttr('required');
  }
});

$(document).on('change', '.ftabher_punishmentType', function(e){
  $parentModal=$(this).closest('.modal');
if($(this).val()=='Money'){
    $parentModal.find('.compensationTypeDiv').css('display', 'none');
    $parentModal.find('.compensationType').removeAttr('required');
    $parentModal.find('.compensationChild').removeAttr('required');
    $parentModal.find('.amountOfMoneyDiv').css('display', 'block');
    $parentModal.find('.amountOfMoney').attr('required', 'true');
  }else if($(this).val()=='Compensation'){
    $parentModal.find('.amountOfMoneyDiv').css('display', 'none');
    $parentModal.find('.amountOfMoney').removeAttr('required');
    $parentModal.find('.compensationTypeDiv').css('display', 'block');
    $parentModal.find('.compensationType').attr('required', 'true');
    $parentModal.find('.compensationAmount').attr('required', 'true');

  }else{
    $parentModal.find('.amountOfMoneyDiv').css('display', 'none');
    $parentModal.find('.amountOfMoney').removeAttr('required');

    $parentModal.find('.compensationTypeDiv').css('display', 'none');
    $parentModal.find('.compensationType').removeAttr('required');
    $parentModal.find('.compensationChild').removeAttr('required');
    $parentModal.find('.compensationType').removeAttr('required');
    $parentModal.find('.compensationAmount').removeAttr('required');
    }

    if($(this).val()=='Money' || $(this).val()=='Compensation' || $(this).val()=='Return_Of_Property' || $(this).val()=='Money'){
    $parentModal.find('.betFrdi_numericValueDiv').css('display', 'block');
    $parentModal.find('.betFrdi_numericValue').attr('required', 'true');
    }
    else{
    $parentModal.find('.betFrdi_numericValue').removeAttr('required');
    $parentModal.find('.betFrdi_numericValueDiv').css('display', 'none');
    }
});

$(document).on('change', '.betFrdi_decisionTypeId', function(e){
  $parentModal=$(this).closest('.ModalContentDiv');
  if($parentModal.find('.betFrdi_decisionTypeId option:selected').text()=='ነፃ'){
    $parentModal.find('.punishmentTypeDiv').css('display', 'none');
    $parentModal.find('.punishmentType').removeAttr('required');
    $parentModal.find('.pickedOverReasonDiv').css('display', 'none');
    $parentModal.find('.pickedOverReason').removeAttr('required');

    $parentModal.find('.afterDefendedDiv').css('display', 'block');
    $parentModal.find('.afterDefended').attr('required', 'true');
    
    $parentModal.find('.betFrdi_numericValue').removeAttr('required');
    $parentModal.find('.betFrdi_numericValueDiv').css('display', 'none');
}else if($parentModal.find('.betFrdi_decisionTypeId option:selected').text()=='ጥፍኣተኛ/በዓል ዕዳ' || $parentModal.find('.betFrdi_decisionTypeId option:selected').text()=='ጥፍኣት'){
    $parentModal.find('.afterDefendedDiv').css('display', 'none');
    $parentModal.find('.afterDefended').removeAttr('required');
    $parentModal.find('.pickedOverReasonDiv').css('display', 'none');
    $parentModal.find('.pickedOverReason').removeAttr('required');

    $parentModal.find('.punishmentTypeDiv').css('display', 'block');
    $parentModal.find('.punishmentType').attr('required', 'true');
  }else if($parentModal.find('.betFrdi_decisionTypeId option:selected').text()=='ዝተልዓለ'){
    $parentModal.find('.punishmentTypeDiv').css('display', 'none');
    $parentModal.find('.punishmentType').removeAttr('required');
    $parentModal.find('.afterDefendedDiv').css('display', 'none');
    $parentModal.find('.afterDefended').removeAttr('required');

    $parentModal.find('.pickedOverReasonDiv').css('display', 'block');
    $parentModal.find('.pickedOverReason').attr('required', 'true');
  }else{
    $parentModal.find('.afterDefendedDiv').css('display', 'none');
    $parentModal.find('.afterDefended').removeAttr('required');
    $parentModal.find('.punishmentTypeDiv').css('display', 'none');
    $parentModal.find('.punishmentType').removeAttr('required');
    $parentModal.find('.pickedOverReasonDiv').css('display', 'none');
    $parentModal.find('.pickedOverReason').removeAttr('required');
    
    $parentModal.find('.betFrdi_numericValue').removeAttr('required');
    $parentModal.find('.betFrdi_numericValueDiv').css('display', 'none');
    
    }
});


$(document).on('change', '.warrant_Status', function(e){
  $parentModal=$(this).closest('.ModalContentDiv');
  if($(this).val()=='Allowed'){
    $parentModal.find('.warrant_Execution_StatusDiv').css('display', 'block');
    $parentModal.find('.warrant_Execution_StatusDiv').find('.warrant_Execution_Status').attr('required', 'true');
  }else{
    $parentModal.find('.warrant_Execution_StatusDiv').css('display', 'none');
    $parentModal.find('.warrant_Execution_StatusDiv').find('.warrant_Execution_Status').removeAttr('required');
  }
});

$(document).on('click', '.betFrdiDesisionBtn', function(e){
  e.preventDefault();
    $('.BetFrdiForm_RequiredElement').attr('required', 'true');

    recordId=$(this).attr('recordId');
    ksi_mezgeb_brkiId=$(this).attr('ksi_mezgeb_brkiId');
    kesasiId=$(this).attr('kesasiId');
    tekesasiId=$(this).attr('tekesasiId');
    crimeTypeId=$(this).attr('crimeTypeId');

   showbetFrdiDesisionModal(ksi_mezgeb_brkiId);
   
   ksi_ztemesreto=$(this).attr('ksi_ztemesreto');
   if(ksi_ztemesreto=='true'){
    $('.courtProcessDiv').css('display', 'block');
    $('.courtProcessDiv').find('.warrant_Status').attr('required', 'true');
   }else{
    $('.courtProcessDiv').css('display', 'none');
    $('.courtProcessDiv').find('.warrant_Status').removeAttr('required');
   }
   
    $('.recordId').val(recordId)
    $('.ksi_mezgeb_brkiId').val(ksi_mezgeb_brkiId)
    $('.kesasiId').val(kesasiId)
    $('.tekesasiId').val(tekesasiId)
    $('.crimeTypeId').val(crimeTypeId)
    $('.eth_date, .eth_date_hidden').attr('autocomplete', 'off');
});

function showactivate_betFrdiRecordModal(ksi_mezgeb_brkiId){
 var activate_betFrdiRecordModal = document.getElementById(ksi_mezgeb_brkiId+'_activate_betFrdiRecordModal');
  if(activate_betFrdiRecordModal!=null && activate_betFrdiRecordModal!=undefined)activate_betFrdiRecordModal.style.display = "block";
}
function showactivate_akabiHgiRecordModal(ksi_mezgeb_brkiId){
 var activate_akabiHgiRecordModal = document.getElementById(ksi_mezgeb_brkiId+'_activate_akabiHgiRecordModal');
  if(activate_akabiHgiRecordModal!=null && activate_akabiHgiRecordModal!=undefined)activate_akabiHgiRecordModal.style.display = "block";
}

function showakabiHgiDesisionModal(ksi_mezgeb_brkiId){
 var akabiHgiDesisionModal = document.getElementById('akabiHgiDesisionModal');
  if(akabiHgiDesisionModal!=null && akabiHgiDesisionModal!=undefined)
    akabiHgiDesisionModal.style.display = "block";

  init($('select'))
  $('select').select2("destroy");
  ksi_mezgeb_brkiId=$(this).attr('ksi_mezgeb_brkiId');
  $('.akabiHgi_formContent').empty().append($('#'+ksi_mezgeb_brkiId+'_akabiHgi_formContent').html());
  init($('select'))
  $('.akabiHgi_formContent').find(".eth_date_hidden").calendarsPicker({calendar: $.calendars.instance('ethiopian')});
}

function showExecutionDesisionModal(ksi_mezgeb_brkiId){
 var akabiHgiDesisionModal = document.getElementById('Execution_StatusModal');
  if(akabiHgiDesisionModal!=null && akabiHgiDesisionModal!=undefined)
    akabiHgiDesisionModal.style.display = "block";

  init($('select'))
  $('select').select2("destroy");
  ksi_mezgeb_brkiId=$(this).attr('ksi_mezgeb_brkiId');
 $('.Execution_Status_formContent').empty().append($('#'+ksi_mezgeb_brkiId+'_Execution_Status_formContent').html());
  init($('select'))
  $('.Execution_Status_formContent').find(".eth_date_hidden").calendarsPicker({calendar: $.calendars.instance('ethiopian')});
}

function closeakabiHgiDesisionModal(){
var akabiHgiDesisionModal = document.getElementsByClassName('modal');//('akabiHgiDesisionModal');
  if(akabiHgiDesisionModal!=null && akabiHgiDesisionModal!=undefined)
  akabiHgiDesisionModal.style.display = "none";
}
function showbetFrdiDesisionModal(ksi_mezgeb_brkiId){
 var betFrdiDesisionModal = document.getElementById('betFrdiDesisionModal');
  if(betFrdiDesisionModal!=null && betFrdiDesisionModal!=undefined)
    betFrdiDesisionModal.style.display = "block";

  init($('select'))
  $('select').select2("destroy");
  ksi_mezgeb_brkiId=$(this).attr('ksi_mezgeb_brkiId');
 $('.betFrdi_formContent').empty().append($('#'+ksi_mezgeb_brkiId+'_betFrdi_formContent').html());
  init($('select'))
  $('.betFrdi_formContent').find(".eth_date_hidden").calendarsPicker({calendar: $.calendars.instance('ethiopian')});
}
function closebetFrdiDesisionModal(){
var betFrdiDesisionModal = document.getElementById('betFrdiDesisionModal');
  if(betFrdiDesisionModal!=null && betFrdiDesisionModal!=undefined)
  betFrdiDesisionModal.style.display = "none";
}

//not a replaceAt
function setCharAt(str,index,chr) {
    if(index > str.length-1) return str;
    return str.substr(0,index) + chr + str.substr(index+1);
}
function set_optionaFields(){
 $('.optionalField').removeAttr('required');
}
$(document).on('change', '.isAccuserALawOfficer_checkBox', function(e){
    var checked=$(this).is(":checked");
  if(checked){
  $(this).val('true');
  var row=$(this).closest('.accusers_oneRow');
  row.find('.canBeOptional').removeAttr('required');
  //row.find('.canBeOptional').val(1);
  row.find('.canBeOptional').attr('disabled', 'disabled');
  }
  else{
    $(this).val('false');
  var row=$(this).closest('.accusers_oneRow');
  row.find('.canBeOptional').attr('required', 'true');
  //row.find('.canBeOptional').val('');
  row.find('.canBeOptional').removeAttr('disabled');
  }
  /*var checked=$(this).is(":checked");
    var className=$(this).closest('.checkboxParentDiv').attr('class');
  if(checked){
    $('.'+className+' .lawOfficerInfo').css('display', 'block');
  $(this).val('true');
  }
  else{
    $('.'+className+' .lawOfficerInfo').css('display', 'none');
    $(this).val('false');
  }*/
});

$(document).on('change', '.isAccuserAVictim_CheckBox', function(e){
  var checked=$(this).is(":checked");
    var className=$(this).closest('.checkboxParentDiv').attr('class');
  if(!checked){
    //$('.'+className+' .tebedaliInfo').first().css('display', 'block');
    $(this).closest('.checkboxParentDiv').find('.tebedaliInfo').css('display', 'block');
  }
  else{
    //$('.'+className+' .tebedaliInfo').first().css('display', 'none');
    $(this).closest('.checkboxParentDiv').find('.tebedaliInfo').css('display', 'none');
  }
});

$(document).on('click', '.printBtn', function(e){
  e.preventDefault();
  var printArea=$(this).attr('printArea');
  var title=$(this).attr('title');
  var footer=$(this).attr('footer');
  footer=footer!=undefined? footer: "Tigray Region Justice Office";
  $(printArea).printThis({
     beforePrint: function(){ },
    importCSS: false,
    importStyle: false,
    //loadCSS: "build/css/kg_custom.min.css",
    pageTitle:title, 
    header: "<h1>"+title+"</h1>",
    //footer: '<center>'+footer+'</center>',
  });
})
function all_fieldsInClassAreEmpty(className){
  var elementsWithClass=document.getElementsByClassName(className);
  for(var i=0; i<elementsWithClass.length; i++){
      if(elementsWithClass[i].type=='checkbox')
        continue;//skip checkbox value
      if(elementsWithClass[i].value!=""){
        return false;
      }
    }
  return true;
}

function init($elem) {
    $elem.select2({
        width: 'resolve'
    });   
}

/*------dayanu -------*/
$(document).on("click", '.dayanu_addRowsBtn', function(e){
  e.preventDefault();
  
  $parentModal=$(this).closest('.modal');
  
  var numberOfRowsTobeAdded=$parentModal.find(".dayanu_numberOfRowsTobeAdded").val();
  var numberOfFields=$parentModal.find(".dayanu_numberOfRows").attr('dayanu_numberOfFields');
  numberOfFields=numberOfFields==undefined|| numberOfFields==''? 1: numberOfFields;
  for(var i=0; i<numberOfRowsTobeAdded; i++){
     $('select').removeClass('select2')
/*---Appended Select2 Initializer---*/
  init($('select'))
  $('select').select2("destroy");

  $parentModal.find('.dayanu_rowsContainer').append($('.dayanu_oneRowData').html())
  
  init($('select'))
  }
   elementClasses=$parentModal.find(".dayanu_rowElement").prop("classList");
  rowDivs=$parentModal.find('.dayanu_oneRow');
  $parentModal.find(".dayanu_numberOfRows").val(rowDivs.length)
  elementsWithClass=$parentModal.find('.dayanu_rowElement');
  var lastRow=1;
  for(var i=0; i<elementsWithClass.length;i++){
    var postFix=parseInt(i/numberOfFields)+1;/*as there are numberOfFields row elements*/
    var name=$(elementsWithClass[i]).attr('name');
    $(elementsWithClass[i]).attr('name', name.substr(0, name.length-1)+postFix)
    $(elementsWithClass[i]).removeClass("dayanu_row_1").removeClass("dayanu_row_"+(postFix-1)).addClass("dayanu_row_"+postFix);
      $parentModal.find(".dayanu_row_"+postFix).removeAttr('required');
      lastRow=".dayanu_row_"+(postFix-1);
   }   
});

$(document).on("input change", ".dayanu_rowElement", function(){
  
  $parentModal=$(this).closest('.modal');
  if($(event.target).is(":checkbox")){
  console.log("checkbox was clicked");
    return;
  }

  var numberOfFields=$parentModal.find(".dayanu_numberOfRows").attr('dayanu_numberOfFields');
  numberOfFields=numberOfFields==undefined|| numberOfFields==''? 1: numberOfFields;
   elementClasses=$parentModal.find(".dayanu_rowElement").prop("classList");
  rowDivs=$parentModal.find('.dayanu_oneRow');
  elementsWithClass=$parentModal.find('.dayanu_rowElement');
  for(var i=0; i<elementsWithClass.length;i++){
    var postFix=parseInt(i/numberOfFields)+1;/*as there are numberOfFields row elements*/
     if(!all_fieldsInClassAreEmpty("dayanu_row_"+postFix)){
        $parentModal.find(".dayanu_row_"+postFix).attr('required', 'true'); 
       // show(".dayanu_row_"+postFix+'-added')
     }
      else{
      $parentModal.find(".dayanu_row_"+postFix).removeAttr('required');
        //show(".dayanu_row_"+postFix+'-removed')
    }
   }
  set_optionaFields();
});

/*------Endof dayanu -------*/

/*------punishmentType -------*/
$(document).on("click", '.punishmentType_addRowsBtn', function(e){
  e.preventDefault();
  
  $parentModal=$(this).closest('.modal');
    
  var numberOfRowsTobeAdded=$(this).closest('.modal').find(".punishmentType_numberOfRowsTobeAdded").val();
  var numberOfFields=$parentModal.find(".punishmentType_numberOfRows").attr('punishmentType_numberOfFields');
  numberOfFields=numberOfFields==undefined|| numberOfFields==''? 1: numberOfFields;
  for(var i=0; i<numberOfRowsTobeAdded; i++){
     $('select').removeClass('select2')
/*---Appended Select2 Initializer---*/
  init($('select'))
  $('select').select2("destroy");

  $parentModal.find('.punishmentType_rowsContainer').append($('.punishmentType_oneRowData').html())
  init($('select'))
  }
   elementClasses=$parentModal.find(".punishmentType_rowElement").prop("classList");
  rowDivs=$parentModal.find('.punishmentType_oneRow');
  $parentModal.find(".punishmentType_numberOfRows").val(rowDivs.length)
  elementsWithClass=$parentModal.find('.punishmentType_rowElement');
  var lastRow=1;
for(var i=0; i<elementsWithClass.length;i++){
    var postFix=parseInt(i/numberOfFields)+1;/*as there are numberOfFields row elements*/
    var name=$(elementsWithClass[i]).attr('name');
    $(elementsWithClass[i]).attr('name', name.substr(0, name.length-1)+postFix)
    $(elementsWithClass[i]).removeClass("punishmentType_row_1").removeClass("punishmentType_row_"+(postFix-1)).addClass("punishmentType_row_"+postFix);
      $parentModal.find(".punishmentType_row_"+postFix).removeAttr('required');
      lastRow=".punishmentType_row_"+(postFix-1);
   }   
});

$(document).on("input change", ".punishmentType_rowElement", function(){
  $parentModal=$(this).closest('.modal');
  
  if($(event.target).is(":checkbox")){
  console.log("checkbox was clicked");
    return;
  }

  var numberOfFields=$parentModal.find(".punishmentType_numberOfRows").attr('punishmentType_numberOfFields');
  numberOfFields=numberOfFields==undefined|| numberOfFields==''? 1: numberOfFields;
   elementClasses=$parentModal.find(".punishmentType_rowElement").prop("classList");
  rowDivs=$parentModal.find('.punishmentType_oneRow');
  elementsWithClass=$parentModal.find('.punishmentType_rowElement');
  for(var i=0; i<elementsWithClass.length;i++){
    var postFix=parseInt(i/numberOfFields)+1;/*as there are numberOfFields row elements*/
     if(!all_fieldsInClassAreEmpty("punishmentType_row_"+postFix)){
        $parentModal.find(".punishmentType_row_"+postFix).attr('required', 'true'); 
       // show(".punishmentType_row_"+postFix+'-added')
     }
      else{
      $parentModal.find(".punishmentType_row_"+postFix).removeAttr('required');
        //show(".punishmentType_row_"+postFix+'-removed')
    }
   }
  set_optionaFields();
});

/*------Endof punishmentType -------*/

/*------Accusers -------*/
$(document).on("click", '.accusers_addRowsBtn', function(e){
  e.preventDefault();
  var numberOfRowsTobeAdded=$(".accusers_numberOfRowsTobeAdded").val();
  var numberOfFields=$(".accusers_numberOfRows").attr('accusers_numberOfFields');
  numberOfFields=numberOfFields==undefined|| numberOfFields==''? 1: numberOfFields;
  for(var i=0; i<numberOfRowsTobeAdded; i++){
     $('select').removeClass('select2')
/*---Appended Select2 Initializer---*/
  init($('select'))
  $('select').select2("destroy");

  $('.accusers_rowsContainer').append($('.accusers_oneRowData').html())
  
  init($('select'))
  }
   elementClasses=$(".accusers_rowElement").prop("classList");
  rowDivs=$('.accusers_oneRow');
  $(".accusers_numberOfRows").val(rowDivs.length)
  elementsWithClass=$('.accusers_rowElement');
  var lastRow=1;
  for(var i=0; i<elementsWithClass.length;i++){
    var postFix=parseInt(i/numberOfFields)+1;/*as there are numberOfFields row elements*/
    var name=$(elementsWithClass[i]).attr('name');
    //Only for Defendants
    $(elementsWithClass[i]).attr('name', name.indexOf('[]')==-1? name.substr(0, name.length-1)+postFix: name.substr(0, name.length-3)+postFix+'[]');
    //console.log($(elementsWithClass[i]).attr('name'));
    $(elementsWithClass[i]).removeClass("accusers_row_1").removeClass("accusers_row_"+(postFix-1)).addClass("accusers_row_"+postFix);
    /*var name=$(elementsWithClass[i]).attr('name');
    $(elementsWithClass[i]).attr('name', name.substr(0, name.length-1)+postFix)
    $(elementsWithClass[i]).removeClass("accusers_row_1").removeClass("accusers_row_"+(postFix-1)).addClass("accusers_row_"+postFix);*/
      $(".accusers_row_"+postFix).removeAttr('required');
      lastRow=".accusers_row_"+(postFix-1);
   $(lastRow).filter('.birth_date').calendarsPicker({calendar: $.calendars.instance('ethiopian')});
   }   
});

$(document).on("input change", ".accusers_rowElement", function(){
  if($(event.target).is(":checkbox")){
  console.log("checkbox was clicked");
    return;
  }
  var checked=$(this).closest('.accusers_oneRow').find('.isAccuserALawOfficer_checkBox').is(":checked");
  if(checked)//no need for detail info
    return;
  var numberOfFields=$(".accusers_numberOfRows").attr('accusers_numberOfFields');
  numberOfFields=numberOfFields==undefined|| numberOfFields==''? 1: numberOfFields;
   elementClasses=$(".accusers_rowElement").prop("classList");
  rowDivs=$('.accusers_oneRow');
  elementsWithClass=$('.accusers_rowElement');
  for(var i=0; i<elementsWithClass.length;i++){
    var postFix=parseInt(i/numberOfFields)+1;/*as there are numberOfFields row elements*/
     if(!all_fieldsInClassAreEmpty("accusers_row_"+postFix)){
        $(".accusers_row_"+postFix).attr('required', 'true'); 
       // show(".accusers_row_"+postFix+'-added')
     }
      else{
      $(".accusers_row_"+postFix).removeAttr('required');
        //show(".accusers_row_"+postFix+'-removed')
    }
   }
  set_optionaFields();
});

/*------Endof Accusers -------*/

/*------Defendants -------*/
$(document).on("click", '.defendants_addRowsBtn', function(e){
  e.preventDefault();
  var numberOfRowsTobeAdded=$(".defendants_numberOfRowsTobeAdded").val();
  var numberOfFields=$(".defendants_numberOfRows").attr('defendants_numberOfFields');
  numberOfFields=numberOfFields==undefined|| numberOfFields==''? 1: numberOfFields;
  for(var i=0; i<numberOfRowsTobeAdded; i++){
     $('select').removeClass('select2')
/*---Appended Select2 Initializer---*/
  init($('select'))
  $('select').select2("destroy");

  $('.defendants_rowsContainer').append($('.defendants_oneRowData').html())
  init($('select'))
  }
   elementClasses=$(".defendants_rowElement").prop("classList");
  rowDivs=$('.defendants_oneRow');
  $(".defendants_numberOfRows").val(rowDivs.length)
  elementsWithClass=$('.defendants_rowElement');
  var lastRow=1;
  for(var i=0; i<elementsWithClass.length;i++){
    var postFix=parseInt(i/numberOfFields)+1;/*as there are numberOfFields row elements*/
    var name=$(elementsWithClass[i]).attr('name');
    //Only for Defendants
    $(elementsWithClass[i]).attr('name', name.indexOf('[]')==-1? name.substr(0, name.length-1)+postFix: name.substr(0, name.length-3)+postFix+'[]');
    //console.log($(elementsWithClass[i]).attr('name'));
    $(elementsWithClass[i]).removeClass("defendants_row_1").removeClass("defendants_row_"+(postFix-1)).addClass("defendants_row_"+postFix);
      $(".defendants_row_"+postFix).removeAttr('required');
      lastRow=".defendants_row_"+(postFix-1);
   $(lastRow).filter('.birth_date').calendarsPicker({calendar: $.calendars.instance('ethiopian')});
   }   
});

$(document).on("input change", ".defendants_rowElement", function(){
  if($(event.target).is(":checkbox")){
  console.log("checkbox was clicked");
    return;
  }
  var numberOfFields=$(".defendants_numberOfRows").attr('defendants_numberOfFields');
  numberOfFields=numberOfFields==undefined|| numberOfFields==''? 1: numberOfFields;
   elementClasses=$(".defendants_rowElement").prop("classList");
  rowDivs=$('.defendants_oneRow');
  elementsWithClass=$('.defendants_rowElement');
  for(var i=0; i<elementsWithClass.length;i++){
    var postFix=parseInt(i/numberOfFields)+1;/*as there are numberOfFields row elements*/
     if(!all_fieldsInClassAreEmpty("defendants_row_"+postFix)){
        $(".defendants_row_"+postFix).attr('required', 'true'); 
       // show(".defendants_row_"+postFix+'-added')
     }
      else{
      $(".defendants_row_"+postFix).removeAttr('required');
        //show(".defendants_row_"+postFix+'-removed')
    }
   }
  set_optionaFields();
});

/*------Endof Defendants -------*/

/*-------------------------------------------------------------------------------------------------*/

/*--------------SECOND LEVEL MENU---------------------*/
$(document).on('click', '.nav_member', function(e){
  /*--Second level menu*/
  var classList=$(this).prop("classList");
  //console.log(active_parent_menu+'!='+classList[0])
  if(active_parent_menu!=classList[0]){
      hideSecond_level_menu();
    activateNav(this);
  }
/*----------------------*/
})
function activateNav(obj){
  $('li').removeClass('active');
  $(obj).closest('li').addClass('active');
}
var show_second_level_menu=true; 
var active_parent_menu='';

$(document).on('click', '.parent_menu', function(e){
  e.preventDefault();
  activateNav(this);
  var classList=$(this).prop("classList");
  if(classList.length<1)
    return;
  if(active_parent_menu==classList[0]){
    if(show_second_level_menu){
      showSecond_level_menu();

    }
    else{
      hideSecond_level_menu();
    }
    }
    else{
  active_parent_menu=classList[0];
      showSecond_level_menu();
    }
  active_parent_menu=classList[0];
//show_second_level_menu=!show_second_level_menu;
})

function showSecond_level_menu(){
  if(active_parent_menu=='')
  {
    return;
  }
  show_second_level_menu=false;
  $(".second_level_menu").css("display", "block");
  $(".all_second_level_menu").css("display", "none");
  $("."+active_parent_menu).css("display", "block");
}
function hideSecond_level_menu(){
  show_second_level_menu=true;
  $(".second_level_menu").css("display", "none");
}
/*--------------END OF SECOND LEVEL MENU---------------------*/


function showLang_successMessage(message){
    document.session='successMessage='+message;
return message;

return "ብትክክል ተፈፂሙ";//"<?php echo isset($_COOKIE['successMessage'])? App\Global_var::getLangString($_COOKIE['successMessage'], $language_strings): 'Error Message Not Found!' ?>";
  }

function showLang_errorMessage(message){
    document.cookie='errorMessage='+message;
return message;

return "ብትክክል ኣይተፈፀመን";//"<?php echo isset($_COOKIE['errorMessage'])? App\Global_var::getLangString($_COOKIE['errorMessage'], $language_strings): 'Error Message Not Found!' ?>";
  }

window.onload = chartInitializer;

function chartInitializer() {
  var canvas=document.getElementById('canvas');
  if(canvas==null)
    return;
    var ctx = canvas.getContext('2d');
    window.myLine = new Chart(ctx, config);
}

/**/
/*-----Tab activator----------*/
$(document).ready(function(){
    activateTab('Basic_Info');
});

$(document).on('click', '.tap_element', function(e){
  var id=$(this).attr('href');
  id=id.substr(1);
  activateTab(id)

})
function activateTab(tab){
  return;
  
    $('.nav-tabs a[href="#' + tab + '"]').tab('show');
};

$(document).on('click', '.tappedFormSubmitBtn', function () {
  var handled=false;
        
    $('select:invalid').each(function () {
        var $closest = $(this).closest('.tab-pane');
        var id = $closest.attr('id');
        $('.nav a[href="#' + id + '"]').tab('show');
        $("input").css("border", "");
        $("select").css("color", "");
        $("textarea").css("border", "");

        $(this).select2("open");

        handled=true;
        return false;
    });
    if(handled)
      return;
    $('input:invalid').each(function () {
        var $closest = $(this).closest('.tab-pane');
        var id = $closest.attr('id');
        $('.nav a[href="#' + id + '"]').tab('show');
        $("input").css("border", "");
        $("select").css("color", "");
        $("textarea").css("border", "");
        $(this).css("border", "1px solid red");
        handled=true;
        return false;
    });
    if(handled)
      return;
    $('textarea:invalid').each(function () {
        var $closest = $(this).closest('.tab-pane');
        var id = $closest.attr('id');
        $('.nav a[href="#' + id + '"]').tab('show');
        $("input").css("border", "");
        $("select").css("color", "");
        $("textarea").css("border", "");
        $(this).css("border", "1px solid red");
        handled=true;
        return false;
    });
    if(handled)
      return;
    $('select:invalid').each(function () {
        var $closest = $(this).closest('.tab-pane');
        var id = $closest.attr('id');
        $('.nav a[href="#' + id + '"]').tab('show');
        $("input").css("border", "");
        $("select").css("color", "");
        $("textarea").css("border", "");
        $(this).css("color", "red");
        handled=true;
        return false;
    });
});


/*---------------Saving and Withdrawal-----------*/
function optionalFieldsHandler(){
  /*checkPaymentMode(); 
  checkSaveCategory(); 
  checkEletAndEgbetSltena();
  initializeSelect2();
  chartInitializer();*/
  $(".optionalField").removeAttr('required');
  $('.eth_date, .eth_date_hidden').attr('autocomplete', 'off');
}

  $(document).on('change', '.categoryId', function(e){
    checkSaveCategory();
  })

setTimeout(function(){
      optionalFieldsHandler();
      }, 0);

function checkPaymentMode(){
  var payment_mode=$(".paymentModeId option:selected").text();
    if(payment_mode=="ቼክ"){
    $(".chequeNo").css('display', 'block')
     $(".chequeNo").attr('required', 'true'); 
    } 
    else{
    $(".chequeNo").removeAttr('required');
    $(".chequeNo").css('display', 'none')
    }
}
function checkSaveCategory(){
  var savingCategory=$(".categoryId option:selected").text();
  savingCategory=savingCategory!=undefined && savingCategory!=''? savingCategory: $(".categoryId").attr('categoryName');
    if(savingCategory=="ጊዜ ገደብ ዕቋር"){
    $(".toDateAndWeled").css('display', 'block')
     $(".toDate").attr('required', 'true'); 
     $(".weledInPercent").attr('required', 'true'); 
    } 
    else{
    $(".toDate").removeAttr('required');
    $(".weledInPercent").removeAttr('required');
    $(".toDateAndWeled").css('display', 'none')
    }
}

/*----------Enf of saving nd withdrawal----------------------*/
 
 /*--kunetat sltena---*/
  $(document).on('change', '.hasTrained', function(e){
    optionalFieldsHandler();    
  })

  function checkEletAndEgbetSltena(){
  var savingCategory=$(".hasTrained option:selected").text();
    if(savingCategory=="ወሲዱ"){
    $(".eletAndEgbetSltena").css('display', 'block')
     $(".trainingDate").attr('required', 'true'); 
     $(".satisfactionLevel").attr('required', 'true'); 
    } 
    else{
    $(".trainingDate").removeAttr('required');
    $(".satisfactionLevel").removeAttr('required');
    $(".eletAndEgbetSltena").css('display', 'none')
    }
}

/*-------------------*/



  $(document).on('change', '.paymentModeId', function(e){
    var payment_mode=$(".paymentModeId option:selected").text();
    if(payment_mode=="ቼክ")
    $(".chequeNo").css('display', 'block')
    else
    $(".chequeNo").css('display', 'none')

  });

$(document).on("click", ".backupFile", function(e){
  $.ajax({
    type:'get',
    url:"{{url('extractBackupFiles')}}",
    success:function(data){
      console.log("backup files extraction successful!");
    },
    error:function(err){
      console.log("backup files extraction failed");
    }
  })
});

$(document).on("click", ".close", function(){
 closeAllModals();
 abortAjaxRequest();
});


$(document).on('click', ".get", function(e){
if($(event.target).is(":checkbox")){
  console.log("checkbox was clicked");
    return;
  }else{
    e.preventDefault();    
  }
      showWaitingModal();
            var url=$(this).attr('href');
            nextUrl=$(this).attr('nextUrl');
            nextUrl=nextUrl!="" && nextUrl!=undefined ? nextUrl: url;
                  xhr= $.ajax({
                    type: 'get',
                    url: url,
                    success: function(data){
                    closeWaitingModal();
               if(data=='unauthorized'){
                 showErrorMessage("unauthorized Access Detected!")
                 /*redirect to login page */
                  location.reload();
                  return;
                }
                if(data=='permission_saved'){
                  showSuccessMessage('Permission Change Saved!');
                  return;
                }
                if(Array.isArray(data) && data[0]=="error"){
                  showErrorMessage(data[1]);
                  return;
                }

                activateFullUrl(nextUrl);
                $("#container").empty().append(data);
                initializeSelect2();
                activateTab('first_tab');

                optionalFieldsHandler();
                  },
                    error: function(err){
                    closeWaitingModal();

                      console.log('error occured');
        showErrorMessage("unable to complete request!");
                    }
                  });
                });

function closeAllModals(){
    /*
    closeexecutionStatusDetailModal();
    closeakabiHgiDesisionTypeDetailModal();
    closeBetFrdiDesisionTypeDetailModal();
    closeAppealAllowedByModal();
    closeAppointmentDateModal();
    closeakabiHgiDesisionModal();
    closebetFrdiDesisionModal();
    closeWaitingModal();*/
  $('.modal').css('display', 'none');
    $('.LawyerForm_RequiredElement').removeAttr('required');
    $('.BetFrdiForm_RequiredElement').removeAttr('required');
    $('.AppealForm_RequiredElement').attr('required', 'true');


}

$(document).on('submit', ".post", function(e){
  if(!isValid_PhoneNumber()){
    e.preventDefault();
    showErrorMessage("Phone number must be 9 - 10 digits long.");
    return;
  }
          showWaitingModal();
             var url=$(this).attr('action');
            nextUrl=$(".nextUrl").attr('nextUrl');
/*  var form=$(".post")[0];
    var data=new FormData(form);*/
  //To be Tried???
  var form=$(this).closest(".post")[0];
  var data=new FormData(form);

    e.preventDefault();
                  xhr= $.ajax({
                    type: 'post',
                    url: url,
                    data: data,
                    enctype: "multipart/form-data",
                    processData: false,
                    contentType: false,
                    cache: false,
                    timeout: 600000,
                    success: function(data){
                closeAllModals();
                if(data=='unauthorized'){
                  showErrorMessage("unauthorized Access Detected!")
                 /*redirect to login page */
                  location.reload();
                  return;
                }
                if(Array.isArray(data) && data[0]=="error"){
                  showErrorMessage(showLang_errorMessage(data[1]));//showErrorMessage(data[1]);
                  return;
                }
                if(Array.isArray(data) && data[0]=="success"){
                  showSuccessMessage(showLang_successMessage(data[1]));//showSuccessMessage(data[1]);
                  $("form").reset();
                  return;
                }
                activateFullUrl(nextUrl);
                $("#container").empty().append(data);
                showSuccessMessage(showLang_successMessage("Operation_Successful"));
                initializeSelect2();
                //for ksi mezgebat only
                var session_nextUrl=$('.session_nextUrl').attr('session_nextUrl');
                var session_prevUrl=$('.session_prevUrl').attr('session_prevUrl');
                //alert(session_prevUrl);
                  if(session_nextUrl!=undefined && session_nextUrl!=''){
                      console.log(session_nextUrl)
                      activateFullUrl(session_nextUrl);
                  }
                  },
                    error: function(err){
                      console.log('error occured');
        showErrorMessage("Unable to complete request!");
        closeWaitingModal();
                    }
                  });
                });

/*---users-create --form validator----*/
$(document).on("submit", ".validatePasswordMatch", function(e){
  var password=$(".password").val();
  var confirmPassword=$(".confirmPassword").val();
  if(password!=confirmPassword){
    showErrorMessage("Passwords do not match 2.");
    e.preventDefault();
  }
});
  
/*--------------------------------MESSAGES--------------------------------*/

function showSuccessMessage(message){
  hideSecond_level_menu();
  $("#message-error-displayer").css("display", "none");
  $("#message-success-displayer").css("display", "block");
  $(".messageArea").css("display", "block");
  //$("#message-success").empty().append(message);
  setTimeout(function(){
        showSecond_level_menu();
        $("#message-success").empty();
  $("#message-success-displayer").css("display", "none");
  $(".messageArea").css("display", "none");
        return;
      }, message_life_time);

  $.ajax({
    type:'get',
    url: "{{url('language_interpreter')}}/"+message,
    success: function(message){
    $("#message-success").empty().append(message);
    },
    error: function(message){
    $("#message-success").empty().append(message);
    }
  });
}
function showErrorMessage(message){
//hideSecond_level_menu();
  $("#message-success-displayer").css("display", "none");
  $("#message-error-displayer").css("display", "block");
  $(".messageArea").css("display", "block");
  $("#message-error").empty().append(message);
  setTimeout(function(){
  //     showSecond_level_menu()
  $("#message-error").empty();
  $("#message-error-displayer").css("display", "none");
  $(".messageArea").css("display", "none");
        return;
      }, message_life_time);

    $.ajax({
    type:'get',
    url: "{{url('language_interpreter')}}/"+message,
    success: function(message){
    $("#message-error").empty().append(message);
    },
    error: function(message){
      $("#message-error").empty().append(message);  
    }
  });
}
function showValidationErrorMessage(message){
  hideSecond_level_menu();
  $("#validation-error-message").empty().append(message);
  $("#validation-error-message-displayer").css("display", "block");
  $(".messageArea").css("display", "block");
  setTimeout(function(){
     showSecond_level_menu();
    $("#validation-error-message").empty();
  $("#validation-error-message-displayer").css("display", "none");
  $(".messageArea").css("display", "none");

        return;
      }, message_life_time);
}


function createSystemConfigurations(){
$.ajax({
type: 'get',
url: "{{url('system/createSystemConfigurations')}}",
success: function(configured) {
    if (configured == "true") {
        showSuccessMessage("System Configured successfully.");
        location.reload();
    }
},
error: function(err){
showErrorMessage("Warning! Some System Configurations Missed");
}
});
}


function showWaitingModal(){
 waitingModal.style.display = "block";
$('.loading-image').css("display", "block");
}
function closeWaitingModal(){
var waitingModal = document.getElementById('waitingModal');
  if(waitingModal!=null && waitingModal!=undefined)
  waitingModal.style.display = "none";
}

function existsInCollection(item, collection){
  var exists=false;
  Object.keys(collection).forEach(function(key, index) {
  if(this[key]==item)
    exists=true;
}, collection);

  return exists;
}


function initializeSelect2(){
/*Select2 ReInitialiser*/
         setTimeout(function(){
            $(".select2").select2({
                allowClear: false
            });            
        $(".eth_date").calendarsPicker({calendar: $.calendars.instance('ethiopian')});
        }, 100);
}

function activateUrl(url){
      window.history.pushState("Url ", "push state", url);
}
function activateFullUrl(url){
      window.history.pushState("Url ", "push state", url);
}

$(document).on('change', '.regionId', function(){
var regionID = $(this).val();    
$parentDiv = $(this).closest(".col-md-12"); 

if(regionID){
    $.ajax({
       type:"GET",
       url:"{{url('region_zones')}}/"+regionID,
       success:function(res){               
        if(res){
            $parentDiv.find(".zoneId").empty();
            $parentDiv.find(".zoneId").append('<option value="">-- --</option>');
            $.each(res,function(key,value){
                $parentDiv.find(".zoneId").append('<option value="'+key+'">'+value+'</option>');
            });
       
        }else{
           $parentDiv.find(".zoneId").empty();
        }
       }
    });
}else{
    $parentDiv.find(".zoneId").empty();
}      
});

$(document).on('change', '.zoneId', function(){
var zoneID = $(this).val();    
$parentDiv = $(this).closest(".col-md-12"); 

if(zoneID){
    $.ajax({
       type:"GET",
       url:"{{url('zone_weredas')}}/"+zoneID,
       success:function(res){               
        if(res){
            $parentDiv.find(".weredaId").empty();
            $parentDiv.find(".weredaId").append('<option value="">-- --</option>');
            $.each(res,function(key,value){
                $parentDiv.find(".weredaId").append('<option value="'+key+'">'+value+'</option>');
            });
       
        }else{
           $parentDiv.find(".weredaId").empty();
        }
       }
    });
}else{
    $parentDiv.find(".weredaId").empty();
}      
});

$(document).on('change', '.weredaId', function(){
var weredaID = $(this).val();    
$parentDiv = $(this).closest(".col-md-12"); 

if(weredaID){
    $.ajax({
       type:"GET",
       url:"{{url('wereda_tabyas')}}/"+weredaID,
       success:function(res){               
        if(res){
           $parentDiv.find(".tabyaId").empty();
           $parentDiv.find(".tabyaId").append('<option value="">-- --</option>');
            $.each(res,function(key,value){
                $parentDiv.find(".tabyaId").append('<option value="'+key+'">'+value+'</option>');
            });
       
        }else{
           $parentDiv.find(".tabyaId").empty();
        }
       }
    });
}else{
    $parentDiv.find(".tabyaId").empty();
}      
});

$(document).on('change', '.weredaId_withSubW', function(){
var weredaID = $(this).val();    
$parentDiv = $(this).closest(".col-md-12"); 

if(weredaID){
    $.ajax({
       type:"GET",
       url:"{{url('wereda_subWeredas')}}/"+weredaID,
       success:function(res){               
        if(res){
            $parentDiv.find(".subWeredaId").empty();
            $parentDiv.find(".subWeredaId").append('<option value="">-- --</option>');
            $.each(res,function(key,value){
                $parentDiv.find(".subWeredaId").append('<option value="'+key+'">'+value+'</option>');
            });
       
        }else{
           $parentDiv.find(".subWeredaId").empty();
        }
       }
    });
}else{
    $parentDiv.find(".subWeredaId").empty();
}      
});

$(document).on('change', '.tabyaId', function(){
var tabyaId = $(this).val();    
$parentDiv = $(this).closest(".col-md-12"); 

if(tabyaId){
    $.ajax({
       type:"GET",
       url:"{{url('tabya_kebelles')}}/"+tabyaId,
       success:function(res){               
        if(res){
            $parentDiv.find(".kebelleId").empty();
            $parentDiv.find(".kebelleId").append('<option value="">-- --</option>');
            $.each(res,function(key,value){
                $parentDiv.find(".kebelleId").append('<option value="'+key+'">'+value+'</option>');
            });
       
        }else{
           $parentDiv.find(".kebelleId").empty();
        }
       }
    });
}else{
    $parentDiv.find(".kebelleId").empty();
}      
});
/*----------------*/


$(document).on('input', '.number', function(e){
        var num=$(this).val().replace(/[^\d\.]/g, '');
        $(this).val(num);
});

$(document).on("submit", "form", function(e){
  //var pNo=$(".phoneNumber").val();
  if(!isValid_PhoneNumber()/*pNo!=undefined && pNo.length>0 && pNo.length!=9 && pNo.length!=10*/){
    e.preventDefault();
    showErrorMessage("Phone number must be 9 - 10 digits long.");
  }

})

function isValid_PhoneNumber(){
  var pNo=$(".phoneNumber").val();
  if(pNo!=undefined && pNo.length>0 && pNo.length!=9 && pNo.length!=10){
    return false;
  }
  return true;
}

  /*--PERMISSIONS--*/
$(document).on('click', '.permissions-step0', function(e){
  e.preventDefault();
  $.ajax({
 type: 'get',
  url: "{{url('permissions_save/step1')}}",
  success: function(data){
   if(data=='unauthorized'){
     /*redirect to login page */
      location.reload();
      return;
    }
    $("#container").empty().append(data);
      activateUrl('/permissions_save/step1');
  },
  error: function(err){
    console.log('error occured');
    console.log('error');
  }
  });
});

$(document).on('click', '.permissions-step1', function(e){
  e.preventDefault();
  var id=$(this).attr('value');
  $.ajax({
 type: 'get',
  url: "{{url('permissions_save/step2')}}/"+id,
  success: function(data){
   if(data=='unauthorized'){
     /*redirect to login page */
      location.reload();
      return;
    }
    $("#container").empty().append(data);
      activateUrl('permissions_save/step2/'+id);
      activateTab('first_tab'); 
  },
  error: function(err){
    console.log('error occured');
    console.log('error');
  }
  });
});

/*--MANAGE RESOURCE PERMISSION--*/
$(document).on('click', '.permissions-save', function(e){
    //e.preventDefault();
  var actionType=$(this).attr("actionType");//$(this).state;
  var roleId=$(this).attr('roleId');
  var resourceId=$(this).attr('resourceId');
  var checked=$(this).is(":checked");//$(this).state;
  var url="{{url('permissions_save')}}/"+actionType
  $.ajax({
 type: 'get',
  url: url,
  data: {roleId:roleId, resourceId:resourceId, checked:checked},
  success: function(data){
    if(data=='unauthorized'){
      location.reload();
      return;
    }
    showSuccessMessage(data);
  },
  error: function(err){
    console.log('error occured');
    console.log('error');
  }
  });
});
$(document).on('click', '.permissions-checkAll', function(e){
  //e.preventDefault();
  var actionType=$(this).attr("actionType");//$(this).state;
  var checked=$(this).is(":checked");
  var roleId=$(this).attr('roleId');
  var resourceId=$(this).attr('resourceId');

  var url="{{url('permissions_save/checkAll')}}/"+actionType;
  $.ajax({
 type: 'get',
  url: url,
  data: {roleId:roleId, resourceId:resourceId, checked:checked},
  success: function(data){
   if(data=='unauthorized'){
     /*redirect to login page */
      location.reload();
      return;
    }
    $("#container").empty().append(data);
    showSuccessMessage('permissions saved.');

/*      activateUrl('permissions-save');*/
  },
  error: function(err){
    console.log('error occured');
    console.log('error');
  }
  });
});


/*--DOCUMENT PERMISSION--*/
$(document).on('click', '.document-permissions-save', function(e){
    //e.preventDefault();
  var actionType=$(this).attr("actionType");//$(this).state;
  var roleId=$(this).attr('roleId');
  var resourceId=$(this).attr('resourceId');
  var checked=$(this).is(":checked");//$(this).state;
  var url="{{url('document_permissions_save')}}/"+actionType
  $.ajax({
 type: 'get',
  url: url,
  data: {roleId:roleId, resourceId:resourceId, checked:checked},
  success: function(data){
    if(data=='unauthorized'){
      location.reload();
      return;
    }
    showSuccessMessage(data);
  },
  error: function(err){
    console.log('error occured');
    console.log('error');
  }
  });
});

</script>
