package com.pilasa.fragments;

import android.os.Bundle;
import android.support.annotation.Nullable;
import android.support.v4.app.Fragment;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.Button;
import android.widget.EditText;
import android.widget.Toast;

import com.pilasa.DBManager;
import com.pilasa.MainActivity;
import com.pilasa.R;

public class Create_letterFragment extends Fragment {

    private EditText nameTf, descriptionTf;
    private String name, description;

    @Nullable
    @Override
    public View onCreateView(LayoutInflater inflater, @Nullable ViewGroup container, @Nullable Bundle savedInstanceState) {
        View view=inflater.inflate(R.layout.create_letter, container, false);

        nameTf=(EditText) view.findViewById(R.id.name);
        descriptionTf=(EditText) view.findViewById(R.id.description);

        Button submitBtn=(Button) view.findViewById(R.id.submitBtn);
        submitBtn.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                submit(v);
            }
        });

        return view;
    }

    public void submit(View view){
        name=nameTf.getText().toString();
        description=descriptionTf.getText().toString();
        if(name==null||"".equals(name)){
            Toast.makeText(MainActivity.appContext, R.string.name_is_required, Toast.LENGTH_LONG).show();
            return;
        }

        boolean success=MainActivity.db.insert_letters(name, description);
        Toast.makeText(MainActivity.appContext, success? R.string.row_inserted: R.string.operation_failed, Toast.LENGTH_LONG).show();
        if(success){
            nameTf.setText("");
            descriptionTf.setText("");
        }
    }

}
