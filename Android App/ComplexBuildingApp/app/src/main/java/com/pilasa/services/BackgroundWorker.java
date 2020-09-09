package com.example.services;

import android.app.AlertDialog;
import android.content.Context;
import android.content.DialogInterface;
import android.os.AsyncTask;
import android.util.Log;
import android.widget.ArrayAdapter;
import android.widget.SpinnerAdapter;
import android.widget.Toast;

import com.example.fragments.PaymentFragment;
import com.example.user.ussdapp1.MainActivity;
import com.example.user.ussdapp1.R;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLEncoder;
import java.io.*;
/**
 * Created by User on 12/30/2019.
 */

public class BackgroundWorker extends AsyncTask<String, Void, String> {
    private Context context;
    private String urlString="http://192.168.43.115:8000/payment/create/";
    AlertDialog alertDialog=null;

    String TAG_Validation="Validation_Error";
    String post_data;
    public static JSONArray gamesArray, clubsArray, game_optionsArray, home_or_away_statusArray, game_pricesArray;

    /*
    JSONObject json = new JSONObject(yourstring);
    JSONArray jsa = json.getJSONArray("udeals");

    JSONObject jObject=new JSONObject(str);
                    JSONArray menuObject = new JSONArray(jObject.getString("udeals"));

                    for (int i = 0; i<menuObject.length(); i++) {}
    * */
    public BackgroundWorker(Context context){
        this.context=context;
    }

    @Override
    protected String doInBackground(String... params) {
        String OPERATION_TYPE=params[0];

        if(OPERATION_TYPE.equals("register")){
            validateData(params);

            try {

                URL url=new URL(urlString);
                HttpURLConnection httpURLConnection=(HttpURLConnection) url.openConnection();

                /*// Manage Cookies
                String cookieString="";
                String csrftoken="";
                CookieManager cookieManager = io.getCookiesFromURLConnection(httpURLConnection);
                List<HttpCookie> cookies=cookieManager.getCookieStore().getCookies();
                Iterator<HttpCookie> cookieIterator=cookies.iterator();
                while(cookieIterator.hasNext()){
                    HttpCookie cookie=cookieIterator.next();
                    cookieString+=cookie.getName()+"="+cookie.getValue()+";";

                    if(cookie.getName().equals("csrftoken")){
                        csrftoken=cookie.getValue();
                    }
                }*/

                httpURLConnection.setRequestMethod("POST");
                httpURLConnection.setDoOutput(true);
                httpURLConnection.setDoInput(true);
                //--httpURLConnection.setRequestProperty("X-CSRFToken", csrftoken);
                //httpURLConnection.setRequestProperty("Cookies", cookieString);
                //--httpURLConnection.setRequestProperty("Cookie", cookieString);

                OutputStream outputStream=httpURLConnection.getOutputStream();
                BufferedWriter bufferedWriter=new BufferedWriter(new OutputStreamWriter(outputStream, "UTF-8"));

                bufferedWriter.write(post_data);
                bufferedWriter.flush();
                bufferedWriter.close();
                outputStream.close();

                /*//get Response
                int responseCode=httpURLConnection.getResponseCode();
                response=io.readStream(httpURLConnection);*/

                InputStream inputStream=httpURLConnection.getInputStream();
                BufferedReader bufferedReader=new BufferedReader(new InputStreamReader(inputStream, "ISO-8859-1"));

                String result="", line="";

                while((line=bufferedReader.readLine())!=null){
                    result+=line+"\n";
                }

                bufferedReader.close();
                inputStream.close();

                httpURLConnection.disconnect();
                Log.d("BackGD", "doInBackground: "+result);

                return result;


            } catch (MalformedURLException e) {
                e.printStackTrace();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        else if(OPERATION_TYPE.equals("submit_payment")){
            if(!validatePaymentData(params)){
                return null;
            }

            try {

                URL url=new URL("http://192.168.43.115:8000/payment_records/create_payment/");
                HttpURLConnection httpURLConnection=(HttpURLConnection) url.openConnection();
                httpURLConnection.setRequestMethod("POST");
                httpURLConnection.setDoOutput(true);
                httpURLConnection.setDoInput(true);
                OutputStream outputStream=httpURLConnection.getOutputStream();
                BufferedWriter bufferedWriter=new BufferedWriter(new OutputStreamWriter(outputStream, "UTF-8"));
                bufferedWriter.write(post_data);
                bufferedWriter.flush();
                bufferedWriter.close();
                outputStream.close();

                InputStream inputStream=httpURLConnection.getInputStream();
                BufferedReader bufferedReader=new BufferedReader(new InputStreamReader(inputStream, "ISO-8859-1"));

                String result="", line="";

                while((line=bufferedReader.readLine())!=null){
                    result+=line+"\n";
                }

                bufferedReader.close();
                inputStream.close();

                httpURLConnection.disconnect();
                Log.d("BackGD", "doInBackground: "+result);

                return result;
            } catch (MalformedURLException e) {
                e.printStackTrace();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        else if(OPERATION_TYPE.equals("load_data")){
            try {

                URL url=new URL("http://192.168.43.115:8000/games/upcoming_games/");
                HttpURLConnection httpURLConnection=(HttpURLConnection) url.openConnection();
                httpURLConnection.setRequestMethod("GET");
                httpURLConnection.setDoOutput(true);
                httpURLConnection.setDoInput(true);

                InputStream inputStream=httpURLConnection.getInputStream();
                BufferedReader bufferedReader=new BufferedReader(new InputStreamReader(inputStream, "ISO-8859-1"));

                String result="", line="";

                while((line=bufferedReader.readLine())!=null){
                    result+=line+"\n";
                }

                bufferedReader.close();
                inputStream.close();

                httpURLConnection.disconnect();
                Log.d("BackGD", "doInBackground: "+result);

                return result;


            } catch (MalformedURLException e) {
                e.printStackTrace();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        return null;
    }

    private void validateData(String... params) {
        String name=params[1];
        String remark=params[2];

        try {

            post_data= URLEncoder.encode("fullName", "UTF-8")+"="+URLEncoder.encode(name, "UTF-8")+"&" +
                    URLEncoder.encode("amount", "UTF-8")+"="+URLEncoder.encode(remark, "UTF-8");

        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
    }

    private boolean validatePaymentData(String... params) {
        String game=params[1];
        String game_prices=params[2];
        String fullName=params[3];
        String phoneNumber=params[4];
        String paidAmount=params[5];
        String homeOrAwayStatus=params[6];
        String recipientAccountNumber=params[7];

        if(game==null || game_prices==null || fullName==null || phoneNumber==null || paidAmount==null || homeOrAwayStatus==null || recipientAccountNumber==null){
            Log.i(TAG_Validation, "Please fill the required fields");
            return false;
        }
        if("".equals(game) || "".equals(game_prices) || "".equals(fullName) || "".equals(phoneNumber) || "".equals(paidAmount) || "".equals(homeOrAwayStatus) || "".equals(recipientAccountNumber)){
            Log.i(TAG_Validation, "Please fill the required fields");
            return false;
        }

        try {

            post_data= URLEncoder.encode("game", "UTF-8")+"="+URLEncoder.encode(game, "UTF-8")+"&" +
                    URLEncoder.encode("game_prices", "UTF-8")+"="+URLEncoder.encode(game_prices, "UTF-8")+"&" +
                    URLEncoder.encode("fullName", "UTF-8")+"="+URLEncoder.encode(fullName, "UTF-8")+"&" +
                    URLEncoder.encode("phoneNumber", "UTF-8")+"="+URLEncoder.encode((phoneNumber!=null? phoneNumber:""), "UTF-8")+"&" +
                    URLEncoder.encode("paidAmount", "UTF-8")+"="+URLEncoder.encode(paidAmount, "UTF-8")+"&" +
                    URLEncoder.encode("homeOrAwayStatus", "UTF-8")+"="+URLEncoder.encode(homeOrAwayStatus, "UTF-8")+"&" +
                    URLEncoder.encode("recipientAccountNumber", "UTF-8")+"="+URLEncoder.encode(recipientAccountNumber, "UTF-8");

            return true;
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
            return false;
        }
    }

    @Override
    protected void onPreExecute() {
        Log.d("BackGD", "onPreExecute");
        alertDialog=new AlertDialog.Builder(context)
        .setTitle(R.string.app_name)
                .setCancelable(false)
                .setPositiveButton(R.string.OK, new DialogInterface.OnClickListener() {
                    @Override
                    public void onClick(DialogInterface dialog, int which) {
                        dialog.cancel();
                    }
                })
        .create();
    }

    @Override
    protected void onProgressUpdate(Void... values) {
        super.onProgressUpdate(values);
    }

    @Override
    protected void onPostExecute(String result) {
        if(result==null){
            //Toast.makeText(MainActivity.appContext, R.string.no_result_found, Toast.LENGTH_LONG).show();
            return;
        }

        Log.d("BackGD", "onPostExecute "+result);
        JSONObject json = null;
        //JSONArray responseGameArray, responseGame_optionArray, responseClubArray, home_or_away_statusArray;
        String responseData="GAMES\n";
        try {
            json = new JSONObject(result);
            if (json.getString("type").equalsIgnoreCase("notification")){
                if(!json.getBoolean("success")){
                    Toast.makeText(MainActivity.appContext, "Something went wrong. Please Try again.", Toast.LENGTH_LONG).show();
                    return;
                }
                String ticketCode=json.getString("ticketCode");
                String paidAmount=json.getString("paidAmount");
                responseData="Successfully paid "+paidAmount+" Birr. \n\nYour ticket-code: "+ticketCode+" \n\nMake sure you remember it. \nThank you!";
                alertDialog.setMessage(String.valueOf(responseData));
                alertDialog.show();
            }
            else if (json.getString("type").equalsIgnoreCase("data")) {
                gamesArray = json.getJSONArray("games");
                game_optionsArray = json.getJSONArray("games_option");
                clubsArray = json.getJSONArray("clubs");
                home_or_away_statusArray = json.getJSONArray("home_or_away_status");
                //game_pricesArray = json.getJSONArray("game_prices_option");

                for (int i = 0; i < gamesArray.length(); i++) {
                    JSONObject object = gamesArray.getJSONObject(i);
                    String id = object.getString("id");
                    String name = object.getString("name");
                    String stadium_id = object.getString("stadium");
                    String competetionType_id = object.getString("competetionType");
                    String round_id = object.getString("round");
                    String homeSide = object.getString("homeSide");
                    String awaySide = object.getString("awaySide");
                    String game_dateTime = object.getString("game_dateTime");
                    responseData += "Id:" + id + " Gn: " + name + " " + stadium_id + "| " + competetionType_id + "| " + round_id + "| " + homeSide + "| " + awaySide + "| " + game_dateTime + "\n";
                }
                /*responseData += "game_prices\n";
                String[] game_pricesArrayStr = new String[game_pricesArray.length()];
                for (int i = 0; i < game_pricesArray.length(); i++) {
                    JSONObject object = game_pricesArray.getJSONObject(i);
                    String id = object.getString("id");
                    String name = object.getString("name");
                    String priceInBirr = object.getString("priceInBirr");
                    responseData += "id: " + id + "| " + name + "| " + priceInBirr + "\n";
                    game_pricesArrayStr[i] = name;
                }*/

                String[] home_or_away_statusArrayStr = new String[home_or_away_statusArray.length()];
                for (int i = 0; i < home_or_away_statusArray.length(); i++) {
                    JSONObject object = home_or_away_statusArray.getJSONObject(i);
                    String id = object.getString("id");
                    String name = object.getString("name");
                    String description = object.getString("description");
                    responseData += "id: " + id + "| " + name + "| " + description + "\n";
                    home_or_away_statusArrayStr[i] = name;
                }

                String[] game_optionsArrayStr = new String[game_optionsArray.length()];
                for (int i = 0; i < game_optionsArray.length(); i++) {
                    JSONObject object = game_optionsArray.getJSONObject(i);
                    String id = object.getString("id");
                    String name = object.getString("name");
                    String stadium = object.getString("stadium");
                    String competetionType = object.getString("competetionType");
                    String round = object.getString("round");
                    String homeSide = object.getString("homeSide");
                    String awaySide = object.getString("awaySide");
                    String accountNumber = object.getString("accountNumber");
                    String game_dateTime = object.getString("game_dateTime");
                    game_optionsArrayStr[i] = name;
                }
            /*responseData+="CLUBS\n";
            String[] responseGameArrayStr=new String[responseClubArray.length()];
            for(int i=0; i<responseClubArray.length();i++){
                JSONObject object=responseClubArray.getJSONObject(i);
                String stadium_id=object.getString("name");
                String competetionType_id=object.getString("description");
                responseData+=stadium_id+"| "+competetionType_id+"\n";
                responseGameArrayStr[i]=stadium_id;
            }*/

                SpinnerAdapter home_or_away_statusArrayAdapter = new ArrayAdapter<String>(MainActivity.appContext, android.R.layout.simple_spinner_dropdown_item, home_or_away_statusArrayStr);
                PaymentFragment.homeOrAwayStatusSpinner.setAdapter(home_or_away_statusArrayAdapter);
                /*SpinnerAdapter game_pricesArrayAdapter = new ArrayAdapter<String>(MainActivity.appContext, android.R.layout.simple_spinner_dropdown_item, game_pricesArrayStr);
                PaymentFragment.game_pricesSpinner.setAdapter(game_pricesArrayAdapter);*/
                SpinnerAdapter gamesArrayAdapter = new ArrayAdapter<String>(MainActivity.appContext, android.R.layout.simple_spinner_dropdown_item, game_optionsArrayStr);
                PaymentFragment.gameSpinner.setAdapter(gamesArrayAdapter);
            }
        } catch (JSONException e) {
            e.printStackTrace();
        }

        /*alertDialog.setMessage(String.valueOf(responseData));
        alertDialog.show();*/
    }

    public static String seachPriceString(JSONArray jsonArray, String key){
        for (int i=0; i<jsonArray.length();i++){
            try {
                JSONObject json = new JSONObject(jsonArray.get(i).toString());
                String name=json.getString("name");
                if(name.equalsIgnoreCase(key.trim())) {
                    return json.getString("priceInBirr");
                }
            } catch (JSONException e) {
                e.printStackTrace();
                return null;
            }
        }
        return "";
    }

    public static String[] seachGame_pricesArrayStr(JSONArray jsonArray, String key){
        for (int i=0; i<jsonArray.length();i++){
            try {
                JSONObject json = new JSONObject(jsonArray.get(i).toString());
                String name=json.getString("name");
                if(name.equalsIgnoreCase(key.trim())) {
                    JSONArray game_pricesJSONArray=json.getJSONArray("game_prices");

                    game_pricesArray=game_pricesJSONArray;


                    String[] game_prcesArrayStr=new String[game_pricesJSONArray.length()];
                    //Toast.makeText(MainActivity.appContext, "game_prcesArrayStr Length "+String.valueOf(game_prcesArrayStr.length), Toast.LENGTH_LONG).show();
                    for (int k=0; k<game_pricesJSONArray.length();k++){
                        JSONObject json2 = new JSONObject(game_pricesJSONArray.get(k).toString());
                        game_prcesArrayStr[k]=json2.getString("name");
                    }

                    return game_prcesArrayStr;
                }
            } catch (JSONException e) {
                e.printStackTrace();
                return new String[]{};
            }
        }
        return new String[]{};
    }

    public static String seachString(JSONArray jsonArray, String key){
        for (int i=0; i<jsonArray.length();i++){
            try {
                JSONObject json = new JSONObject(jsonArray.get(i).toString());
                String name=json.getString("name");
                if(name.equalsIgnoreCase(key.trim())) {
                    return json.getString("id");
                }
            } catch (JSONException e) {
                e.printStackTrace();
                return null;
            }
        }
        return null;
    }
    public static String seachAccountNumber(JSONArray jsonArray, String key){
        for (int i=0; i<jsonArray.length();i++){
            try {
                JSONObject json = new JSONObject(jsonArray.get(i).toString());
                String name=json.getString("name");
                if(name.equalsIgnoreCase(key.trim())) {
                    return json.getString("accountNumber");
                }
            } catch (JSONException e) {
                e.printStackTrace();
                return null;
            }
        }
        return null;
    }


    /*//Private classs
    private class GetData extends AsyncTask<Void,Void,String> {

        @Override
        protected String doInBackground(Void... params) {
            if(MainActivity.checkConnection()){
                try {
                    return fetchData();
                } catch (IOException e) {
                    e.printStackTrace();
                }
                return null;
            }else{
                Toast.makeText(MainActivity.appContext, "Please connect to internet", Toast.LENGTH_LONG).show();
            }
            return "";
        }

        @Override
        protected void onPostExecute(String s) {
            if(s==null){
                return ;
            }
            super.onPostExecute(s);
            signupButton.setEnabled(true);
        }

    }


    public  String fetchData() throws IOException {

        String result="";

        try {
            URL url= new URL(Utils.USER_SIGNUP_URL);
            urlConnection=(HttpURLConnection)url.openConnection();
            result=io.readStream(urlConnection);
            cookieManager=io.getCookiesFromURLConnection(urlConnection);
        } catch (MalformedURLException e) {
            e.printStackTrace();
        }

        return result;

    }*/

    //--end of private class
}
