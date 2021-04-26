package com.codeup.adlister.models;

public class Ad {
    private long id;
    private long userId;
    private String dish_name;
    private String ingredients;
    private String diet_type;
    private int caloric_content;
    private String description;

    public Ad(long id, long userId, String dish_name, String ingredients, String diet_type, int caloric_content, String description) {
        this.id = id;
        this.userId = userId;
        this.dish_name = dish_name;
        this.ingredients = ingredients;
        this.diet_type = diet_type;
        this.caloric_content = caloric_content;
        this.description = description;
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public long getUserId() {
        return userId;
    }

    public void setUserId(long userId) {
        this.userId = userId;
    }

    public String getDish_name() {
        return dish_name;
    }

    public void setDish_name(String title) {
        this.dish_name = title;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getIngredients() {
        return ingredients;
    }

    public void setIngredients(String ingredients) {
        this.ingredients = ingredients;
    }

    public String getDiet_type() {
        return diet_type;
    }

    public void setDiet_type(String diet_type) {
        this.diet_type = diet_type;
    }

    public int getCaloric_content() {
        return caloric_content;
    }

    public void setCaloric_content(int caloric_content) {
        this.caloric_content = caloric_content;
    }
}
