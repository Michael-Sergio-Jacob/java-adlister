package com.codeup.adlister.dao;

import com.codeup.adlister.models.Ad;
import com.codeup.adlister.models.User;

import java.util.List;

public interface Ads {
    // get a list of all the ads
    List<Ad> all();

    // insert a new ad and return the new ad's id
    long insert(Ad ad);

    // find ad by title
    List<Ad> findByTitle(String searched_ad);

    // find ad by id
    Ad findById(long id);

    // edit ad
    void editAd(String newDish, String newIngredients, String newDiet, int newCalorie, String description, Long newId);

    List<Ad> allForUser(User user);

    // delete ad servlet
    Ad getAdById(long id);
    void deleteAd(Ad ad);
    long delete(Long adId);
    
}