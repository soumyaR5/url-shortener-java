package com.urlshortner.dao;

import com.urlshortner.model.url;
import com.urlshortner.util.DBConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class UrlDAO {

    // Save URL
    public boolean saveUrl(url Url) {

        String query =
                "INSERT INTO urls(original_url, short_code) VALUES (?, ?)";

        try {

            Connection con = DBConnection.getConnection();

            PreparedStatement ps =
                    con.prepareStatement(query);

            ps.setString(1, Url.getOriginalUrl());
            ps.setString(2, Url.getShortCode());

            int rows = ps.executeUpdate();

            return rows > 0;

        } catch (Exception e) {

            e.printStackTrace();
        }

        return false;
    }

    // Get original URL from short code
    public String getOriginalUrl(String shortCode) {

        String query =
                "SELECT original_url FROM urls WHERE short_code=?";

        try {

            Connection con = DBConnection.getConnection();

            PreparedStatement ps =
                    con.prepareStatement(query);

            ps.setString(1, shortCode);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {

                return rs.getString("original_url");
            }

        } catch (Exception e) {

            e.printStackTrace();
        }

        return null;
    }

    public String getShortCodeByUrl(String orignalCode)
    {
        String query = "SELECT short_code FROM urls WHERE original_url = ?";
        try{
            Connection con = DBConnection.getConnection();
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1,orignalCode);
            ResultSet rs = ps.executeQuery();
            if(rs.next())
            {
                return rs.getString("short_code");
            }
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
        return null;
    }
    
    public int getClickCount(String shortCode) 
    {
        String query = "SELECT click_count FROM urls WHERE short_code=?";

        try {

            Connection con = DBConnection.getConnection();

            PreparedStatement ps = con.prepareStatement(query);

            ps.setString(1, shortCode);

            ResultSet rs = ps.executeQuery();

            if(rs.next()) {

                return rs.getInt("click_count");
            }

        } 
        catch(Exception e) {

            e.printStackTrace();
        }

        return 0;
    }
    
    public void incrementClickCount(String shortCode) 
    {
        String query = "UPDATE urls SET click_count = click_count + 1 WHERE short_code=?";
        try 
        {
            Connection con = DBConnection.getConnection();

            PreparedStatement ps = con.prepareStatement(query);

            ps.setString(1, shortCode);

            ps.executeUpdate();

        } 
        catch (Exception e) {

            e.printStackTrace();
        }
    }
    public url getUrlDetails(String shortCode)
    {
        String query =
            "SELECT original_url, short_code " +
            "FROM urls WHERE short_code = ?";

        try
        {
            Connection con = DBConnection.getConnection();

            PreparedStatement ps = con.prepareStatement(query);

            ps.setString(1, shortCode);

            ResultSet rs = ps.executeQuery();

            if(rs.next())
            {
                url Url = new url();

                Url.setOriginalUrl(
                    rs.getString("original_url")
                );

                Url.setShortCode(
                    rs.getString("short_code"));

                return Url;
            }
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }

        return null;
    }
}