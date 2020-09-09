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
import android.widget.ImageView;
import android.widget.Spinner;
import android.widget.Toast;

import com.pilasa.models.Category;
import com.pilasa.models.Complex_building;
import com.pilasa.models.Letter;
import com.pilasa.DBManager;
import com.pilasa.MainActivity;
import com.pilasa.R;

public class Create_officeFragment extends Fragment {

    private EditText nameTf, descriptionTf, imageTf, numberTf, longitudeTf, latitudeTf;
    private Spinner buildingIdSpinner, categoryIdSpinner, letterIdSpinner, levelSpinner;
    private ImageView imageView;

    private String name, description, image, number, longitude, latitude;
    private Complex_building complex_building;
    private Category category;
    private Letter letter;
    private int level=0;

    @Nullable
    @Override
    public View onCreateView(LayoutInflater inflater, @Nullable ViewGroup container, @Nullable Bundle savedInstanceState) {
        View view=inflater.inflate(R.layout.create_office, container, false);

        nameTf=(EditText) view.findViewById(R.id.name);
        imageTf=(EditText) view.findViewById(R.id.image);
        numberTf=(EditText) view.findViewById(R.id.number);
        longitudeTf=(EditText) view.findViewById(R.id.longitude);
        latitudeTf=(EditText) view.findViewById(R.id.latitude);
        descriptionTf=(EditText) view.findViewById(R.id.description);

        imageView = (ImageView)view.findViewById(R.id.imageView);
        imageView.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {

            }
        });

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

        categoryIdSpinner=(Spinner) view.findViewById(R.id.categoryId);
        ArrayAdapter<Category> arrayAdapter2=new ArrayAdapter<Category>(this.getActivity(), android.R.layout.simple_spinner_item, MainActivity.db.categories());
        arrayAdapter2.setDropDownViewResource(android.R.layout.simple_spinner_dropdown_item);
        categoryIdSpinner.setAdapter(arrayAdapter2);
        categoryIdSpinner.setSelection(0);
        categoryIdSpinner.setOnItemSelectedListener(new AdapterView.OnItemSelectedListener() {
            @Override
            public void onItemSelected(AdapterView<?> parent, View view, int position, long id) {
                category=(Category) parent.getSelectedItem();
            }

            @Override
            public void onNothingSelected(AdapterView<?> parent) {
                category=null;
            }
        });

        letterIdSpinner=(Spinner) view.findViewById(R.id.letterId);
        ArrayAdapter<Letter> arrayAdapter3=new ArrayAdapter<Letter>(this.getActivity(), android.R.layout.simple_spinner_item, MainActivity.db.letters());
        arrayAdapter3.setDropDownViewResource(android.R.layout.simple_spinner_dropdown_item);
        letterIdSpinner.setAdapter(arrayAdapter3);
        letterIdSpinner.setSelection(0);
        letterIdSpinner.setOnItemSelectedListener(new AdapterView.OnItemSelectedListener() {
            @Override
            public void onItemSelected(AdapterView<?> parent, View view, int position, long id) {
                letter=(Letter) parent.getSelectedItem();
            }

            @Override
            public void onNothingSelected(AdapterView<?> parent) {
                letter=null;
            }
        });

        levelSpinner=(Spinner) view.findViewById(R.id.level);
        ArrayAdapter<Integer> arrayAdapter4=new ArrayAdapter<Integer>(this.getActivity(), android.R.layout.simple_spinner_item, MainActivity.db.levels());
        arrayAdapter4.setDropDownViewResource(android.R.layout.simple_spinner_dropdown_item);
        levelSpinner.setAdapter(arrayAdapter4);
        levelSpinner.setSelection(0);
        levelSpinner.setOnItemSelectedListener(new AdapterView.OnItemSelectedListener() {
            @Override
            public void onItemSelected(AdapterView<?> parent, View view, int position, long id) {
                level=(Integer) parent.getSelectedItem();
            }

            @Override
            public void onNothingSelected(AdapterView<?> parent) {
                level=0;
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
        image=/*MainActivity.imageByteString;*/imageTf.getText().toString();
        number=numberTf.getText().toString();
        longitude=longitudeTf.getText().toString();
        latitude=latitudeTf.getText().toString();
        description=descriptionTf.getText().toString();

        if(name==null||"".equals(name)){
            Toast.makeText(MainActivity.appContext, R.string.name_is_required, Toast.LENGTH_LONG).show();
            return;
        }
        if(image==null||"".equals(image)){
            Toast.makeText(MainActivity.appContext, R.string.image_is_required, Toast.LENGTH_LONG).show();
            return;
        }
        if(number==null||"".equals(number)){
            Toast.makeText(MainActivity.appContext, R.string.number_is_required, Toast.LENGTH_LONG).show();
            return;
        }
        if(longitude==null||"".equals(longitude)){
            Toast.makeText(MainActivity.appContext, R.string.longitude_is_required, Toast.LENGTH_LONG).show();
            return;
        }
        if(latitude==null||"".equals(latitude)){
            Toast.makeText(MainActivity.appContext, R.string.latitude_is_required, Toast.LENGTH_LONG).show();
            return;
        }
        if(level==0){
            Toast.makeText(MainActivity.appContext, R.string.level_is_required, Toast.LENGTH_LONG).show();
            return;
        }
        if(complex_building==null){
            Toast.makeText(MainActivity.appContext, R.string.buildingId_is_required, Toast.LENGTH_LONG).show();
            return;
        }
        if(category==null){
            Toast.makeText(MainActivity.appContext, R.string.categoryId_is_required, Toast.LENGTH_LONG).show();
            return;
        }
        if(letter==null){
            Toast.makeText(MainActivity.appContext, R.string.letterId_is_required, Toast.LENGTH_LONG).show();
            return;
        }

        boolean success=MainActivity.db.insert_offices(complex_building.getId(), category.getId(), name, level, image, number, letter.getId(), Double.valueOf(longitude), Double.valueOf(latitude), description);
        Toast.makeText(MainActivity.appContext, success? R.string.row_inserted: R.string.operation_failed, Toast.LENGTH_LONG).show();
        if(success){
            buildingIdSpinner.setSelection(0);
            nameTf.setText("");
            imageTf.setText("");
            numberTf.setText("");
            longitudeTf.setText("");
            latitudeTf.setText("");
            descriptionTf.setText("");
            levelSpinner.setSelection(0);
            categoryIdSpinner.setSelection(0);
            categoryIdSpinner.setSelection(0);
            letterIdSpinner.setSelection(0);
        }
    }
    private void ImageBtn_Click(View v)
    {
        MainActivity.mainActivity.SelectPic((ImageView)v);
    }
}
