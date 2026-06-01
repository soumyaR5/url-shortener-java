package com.urlshortner.controller;

import com.urlshortner.dao.UrlDAO;
import com.urlshortner.model.url;
import com.urlshortner.util.ShortCodeGenerator;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;

@WebServlet("/shorten")
public class UrlServlet extends HttpServlet 
{

    @Override
    protected void doPost(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException 
        {

        String originalUrl = request.getParameter("originalUrl");

        try {

             java.net.URL url = new java.net.URL(originalUrl);

             String host = url.getHost();

             if(host == null || !host.contains(".")) 
             {
                throw new Exception();
              }

        } catch(Exception e) 
        {

            request.setAttribute(
                "error",
                "Please enter a valid URL"
            );

            request.getRequestDispatcher(
                    "index.jsp"
            ).forward(
                request,
                response
            );

            return;
        }
        UrlDAO dao = new UrlDAO();

        String shortCode = dao.getShortCodeByUrl(originalUrl);

        if(shortCode == null) 
        {

             shortCode = ShortCodeGenerator.generateCode();

             url Url = new url(originalUrl, shortCode);

             dao.saveUrl(Url);
        }
 
             String shortUrl = request.getScheme() 
                + "://" 
                + request.getServerName()
                + ":"
                + request.getServerPort()
                + request.getContextPath()
                + "/r/"
                + shortCode;

             request.setAttribute(
                "shortUrl",
                shortUrl
             );

             request.getRequestDispatcher(
                "result.jsp"
             ).forward(
                request,
                response
             );
        }
}
