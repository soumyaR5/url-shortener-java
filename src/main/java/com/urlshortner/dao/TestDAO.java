package com.urlshortner.dao;

public class TestDAO {

    public static void main(String[] args) {

        UrlDAO dao = new UrlDAO();

        dao.incrementClickCount("abc123");

        int count =
                dao.getClickCount("abc123");

        System.out.println("Clicks : " + count);
    }
}