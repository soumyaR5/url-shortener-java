package com.urlshortner.controller;

import com.urlshortner.dao.UrlDAO;
import com.urlshortner.model.url;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;

@WebServlet("/stats")
public class StatsServlet extends HttpServlet
{
    @Override
    protected void doGet(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException
    {
        String code =
                request.getParameter("code");

        UrlDAO dao =
                new UrlDAO();

        url Url =
                dao.getUrlDetails(code);

        request.setAttribute(
                "url",
                Url
        );

        request.getRequestDispatcher(
                "stats.jsp"
        ).forward(
                request,
                response
        );
    }
}