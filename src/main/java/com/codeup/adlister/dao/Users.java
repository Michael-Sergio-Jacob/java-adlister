package com.codeup.adlister.dao;

import com.codeup.adlister.models.User;

import java.util.List;

public interface Users {
    User findByUsername(String username);
    User findByEmail(String email);
    User findById(long id);

    long insert(User user);

    public void destroy(long userId);
    public void updateEmail(String newEmail, String userId);
    public void updatePassword(String newPassword, String userId);
    public void updateUsername(String newUsername, String userId);


    }

