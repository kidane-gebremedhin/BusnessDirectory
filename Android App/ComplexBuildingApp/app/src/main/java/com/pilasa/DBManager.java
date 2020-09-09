package com.pilasa;

import android.content.ContentValues;
import android.content.Context;
import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;
import android.database.sqlite.SQLiteOpenHelper;

import com.pilasa.models.Category;
import com.pilasa.models.Complex_building;
import com.pilasa.models.Letter;
import com.pilasa.models.Office;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by User on 2/7/2020.
 */

public class DBManager extends SQLiteOpenHelper {
    private static String DB_NAME="ComplexBuildingApp_2.db";
    private static String complex_buildings="complex_buildings";
    private static String categories="categories";
    private static String letters="letters";
    private static String offices="offices";

    public DBManager(Context context) {
        super(context, DB_NAME, null, 1);
        //context.openOrCreateDatabase(DB_NAME, context.MODE_PRIVATE, null);
    }

    @Override
    public void onCreate(SQLiteDatabase db) {

        //complex_buildings
        db.execSQL("create table if not exists "+complex_buildings+"(" +
                "id integer primary key AUTOINCREMENT," +
                "name text," +
                "description text)");
        //categories
        db.execSQL("create table if not exists "+categories+"(" +
                "id integer primary key AUTOINCREMENT," +
                "buildingId integer," +
                "name text," +
                "description text)");
        //letters
        db.execSQL("create table if not exists "+letters+"(" +
                "id integer primary key AUTOINCREMENT," +
                "name text," +
                "description text)");
        //offices
        db.execSQL("create table if not exists "+offices+"(" +
                "id integer primary key AUTOINCREMENT," +
                "buildingId integer," +
                "categoryId integer," +
                "letterId integer," +
                "name text," +
                "level integer," +
                "image blob," +
                "number text," +
                "longitude double," +
                "latitude double," +
                "description text)");

    }

    @Override
    public void onUpgrade(SQLiteDatabase db, int oldVersion, int newVersion) {
        db.execSQL("drop table if exists "+complex_buildings);

        onCreate(db);
    }

    //Store
    public boolean insert_complex_buildings(String name, String description){
        SQLiteDatabase sqLiteDb=this.getWritableDatabase();
        ContentValues contentValues=new ContentValues();
        contentValues.put("name", name);
        contentValues.put("description", description);

        long status=sqLiteDb.insert(complex_buildings, null,contentValues);
        return status!=-1;
    }
    public boolean insert_categories(int buildingId, String name, String description){
        SQLiteDatabase sqLiteDb=this.getWritableDatabase();
        ContentValues contentValues=new ContentValues();
        contentValues.put("buildingId", buildingId);
        contentValues.put("name", name);
        contentValues.put("description", description);

        long status=sqLiteDb.insert(categories, null,contentValues);
        return status!=-1;
    }
    public boolean insert_letters(String name, String description){
        SQLiteDatabase sqLiteDb=this.getWritableDatabase();
        ContentValues contentValues=new ContentValues();
        contentValues.put("name", name);
        contentValues.put("description", description);

        long status=sqLiteDb.insert(letters, null,contentValues);
        return status!=-1;
    }
    public boolean insert_offices(int buildingId, int categoryId, String name, int level, String image, String number, int letter, double longitude, double latitude, String description){
        SQLiteDatabase sqLiteDb=this.getWritableDatabase();
        ContentValues contentValues=new ContentValues();
        contentValues.put("buildingId", buildingId);
        contentValues.put("categoryId", categoryId);
        contentValues.put("name", name);
        contentValues.put("level", level);
        contentValues.put("image", image);
        contentValues.put("number", number);
        contentValues.put("letterId", letter);
        contentValues.put("longitude", longitude);
        contentValues.put("latitude", latitude);
        contentValues.put("description", description);
        long status=sqLiteDb.insert(offices, null,contentValues);
        return status!=-1;
    }

    //Update
    public boolean update_categories(int id, int buildingId, String name, String description){
        SQLiteDatabase sqLiteDb=this.getWritableDatabase();
        ContentValues contentValues=new ContentValues();
        contentValues.put("buildingId", buildingId);
        contentValues.put("name", name);
        contentValues.put("description", description);

        sqLiteDb.update(categories, contentValues, "id = ?", new String[]{ String.valueOf(id) });
        return true;
    }
    public boolean update_letters(int id, String name, String description){
        SQLiteDatabase sqLiteDb=this.getWritableDatabase();
        ContentValues contentValues=new ContentValues();
        contentValues.put("name", name);
        contentValues.put("description", description);

        sqLiteDb.update(letters, contentValues, "id = ?", new String[]{ String.valueOf(id) });
        return true;
    }
    public boolean update_complex_buildings(int id, String name, String description){
        SQLiteDatabase sqLiteDb=this.getWritableDatabase();
        ContentValues contentValues=new ContentValues();
        contentValues.put("id", id);
        contentValues.put("name", name);
        contentValues.put("description", description);

        sqLiteDb.update(complex_buildings, contentValues, "id = ?", new String[]{ String.valueOf(id) });
        return true;
    }
    public boolean update_offices(int id, int buildingId, int categoryId, String name, int level, String image, String number, int letter, double longitude, double latitude, String description){
        SQLiteDatabase sqLiteDb=this.getWritableDatabase();
        ContentValues contentValues=new ContentValues();
        contentValues.put("id", id);
        contentValues.put("buildingId", buildingId);
        contentValues.put("categoryId", categoryId);
        contentValues.put("name", name);
        contentValues.put("level", level);
        contentValues.put("image", image);
        contentValues.put("number", number);
        contentValues.put("letterId", letter);
        contentValues.put("longitude", longitude);
        contentValues.put("latitude", latitude);
        contentValues.put("description", description);
        sqLiteDb.update(offices, contentValues, "id = ?", new String[]{ String.valueOf(id) });
        return true;
    }

    //Index
    public List<Complex_building> complex_buildings(){
        List<Complex_building> items=new ArrayList<>();

        SQLiteDatabase sqLiteDb=this.getWritableDatabase();
        Cursor result=sqLiteDb.rawQuery("select * from "+complex_buildings, null);

        while(result.moveToNext()){
            Complex_building complex_building=new Complex_building(result.getInt(0), result.getString(1), result.getString(2));
            items.add(complex_building);
        }

        return items;
    }
    public List<Letter> letters(){
        List<Letter> items=new ArrayList<>();

        SQLiteDatabase sqLiteDb=this.getWritableDatabase();
        Cursor result=sqLiteDb.rawQuery("select * from "+letters, null);

        while(result.moveToNext()){
            Letter letter=new Letter(result.getInt(0), result.getString(1), result.getString(2));
            items.add(letter);
        }

        return items;
    }

    public List<Category> categories(){
        List<Category> items=new ArrayList<>();

        SQLiteDatabase sqLiteDb=this.getWritableDatabase();
        Cursor result=sqLiteDb.rawQuery("select * from "+categories, null);

        while(result.moveToNext()){
            Category category=new Category(result.getInt(0), result.getInt(1), result.getString(2), result.getString(3));
            items.add(category);
        }

        return items;
    }
    public List<Office> offices(){
        List<Office> items=new ArrayList<>();

        SQLiteDatabase sqLiteDb=this.getWritableDatabase();
        Cursor result=sqLiteDb.rawQuery("select * from "+offices, null);

        while(result.moveToNext()){
            Office office=new Office(result.getInt(0), result.getInt(1), result.getInt(2), result.getInt(3), result.getString(4), result.getInt(5), result.getString(6), result.getDouble(7), result.getDouble(8), result.getString(9).getBytes(), result.getString(10));
            items.add(office);
        }

        return items;
    }

    public List<Integer> levels(){
        List<Integer> items=new ArrayList<>();
        int level=0;
        while(level <= 100){
            items.add(level++);
        }

        return items;
    }

    //Delete
    public int deleteCategory(long id){
        SQLiteDatabase sqLiteDb=this.getWritableDatabase();
        int count=sqLiteDb.delete(categories, "id = ?", new String []{ String.valueOf(id) });
        return count;
    }
}
