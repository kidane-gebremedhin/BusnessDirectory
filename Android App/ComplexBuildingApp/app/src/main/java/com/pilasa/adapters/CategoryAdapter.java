package com.pilasa.adapters;

import android.content.Context;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.BaseAdapter;
import android.widget.TextView;

import com.pilasa.R;
import com.pilasa.models.Category;

import java.util.List;

/**
 * Created by User on 2/8/2020.
 */

public class CategoryAdapter extends BaseAdapter {
    List<Category> mCategories;
    Context mContext;

    public CategoryAdapter(Context context, List<Category> categories)
    {
        mContext = context;
        mCategories = categories;
    }

    @Override
    public int getCount() {
        return mCategories.size();
    }

    @Override
    public Category getItem(int position) {
        return mCategories.get(position);
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

        nameTextView.setText(mCategories.get(position).getName());

        return view;
    }
}
