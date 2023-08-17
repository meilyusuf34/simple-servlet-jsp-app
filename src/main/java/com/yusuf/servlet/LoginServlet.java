package com.yusuf.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private static final String username = "akhsan";
    private static final String password = "yusuf";

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String pusername = request.getParameter("username");
        String ppassword = request.getParameter("password");
        if (username.equals(pusername) && password.equals(ppassword)) {
            response.getWriter().write("success");
        } else {
            response.getWriter().write("failure");
        }
    }
}
