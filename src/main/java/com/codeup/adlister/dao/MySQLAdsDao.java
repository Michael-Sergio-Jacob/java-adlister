package com.codeup.adlister.dao;
import com.codeup.adlister.models.Ad;
import com.codeup.adlister.models.User;
import com.mysql.cj.jdbc.Driver;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class MySQLAdsDao implements Ads {
    private Connection connection = null;
    public MySQLAdsDao(Config config) {
        try {
            DriverManager.registerDriver(new Driver());
            connection = DriverManager.getConnection(
                    config.getUrl(),
                    config.getUser(),
                    config.getPassword()
            );
        } catch (SQLException e) {
            throw new RuntimeException("Error connecting to the database!", e);
        }
    }
    // Finds all Ads
    @Override
    public List<Ad> all() {
        PreparedStatement stmt = null;
        try {
            stmt = connection.prepareStatement("SELECT * FROM dishes");
            ResultSet rs = stmt.executeQuery();
            return createAdsFromResults(rs);
        } catch (SQLException e) {
            throw new RuntimeException("Error retrieving all ads.", e);
        }
    }

    //Finds ads for 1 User
    @Override
    public List<Ad> allForUser(User user) {
        PreparedStatement stmt = null;
        try {
            stmt = connection.prepareStatement("SELECT * FROM dishes WHERE user_id = ?");
            stmt.setLong(1, user.getId());
            ResultSet rs = stmt.executeQuery();
            return createAdsFromResults(rs);
        } catch (SQLException e) {
            throw new RuntimeException("Error retrieving all ads.", e);
        }
    }

    @Override
    public void deleteAd(Ad ad) {
        PreparedStatement stmt;
    }
    public long delete(Long id) {
        try {
            String deleteQuery = "DELETE FROM dishes WHERE id = ?";
            PreparedStatement ps = connection.prepareStatement(deleteQuery);
            ps.setLong(1, id);
            ps.executeUpdate();
            return 2L;
        } catch (SQLException e) {
            throw new RuntimeException("Error deleting ad", e);
        }
    }

    @Override
    public Ad getAdById(long id) {
        Ad ad = null;
        try {
            PreparedStatement stmt = connection.prepareStatement("SELECT * FROM dishes WHERE id = ?");
            stmt.setLong(1, id);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                ad = new Ad(
                        rs.getLong("id"),
                        rs.getLong("user_id"),
                        rs.getString("dish_name"),
                        rs.getString("ingredients"),
                        rs.getString("diet_type"),
                        rs.getInt("caloric_content"),
                        rs.getString("description")
                );
            }
        } catch (SQLException e) {
            throw new RuntimeException("Error getting Ad id", e);
        }
        return ad;
    }

    //Insert new Ad
    @Override
    public long insert(Ad ad) {
        try {
            String insertQuery = "INSERT INTO dishes(user_id, dish_name, ingredients, diet_type, caloric_content, description) VALUES (?, ?, ?, ?, ?, ?)";
            PreparedStatement stmt = connection.prepareStatement(insertQuery, Statement.RETURN_GENERATED_KEYS);
            stmt.setLong(1, ad.getUserId());
            stmt.setString(2, ad.getDish_name());
            stmt.setString(3, ad.getIngredients());
            stmt.setString(4, ad.getDiet_type());
            stmt.setInt(5, ad.getCaloric_content());
            stmt.setString(6, ad.getDescription());
            stmt.executeUpdate();
            ResultSet rs = stmt.getGeneratedKeys();
            rs.next();
            return rs.getLong(1);
        } catch (SQLException e) {
            throw new RuntimeException("Error creating a new ad.", e);
        }
    }

    //Find Ad by Title
    @Override
    public List<Ad> findByTitle(String searched_ad) {
        String query = "SELECT * FROM dishes WHERE dish_name like ?";
        try {
            PreparedStatement stmt = connection.prepareStatement(query);
            stmt.setString(1, searched_ad);
            return createAdsFromResults(stmt.executeQuery());
        } catch (SQLException e) {
            throw new RuntimeException("Error finding a Ad by Title", e);
        }
    }

    // Find add by Title
    public Ad findById(long id) {
        String query = String.format("SELECT * FROM dishes WHERE id = %d", id);
        try {
            Statement stmt = connection.createStatement();
            ResultSet rs = stmt.executeQuery(query);
            if(rs.next()){
                return extractAd(rs);
            }
            return null;
        } catch (SQLException e) {
            throw new RuntimeException("Error retrieving all ads.", e);
        }
    }

    //Edit 1 Ad
    public void editAd(String newDish, String newIngredients, String newDiet, int newCalorie, String newDescription, long id){
        String editQuery = "UPDATE dishes SET dish_name = ?, ingredients = ?, diet_type = ?, caloric_content = ?, description = ? WHERE id = ?";
        PreparedStatement ps = null;
        try {
            ps = connection.prepareStatement(editQuery, Statement.RETURN_GENERATED_KEYS);
            ps.setString(1, newDish);
            ps.setString(2, newIngredients);
            ps.setString(3, newDiet);
            ps.setInt(4, newCalorie);
            ps.setString(5, newDescription);
            ps.setLong(6, id);
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
            throw new RuntimeException("Error updating ad");
        }
    }

    private Ad extractAd(ResultSet rs) throws SQLException {
        return new Ad(
                rs.getLong("id"),
                rs.getLong("user_id"),
                rs.getString("dish_name"),
                rs.getString("ingredients"),
                rs.getString("diet_type"),
                rs.getInt("caloric_content"),
                rs.getString("description")
        );
    }

    private List<Ad> createAdsFromResults(ResultSet rs) throws SQLException {
        List<Ad> ads = new ArrayList<>();
        while (rs.next()) {
            ads.add(extractAd(rs));
        }
        return ads;
    }
}