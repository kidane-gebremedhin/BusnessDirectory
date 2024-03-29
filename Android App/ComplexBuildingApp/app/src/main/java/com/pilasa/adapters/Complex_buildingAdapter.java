package com.pilasa.adapters;

import android.content.Context;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.BaseAdapter;
import android.widget.TextView;

import com.pilasa.R;
import com.pilasa.models.Category;
import com.pilasa.models.Complex_building;
import com.pilasa.models.Letter;
import com.pilasa.models.Office;

import java.util.List;

/**
 * Created by User on 2/8/2020.
 */

public class Complex_buildingAdapter extends BaseAdapter {
    List<Complex_building> mItems;
    Context mContext;

    public Complex_buildingAdapter(Context context, List<Complex_building> items)
    {
        mContext = context;
        mItems = items;
    }

    @Override
    public int getCount() {
        return mItems.size();
    }

    @Override
    public Complex_building getItem(int position) {
        return mItems.get(position);
    }

    @Override
    public long getItemId(int position) {
        return position;
    }

    @Override
    public View getView(int position, View convertView, ViewGroup parent) {
        View view=convertView;
        if (view == null)
            view = LayoutInflater.from(mContext).inflate(R.layout.generic_list_row, null, false);

        TextView nameTextView = (TextView)view.findViewById(R.id.nameTv);

        nameTextView.setText(mItems.get(position).getName());

        return view;
    }
}
