package com.pilasa.fragments;

import android.os.Bundle;
import android.support.annotation.Nullable;
import android.support.v4.app.Fragment;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.AdapterView;
import android.widget.ArrayAdapter;
import android.widget.Button;
import android.widget.EditText;
import android.widget.Spinner;
import android.widget.Toast;

import com.pilasa.models.Complex_building;
import com.pilasa.DBManager;
import com.pilasa.MainActivity;
import com.pilasa.R;

public class Create_categoryFragment extends Fragment {

    private EditText nameTf, descriptionTf;
    private Spinner buildingIdSpinner;
    private String name, description;
    private Complex_building complex_building;

    @Nullable
    @Override
    public View onCreateView(LayoutInflater inflater, @Nullable ViewGroup container, @Nullable Bundle savedInstanceState) {
        View view=inflater.inflate(R.layout.create_category, container, false);

        nameTf=(EditText) view.findViewById(R.id.name);
        descriptionTf=(EditText) view.findViewById(R.id.description);

        buildingIdSpinner=(Spinner) view.findViewById(R.id.buildingId);
        ArrayAdapter<Complex_building> arrayAdapter=new ArrayAdapter<Complex_building>(this.getActivity(), android.R.layout.simple_spinner_item, MainActivity.db.complex_buildings());
        arrayAdapter.setDropDownViewResource(android.R.layout.simple_spinner_dropdown_item);

        buildingIdSpinner.setAdapter(arrayAdapter);
        buildingIdSpinner.setSelection(0);
        buildingIdSpinner.setOnItemSelectedListener(new AdapterView.OnItemSelectedListener() {
            @Override
            public void onItemSelected(AdapterView<?> parent, View view, int position, long id) {
                complex_building=(Complex_building)parent.getSelectedItem();
            }

            @Override
            public void onNothingSelected(AdapterView<?> parent) {
                complex_building=null;
            }
        });

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
        if(complex_building==null){
            Toast.makeText(MainActivity.appContext, R.string.buildingId_is_required, Toast.LENGTH_LONG).show();
            return;
        }

        boolean success=MainActivity.db.insert_categories(complex_building.getId(), name, description);
        Toast.makeText(MainActivity.appContext, success? R.string.row_inserted: R.string.operation_failed, Toast.LENGTH_LONG).show();
        if(success){
            buildingIdSpinner.setSelection(0);
            nameTf.setText("");
            descriptionTf.setText("");
        }
    }

}
