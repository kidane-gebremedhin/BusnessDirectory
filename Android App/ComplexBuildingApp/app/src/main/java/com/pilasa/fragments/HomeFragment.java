package com.pilasa.fragments;

import android.os.Bundle;
import android.support.annotation.Nullable;
import android.support.v4.app.Fragment;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.Button;
import android.widget.TextView;

import com.pilasa.MainActivity;
import com.pilasa.R;


public class HomeFragment extends Fragment {

    private Button buyTicketBtn;
    private TextView categoriesCountTv, officesCountTv;
    @Nullable
    @Override
    public View onCreateView(LayoutInflater inflater, @Nullable ViewGroup container, @Nullable Bundle savedInstanceState) {
        View view=inflater.inflate(R.layout.fragment_home, container, false);

        officesCountTv=(TextView) view.findViewById(R.id.officesCountTv);
        categoriesCountTv=(TextView) view.findViewById(R.id.categoriesCountTv);
        officesCountTv.setText(String.valueOf(MainActivity.db.offices().size()));
        categoriesCountTv.setText(String.valueOf(MainActivity.db.categories().size()));

        buyTicketBtn=(Button) view.findViewById(R.id.buyTicketBtn);
        buyTicketBtn.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                MainActivity.mainActivity.replaceFragment(new Search_officeFragment());
            }
        });


        return view;
    }
}
