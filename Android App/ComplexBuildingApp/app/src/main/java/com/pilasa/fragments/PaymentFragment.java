package com.example.fragments;

import android.Manifest;
import android.app.AlertDialog;
import android.content.Context;
import android.content.DialogInterface;
import android.content.Intent;
import android.content.pm.PackageManager;
import android.net.Uri;
import android.os.Bundle;
import android.provider.Settings;
import android.support.annotation.Nullable;
import android.support.v4.app.Fragment;
import android.support.v4.content.ContextCompat;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.AdapterView;
import android.widget.ArrayAdapter;
import android.widget.Button;
import android.widget.EditText;
import android.widget.Spinner;
import android.widget.SpinnerAdapter;
import android.widget.TextView;
import android.widget.Toast;

import com.example.services.BackgroundWorker;
import com.example.user.ussdapp1.MainActivity;
import com.example.user.ussdapp1.R;
import com.example.user.ussdapp1.USSDService;


public class PaymentFragment extends Fragment {

    private Button /*loadDataBtn, */submitPaymentBtn;
    private EditText phoneNumberTF2, fullNameTf/*, paidAmountTf*/;
    private TextView gamePriceTV;
    public static Spinner homeOrAwayStatusSpinner, gameSpinner, game_pricesSpinner;
    public static String homeOrAwayStatusId="", gameId="", accountNumber="", game_pricesId="", fullName="", paidAmount="", phoneNumber="";
    private static final Intent sSettingsIntent =
            new Intent(Settings.ACTION_ACCESSIBILITY_SETTINGS);

    String amountInBirrStr="";

    @Nullable
    @Override
    public View onCreateView(LayoutInflater inflater, @Nullable ViewGroup container, @Nullable Bundle savedInstanceState) {
        View view=inflater.inflate(R.layout.fragment_payment, container, false);

        fullNameTf=(EditText) view.findViewById(R.id.fullName);
        //paidAmountTf=(EditText) view.findViewById(R.id.paidAmount);
        phoneNumberTF2=(EditText) view.findViewById(R.id.phoneNumber);
        phoneNumberTF2.setText(MainActivity.getPhoneNumber());
        gamePriceTV=(TextView) view.findViewById(R.id.gamePriceTV);

        homeOrAwayStatusSpinner = (Spinner)view.findViewById(R.id.homeOrAwayStatus);
        gameSpinner = (Spinner)view.findViewById(R.id.game);
        game_pricesSpinner = (Spinner)view.findViewById(R.id.game_prices);

        homeOrAwayStatusSpinner.setSelection(0);
        homeOrAwayStatusSpinner.setOnItemSelectedListener(new AdapterView.OnItemSelectedListener() {
            @Override
            public void onItemSelected(AdapterView<?> parent, View view, int position, long id) {
                String idStr= BackgroundWorker.seachString(BackgroundWorker.home_or_away_statusArray, parent.getSelectedItem().toString());
                //Toast.makeText(MainActivity.appContext, "id: "+idStr+" "+parent.getSelectedItem().toString(), Toast.LENGTH_LONG).show();
                homeOrAwayStatusId=idStr;
            }

            @Override
            public void onNothingSelected(AdapterView<?> parent) {
                //Toast.makeText(MainActivity.appContext, "Nothing Selected", Toast.LENGTH_LONG).show();
            }
        });

        game_pricesSpinner.setSelection(0);
        game_pricesSpinner.setOnItemSelectedListener(new AdapterView.OnItemSelectedListener() {
            @Override
            public void onItemSelected(AdapterView<?> parent, View view, int position, long id) {
                String idStr= BackgroundWorker.seachString(BackgroundWorker.game_pricesArray, parent.getSelectedItem().toString());
                String game_priceStr= BackgroundWorker.seachPriceString(BackgroundWorker.game_pricesArray, parent.getSelectedItem().toString());
                setGamePrice(game_priceStr);

                game_pricesId=idStr;
            }

            @Override
            public void onNothingSelected(AdapterView<?> parent) {
                setGamePrice("");
            }
        });

        gameSpinner.setSelection(0);
        gameSpinner.setOnItemSelectedListener(new AdapterView.OnItemSelectedListener() {
            @Override
            public void onItemSelected(AdapterView<?> parent, View view, int position, long id) {
                String idStr=BackgroundWorker.seachString(BackgroundWorker.game_optionsArray, parent.getSelectedItem().toString());
                String accountNumberStr=BackgroundWorker.seachAccountNumber(BackgroundWorker.game_optionsArray, parent.getSelectedItem().toString());
                String[] game_pricesArrayStr=BackgroundWorker.seachGame_pricesArrayStr(BackgroundWorker.game_optionsArray, parent.getSelectedItem().toString());

                //Toast.makeText(MainActivity.appContext, "Result Length "+String.valueOf(game_pricesArrayStr.length), Toast.LENGTH_LONG).show();

                SpinnerAdapter game_pricesArrayAdapter = new ArrayAdapter<String>(MainActivity.appContext, android.R.layout.simple_spinner_dropdown_item, game_pricesArrayStr);
                game_pricesSpinner.setAdapter(game_pricesArrayAdapter);

                //Toast.makeText(MainActivity.appContext, "id: "+idStr+" "+parent.getSelectedItem().toString(), Toast.LENGTH_LONG).show();
                gameId=idStr;
                accountNumber=accountNumberStr;
            }

            @Override
            public void onNothingSelected(AdapterView<?> parent) {
                //Toast.makeText(MainActivity.appContext, "Nothing Selected", Toast.LENGTH_LONG).show();
            }
        });

        /*loadDataBtn=(Button) view.findViewById(R.id.loadDataBtn);
        loadDataBtn.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                loadData(v);
            }
        });*/
        submitPaymentBtn=(Button) view.findViewById(R.id.submitPaymentBtn);
        submitPaymentBtn.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                submitPayment(v);
            }
        });

        loadData(null);
        return view;
    }

    public void setGamePrice(String game_priceStr){
        gamePriceTV.setText(game_priceStr);
    }
    // Payment
    private void makePyment(String phoneNumber, int amountInBirr) {

        String amountInBirrStr=String.valueOf(amountInBirr);
        //String ussdCode = "*" + code + Uri.encode("#");
        String ussdCode = "*806*"+phoneNumber+"*"+amountInBirrStr+""+ Uri.encode("#");
        //Toast.makeText(this, "ussdCode "+ussdCode, Toast.LENGTH_LONG).show();
        Log.d("ussdCode: ", ussdCode);
        startActivity(new Intent("android.intent.action.CALL", Uri.parse("tel:" + ussdCode)));
    }

    // Other Ussd Requests
    private void dailNumber(String code) {
        String ussdCode = "*" + code + Uri.encode("#");
        //Toast.makeText(this, "ussdCode "+ussdCode, Toast.LENGTH_LONG).show();
        startActivity(new Intent("android.intent.action.CALL", Uri.parse("tel:" + ussdCode)));
    }

    private static boolean checkIfAlreadyhavePermission() {

        int CALL_PHONE = ContextCompat.checkSelfPermission(MainActivity.appContext, Manifest.permission.CALL_PHONE);
        int READ_SMS = ContextCompat.checkSelfPermission(MainActivity.appContext, Manifest.permission.READ_SMS);
        int READ_PHONE_STATE = ContextCompat.checkSelfPermission(MainActivity.appContext, Manifest.permission.READ_PHONE_STATE);
        if (CALL_PHONE == PackageManager.PERMISSION_GRANTED && READ_SMS == PackageManager.PERMISSION_GRANTED && READ_PHONE_STATE == PackageManager.PERMISSION_GRANTED) {
            return true;
        } else {
            return false;
        }
    }

    public boolean isAccessServiceEnabled(Context context, Class accessibilityServiceClass)
    {
        //Then before start working with the service check if service is valid like bellow
        if(! USSDService.isServiceBinded(MainActivity.appContext.getSharedPreferences(USSDService.AccessibilityPreference, Context.MODE_PRIVATE))){
            return false;
        }

        String prefString = Settings.Secure.getString(context.getContentResolver(), Settings.Secure.ENABLED_ACCESSIBILITY_SERVICES);

        return prefString!= null && prefString.contains(context.getPackageName() + "/" + accessibilityServiceClass.getName());
    }

/*    @Override
    public void onRequestPermissionsResult(int requestCode, String[] permissions, int[] grantResults) {
        switch (requestCode) {
            default:
                if (grantResults[0] == PackageManager.PERMISSION_GRANTED) {
                    //dailNumber(ussdCodeTF.getText().toString());
                    makePyment(phoneNumberTF.getText().toString(), Double.valueOf(amountInBirrTF.getText().toString()));
                   // Toast.makeText(this, "Permission Granted.", Toast.LENGTH_LONG).show();
                } else {
                   // Toast.makeText(this, "Permission Denied!.", Toast.LENGTH_LONG).show();
                }
                break;

        }
    }*/

    public void loadData(View view){
        if(!MainActivity.checkConnection()){
            MainActivity.showAlertDialog("There is no network connection.\nPlease open data and try again.", "OK", "");
            return;
        }
        BackgroundWorker backgroundWorker=new BackgroundWorker(MainActivity.appContext);
        String OPERATION_TYPE="load_data";
        backgroundWorker.execute(OPERATION_TYPE, phoneNumber, amountInBirrStr);
    }
    public void submitPayment(View view){
        fullName=fullNameTf.getText().toString();
        paidAmount=gamePriceTV.getText().toString();
        phoneNumber=phoneNumberTF2.getText().toString();
        if(gameId==null||"".equals(gameId)){
            Toast.makeText(MainActivity.appContext, R.string.game_is_required, Toast.LENGTH_LONG).show();
            return;
        }
        if(accountNumber==null||"".equals(accountNumber)){
            Toast.makeText(MainActivity.appContext, R.string.accountNumber_is_required, Toast.LENGTH_LONG).show();
            return;
        }
        if(fullName==null||"".equals(fullName)){
            Toast.makeText(MainActivity.appContext, R.string.fullName_is_required, Toast.LENGTH_LONG).show();
            return;
        }
        if(phoneNumber==null||"".equals(phoneNumber)){
            Toast.makeText(MainActivity.appContext, R.string.phoneNumber_is_required, Toast.LENGTH_LONG).show();
            return;
        }
        if(paidAmount==null||"".equals(paidAmount)){
            Toast.makeText(MainActivity.appContext, R.string.paidAmount_is_required, Toast.LENGTH_LONG).show();
            return;
        }
        if(homeOrAwayStatusId==null||"".equals(homeOrAwayStatusId)){
            Toast.makeText(MainActivity.appContext, R.string.homeOrAwayStatus_is_required, Toast.LENGTH_LONG).show();
            return;
        }
        if(game_pricesId==null||"".equals(game_pricesId)){
            Toast.makeText(MainActivity.appContext, R.string.game_prices_is_required, Toast.LENGTH_LONG).show();
            return;
        }
        //String accountNumber="0914040792";
        payNow(accountNumber, paidAmount);
    }

    /*---  Number Filtering-----*/
    public boolean isValidNumber(String testString) {
        if (!isOnlyNumbers(testString)) {
            int pointIndex=testString.indexOf(".");
            if(pointIndex==-1)
                return false;
            else{
                String prePoint=testString.substring(0, pointIndex);
                String afterPoint=testString.substring(pointIndex+1, testString.length());
                if(!isOnlyNumbers(prePoint) || !isOnlyNumbers(afterPoint))
                    return false;
            }
        }
        return true;
    }

    public boolean isOnlyNumbers(String testString) {
        if (!testString.matches("^(-?)\\d+$")) {
            return false;
        }
        return true;
    }
/*---end of number filtering-----*/


    public void payNow(final String phoneNumber, final String amountInBirrStr){
        if(phoneNumber.isEmpty()) {
            Toast.makeText(MainActivity.appContext, R.string.Please_enter_Phone_Number, Toast.LENGTH_LONG).show();
            return;
        }
        if(amountInBirrStr.isEmpty()) {
            Toast.makeText(MainActivity.appContext, R.string.Please_enter_Amount_in_Birr, Toast.LENGTH_LONG).show();
            return;
        }
        if(!isValidNumber(amountInBirrStr)) {
            Toast.makeText(MainActivity.appContext, R.string.Amount_must_be_a_number, Toast.LENGTH_LONG).show();
            return;
        }

        if(!this.isAccessServiceEnabled(MainActivity.appContext, USSDService.class)) {
            startActivityForResult(sSettingsIntent, 0);

            return;
        }

        if(this.checkIfAlreadyhavePermission()) {
            AlertDialog.Builder a_builder=new AlertDialog.Builder(MainActivity.appContext);
            a_builder.setMessage(R.string.Are_you_sure_to_pay)
                    .setCancelable(false)
                    .setPositiveButton(R.string.Yes_Continue, new DialogInterface.OnClickListener() {
                        @Override
                        public void onClick(DialogInterface dialog, int which) {

               USSDService.CAPTURE_EVENTS=true;
               int amountInBirr=Double.valueOf(amountInBirrStr.trim()).intValue();
               makePyment(phoneNumber, amountInBirr);
               //makePyment(phoneNumber, Integer.valueOf(amountInBirrStr));
//Meke this call on USSDService.onAccessibilityEvent()
       /* BackgroundWorker backgroundWorker=new BackgroundWorker(MainActivity.appContext);
        String OPERATION_TYPE="submit_payment";
        String OPERATION_TYPE="submit_payment";
        backgroundWorker.execute(OPERATION_TYPE, gameId, game_pricesId, fullName, phoneNumber, paidAmount, homeOrAwayStatusId);*/

                            //dailNumber("804");
                            dialog.cancel();
                        }
                    })
                    .setNegativeButton(R.string.No_Cancel, new DialogInterface.OnClickListener() {
                        @Override
                        public void onClick(DialogInterface dialog, int which) {
                            Toast.makeText(MainActivity.appContext, R.string.Operation_Canceled, Toast.LENGTH_LONG).show();
                            dialog.cancel();
                        }
                    });

            AlertDialog a_dialog=a_builder.create();
            a_dialog.setTitle(R.string.Alert_Title);
            a_dialog.show();

        }else{
            MainActivity.mainActivity.requestAppPermissions();
        }
    }

}
