package com.kh.aboutus;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name="intro", urlPatterns = "/aboutus/intro")
public class IntroServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public IntroServlet() {
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher dispatcher = request.getRequestDispatcher("/views/aboutus/intro.jsp");
		
		dispatcher.forward(request, response);
	}
}
