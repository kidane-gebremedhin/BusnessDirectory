<?php

namespace App;
use Cookie;
use Session;
use DB;
use Illuminate\Support\Collection;
use Auth;

class Global_var
{
    protected $table="language_strings";

    public static $selectedLang="tig";
    public static $cookieLifeTime=60*60*24*365;
    public static $reportIntervalInMonths=6;
    public static $newYear_dayMonth="1/11";

public static function documentCategories(){
    $language_strings=\App\language_string::orderBy('id', 'desc')->get();

  return ['Video'=>Global_var::getLangString('Video', $language_strings), 'Audio'=>Global_var::getLangString('Audio', $language_strings), 'Image'=>Global_var::getLangString('Image', $language_strings), 'Text_Document'=>Global_var::getLangString('Text_Document', $language_strings)];
}

public static function years(){
  $years = array();
  $currentYear=(new Date_class)->getCurrentYear();
  for($i=($currentYear-200); $i<=($currentYear+200); $i++) {
    $years[$i]=$i;
  }
  return $years;
}
public static function levels(){
  $levels = array();
  for($i=0; $i<=100; $i++) {
    $levels[$i]=$i;
  }
  return $levels;
}

public static function logAction($request, $subject){
        $log=new log;
        $log->userId=Auth::guard('web')->user()!=null? Auth::guard('web')->user()->id:0;
        $log->subject=$subject;
        $log->url=$request->fullUrl();//url()
        $log->method=$request->method();
        $log->ip=$request->ip();
        $log->agent=$request->userAgent();
        $log->save();
} 

public static function isWithIn_One_YearInterval($ksi_mezgeb_brki){
  $dateDiff=Date_class::getDateDiffernece(\App\Global_var::getReport_One_YearInterval()[0], $ksi_mezgeb_brki->entryDate);
  if($dateDiff->days>0 && $dateDiff->invert==0)//inverted=0 means negative diff
      return false;

  $dateDiff=Date_class::getDateDiffernece($ksi_mezgeb_brki->entryDate, \App\Global_var::getReport_One_YearInterval()[1]);

  if($dateDiff->days>0 && $dateDiff->invert==0)//inverted=0 means negative diff
      return false;

//dd($dateDiff->days." ".$dateDiff->invert);
  return true;
}
public static function is_Date_WithIn_One_YearInterval($date){
  $dateDiff=Date_class::getDateDiffernece(\App\Global_var::getReport_One_YearInterval()[0], $date);
  if($dateDiff->days>0 && $dateDiff->invert==0)//inverted=0 means negative diff
      return false;

  $dateDiff=Date_class::getDateDiffernece($date, \App\Global_var::getReport_One_YearInterval()[1]);

  if($dateDiff->days>0 && $dateDiff->invert==0)//inverted=0 means negative diff
      return false;

//dd($dateDiff->days." ".$dateDiff->invert);
  return true;
}



public static function isWithIn_DateInterval($ksi_mezgeb_brki){
  $dateDiff=Date_class::getDateDiffernece(\App\Global_var::getReport_DateInterval()[0], $ksi_mezgeb_brki->entryDate);
  if($dateDiff->days>0 && $dateDiff->invert==0)//inverted=0 means negative diff
      return false;

  $dateDiff=Date_class::getDateDiffernece($ksi_mezgeb_brki->entryDate, \App\Global_var::getReport_DateInterval()[1]);

  if($dateDiff->days>0 && $dateDiff->invert==0)//inverted=0 means negative diff
      return false;

//dd($dateDiff->days." ".$dateDiff->invert);
  return true;
}

public static function isWithIn_GivenInterval($givenDate, $initialDate, $finalDate){
  $dateDiff=Date_class::getDateDiffernece($initialDate, $givenDate);
  if($dateDiff->days>0 && $dateDiff->invert==0)//inverted=0 means negative diff
      return false;

  $dateDiff=Date_class::getDateDiffernece($givenDate, $finalDate);

  if($dateDiff->days>0 && $dateDiff->invert==0)//inverted=0 means negative diff
      return false;

//dd($dateDiff->days." ".$dateDiff->invert);
  return true;
}

public static function getReport_DateInterval(){
  $currentYear=Date_class::getCurrentYear();
  $reportDate_Start=\Session::get('startDate')!=null? \Session::get('startDate'): Global_var::$newYear_dayMonth.'/'.$currentYear;
  $reportDate_End=\Session::get('endDate')!=null? \Session::get('endDate'): Global_var::$newYear_dayMonth.'/'.($currentYear+1);

  return [$reportDate_Start, $reportDate_End];
}
public static function getReport_One_YearInterval(){
  $currentYear=Date_class::getCurrentYear();
  $reportDate_Start=Global_var::$newYear_dayMonth.'/'.$currentYear;
  $reportDate_End=Global_var::$newYear_dayMonth.'/'.($currentYear+1);

  return [$reportDate_Start, $reportDate_End];
}

public static function generateRank_category($array, $categoryIndex){
    $collection=new Collection($array/*[
    ['name'=>'sue', 'age'=>23],
    ['name'=>'simon', 'age'=>38],
    ['name'=>'jane', 'age'=>25],
    ['name'=>'dave', 'age'=>59],
    ]*/);

$sorted_collection=$collection->sortByDesc('percent_'.$categoryIndex);
//dd($categoryIndex);
//dd($sorted_collection);
/*print_r($sorted_collection);
echo "<br><br>";
  return;*/
  $new_rank_array=array();

   $RANK = 1;
    $rank_offset = 0;

    $arrayIndex=0;
    if(!isset($sorted_collection[$arrayIndex]['percent_'.$categoryIndex]))
      $arrayIndex=1;
     
    $current_maximam = $sorted_collection/*->first()*/[$arrayIndex]['percent_'.$categoryIndex];
    //echo '<br>'.$categoryIndex.' hh '.($current_maximam);
    foreach($sorted_collection as $collection)
    {
      if(!isset($collection['brki_'.$categoryIndex]) || !isset($collection['percent_'.$categoryIndex]))
        continue;

        $key=$collection['brki_'.$categoryIndex];
        $value=$collection['percent_'.$categoryIndex];
//dd($key);
//dd($value);
        if ($value < $current_maximam)
        {
            $RANK = $RANK + $rank_offset;
            $rank_offset = 1;
            $current_maximam = $value;
        }
        else if($value == $current_maximam)
        {
            $rank_offset ++;
        }

    $new_rank_array[$key]=$RANK;
}
return $new_rank_array;
}

public static function generateRank($array){
  
  $collection=new Collection($array/*[
    ['name'=>'sue', 'age'=>23],
    ['name'=>'simon', 'age'=>38],
    ['name'=>'jane', 'age'=>25],
    ['name'=>'dave', 'age'=>59],
    ]*/);

$sorted_collection=$collection->sortByDesc('percent');
/*print_r($sorted_collection);
echo "<br><br>";
  return;*/
  $new_rank_array=array();

   $RANK = 1;
    $rank_offset = 0;
    $current_maximam = $sorted_collection->first()['percent'];
    foreach($sorted_collection as $collection)
    {
        $key=$collection['brki'];
        $value=$collection['percent'];

        if ($value < $current_maximam)
        {
            $RANK = $RANK + $rank_offset;
            $rank_offset = 1;
            $current_maximam = $value;
        }
        else if($value == $current_maximam)
        {
            $rank_offset ++;
        }

    $new_rank_array[$key]=$RANK;
}
//dd($new_rank_array);
return $new_rank_array;
}

public static function round($number, $decimalPoint){
  return round($number*pow(10, $decimalPoint))/pow(10, $decimalPoint);
}

public static function getGenders(){
    $language_strings=\App\language_string::orderBy('id', 'desc')->get();

  return ['Male'=>Global_var::getLangString('Male', $language_strings), 'Female'=>Global_var::getLangString('Female', $language_strings)];
}

public static function getLangString($keyWord, $language_strings){
$selectedLang=Session::get('selectedLang');
    return $language_strings!=null && $selectedLang!='' && $language_strings->where('keyWord', '=', $keyWord)->first()!=null? $language_strings->where('keyWord', '=', $keyWord)->first()->$selectedLang: str_replace('_', ' ', $keyWord); //split with _
}

 
 public static function existsInArray($array, $item){
  
    if($array==null)
      return false;
    foreach ($array as $elem) {
     if($elem==$item)
      return true;
    }
    return false;
 }


}
