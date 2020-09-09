package com.pilasa.models;

import com.pilasa.MainActivity;

/**
 * Created by User on 2/8/2020.
 */

public class Category  {
    private int id;
    private int buildingId;
    private String name;
    private String description;

    public Category(int id, int buildingId, String name, String description) {
        this.id = id;
        this.buildingId = buildingId;
        this.name = name;
        this.description = description;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getBuildingId() {
        return buildingId;
    }

    public void setBuildingId(int buildingId) {
        this.buildingId = buildingId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    @Override
    public String toString() {
        return this.name;
    }

    public Complex_building complexBuilding(){
        for(Complex_building complexBuilding: MainActivity.db.complex_buildings()){
            if(this.getBuildingId()==complexBuilding.getId())
                return complexBuilding;
        }
        return null;
    }
}
