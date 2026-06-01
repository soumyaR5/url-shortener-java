package com.urlshortner.controller;

import com.urlshortner.dao.UrlDAO;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;

@WebServlet("/r/*")
public class RedirectServlet extends HttpServlet {

    @Override
    protected void doGet(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        String shortCode =
                request.getPathInfo();

        if(shortCode == null ||
           shortCode.equals("/")) {

            response.sendRedirect(
                    request.getContextPath()
                    + "/index.jsp");

            return;
        }

        shortCode = shortCode.substring(1);

        System.out.println("Requested Path: " + request.getPathInfo());
        System.out.println("Short Code: " + shortCode);

        UrlDAO dao = new UrlDAO();

        String originalUrl = dao.getOriginalUrl(shortCode);

        System.out.println("Original URL: " + originalUrl);

        if(originalUrl != null) 
        {
            dao.incrementClickCount(shortCode);
            response.sendRedirect(originalUrl);
        } 
        else 
        {
            response.getWriter().println("URL Not Found");
        }
    }
}