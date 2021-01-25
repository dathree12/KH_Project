package com.kh.aboutus;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name="aboutus", urlPatterns = "/aboutus/aboutus")
public class AboutUsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public AboutUsServlet() {
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher dispatcher = request.getRequestDispatcher("/views/aboutus/aboutus.jsp");
		
		dispatcher.forward(request, response);
	}
}
