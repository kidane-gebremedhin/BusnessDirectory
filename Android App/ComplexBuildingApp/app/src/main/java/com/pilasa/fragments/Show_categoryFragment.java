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
import android.widget.TextView;
import android.widget.Toast;

import com.pilasa.MainActivity;
import com.pilasa.R;
import com.pilasa.models.Complex_building;

public class Show_categoryFragment extends Fragment {

    private TextView nameTf, descriptionTf, buildingIdTf;
    @Nullable
    @Override
    public View onCreateView(LayoutInflater inflater, @Nullable ViewGroup container, @Nullable Bundle savedInstanceState) {
        View view=inflater.inflate(R.layout.show_category, container, false);

        nameTf=(TextView) view.findViewById(R.id.name);
        descriptionTf=(TextView) view.findViewById(R.id.description);
         buildingIdTf=(TextView) view.findViewById(R.id.buildingId);

        nameTf.setText(Index_categoryFragment.category.getName());
        descriptionTf.setText(Index_categoryFragment.category.getDescription());
        buildingIdTf.setText(Index_categoryFragment.category.complexBuilding().toString());

        Button indexBtn=(Button) view.findViewById(R.id.indexBtn);
        indexBtn.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                MainActivity.mainActivity.replaceFragment(new Index_categoryFragment());
            }
        });

        return view;
    }

}
