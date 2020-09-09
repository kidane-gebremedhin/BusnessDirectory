package com.pilasa.fragments;

import android.os.Bundle;
import android.support.annotation.Nullable;
import android.support.v4.app.Fragment;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.Button;
import android.widget.EditText;
import android.widget.TextView;

import com.pilasa.MainActivity;
import com.pilasa.R;

public class Show_officeFragment extends Fragment {

    private TextView nameTf, descriptionTf, buildingIdTf, imageTf, numberTf, longitudeTf, latitudeTf, categoryIdTf, letterIdTf, levelTf;
    @Nullable
    @Override
    public View onCreateView(LayoutInflater inflater, @Nullable ViewGroup container, @Nullable Bundle savedInstanceState) {
        View view=inflater.inflate(R.layout.show_office, container, false);


        nameTf=(TextView) view.findViewById(R.id.name);
        imageTf=(TextView) view.findViewById(R.id.image);
        numberTf=(TextView) view.findViewById(R.id.number);
        longitudeTf=(TextView) view.findViewById(R.id.longitude);
        latitudeTf=(TextView) view.findViewById(R.id.latitude);
        descriptionTf=(TextView) view.findViewById(R.id.description);

        buildingIdTf=(TextView) view.findViewById(R.id.buildingId);
        categoryIdTf=(TextView) view.findViewById(R.id.categoryId);
        letterIdTf=(TextView) view.findViewById(R.id.letterId);
        levelTf=(TextView) view.findViewById(R.id.level);

        nameTf.setText(Index_officeFragment.selectedItem.getName());
        descriptionTf.setText(Index_officeFragment.selectedItem.getDescription());
        imageTf.setText(Index_officeFragment.selectedItem.getImage().toString());
        longitudeTf.setText(String.valueOf(Index_officeFragment.selectedItem.getLongitude()));
        latitudeTf.setText(String.valueOf(Index_officeFragment.selectedItem.getLatitude()));
        buildingIdTf.setText(Index_officeFragment.selectedItem.complexBuilding().toString());
        categoryIdTf.setText(Index_officeFragment.selectedItem.category().toString());
        numberTf.setText(Index_officeFragment.selectedItem.getNumber());
        levelTf.setText(String.valueOf(Index_officeFragment.selectedItem.getLevel()));
        letterIdTf.setText(Index_officeFragment.selectedItem.letter().toString());

        Button indexBtn=(Button) view.findViewById(R.id.indexBtn);
        indexBtn.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                MainActivity.mainActivity.replaceFragment(new Index_letterFragment());
            }
        });

        return view;
    }

}
