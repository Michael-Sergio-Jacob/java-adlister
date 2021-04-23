package com.codeup.adlister.dao;

import com.codeup.adlister.models.User;

import java.util.List;

public interface Users {
    User findByUsername(String username);
    Long insert(User user);

    User findById(long id);
    User findByEmail(String email);

    void destroy(long userId);
}
