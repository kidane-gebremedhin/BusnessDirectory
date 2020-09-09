package com.pilasa.fragments;

import android.content.DialogInterface;
import android.os.Bundle;
import android.support.annotation.Nullable;
import android.support.v4.app.Fragment;
import android.view.KeyEvent;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.AdapterView;
import android.widget.ArrayAdapter;
import android.widget.Button;
import android.widget.EditText;
import android.widget.LinearLayout;
import android.widget.ListView;
import android.widget.Spinner;
import android.widget.TextView;
import android.widget.Toast;

import com.pilasa.MainActivity;
import com.pilasa.R;
import com.pilasa.adapters.OfficeAdapter;
import com.pilasa.models.Category;
import com.pilasa.models.Office;

import java.util.ArrayList;
import java.util.List;

public class Search_officeFragment extends Fragment {

    private ListView listView;
    private float screenHeight = 400;
    public static List<Office> items;
    public static Office selectedItem;
    private Spinner categoryIdSpinner;
    private Category category;
    private EditText nameTf;
    private  TextView search_resultsTv;
    private LinearLayout search_resultsLayout;

    @Nullable
    @Override
    public View onCreateView(LayoutInflater inflater, @Nullable ViewGroup container, @Nullable Bundle savedInstanceState) {
        View view=inflater.inflate(R.layout.search_office, container, false);

        //Retrive Programs
        items = MainActivity.db.offices();

        nameTf=(EditText) view.findViewById(R.id.name);
        nameTf.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Toast.makeText(MainActivity.appContext, "Here 2", Toast.LENGTH_LONG).show();
                searchOffices();
            }
        });

        search_resultsTv=(TextView)view.findViewById(R.id.search_resultsTv);
        search_resultsLayout=(LinearLayout)view.findViewById(R.id.search_resultsLayout);
        search_resultsLayout.setVisibility(View.INVISIBLE);

        categoryIdSpinner=(Spinner) view.findViewById(R.id.categoryId);
        List<Category> categories=new ArrayList<>();
        categories.add(new Category(0, 0, "Category", ""));
        categories.addAll(MainActivity.db.categories());
        ArrayAdapter<Category> arrayAdapter2=new ArrayAdapter<Category>(this.getActivity(), android.R.layout.simple_spinner_item, categories);
        arrayAdapter2.setDropDownViewResource(android.R.layout.simple_spinner_dropdown_item);
        categoryIdSpinner.setAdapter(arrayAdapter2);
        categoryIdSpinner.setSelection(0);
        categoryIdSpinner.setOnItemSelectedListener(new AdapterView.OnItemSelectedListener() {
            @Override
            public void onItemSelected(AdapterView<?> parent, View view, int position, long id) {
                category=(Category) parent.getSelectedItem();

                searchOffices();
            }

            @Override
            public void onNothingSelected(AdapterView<?> parent) {
                category=null;
            }
        });

        listView = (ListView) view.findViewById(R.id.listView);
        OfficeAdapter arrayAdapter=new OfficeAdapter(this.getContext(), items);
        listView.setAdapter(arrayAdapter);

        listView.setOnItemClickListener(new AdapterView.OnItemClickListener() {
            @Override
            public void onItemClick(AdapterView<?> parent, View view, int position, long id) {
                listView_ItemClick((Office)items.get(position));
            }
        });

        return view;
    }

    private void searchOffices(){
        List<Office> filteredOffices=new ArrayList<>();
        for(Office item: items) {
            if (category!=null && category.getId()>0 && item.getCategoryId() != category.getId())
                continue;
            if (!"".equals(nameTf.getText().toString()) && !item.getName().contains(nameTf.getText().toString()))
                continue;

            filteredOffices.add(item);
        }

        search_resultsTv.setText("Search Results: "+filteredOffices.size());
        search_resultsLayout.setVisibility(View.VISIBLE);

        OfficeAdapter arrayAdapter=new OfficeAdapter(MainActivity.appContext, filteredOffices);
        listView.setAdapter(arrayAdapter);
    }

    private void listView_ItemClick(Office item){
        Index_officeFragment.selectedItem = item;
        MainActivity.mainActivity.replaceFragment(new Show_officeFragment());
    }


}
