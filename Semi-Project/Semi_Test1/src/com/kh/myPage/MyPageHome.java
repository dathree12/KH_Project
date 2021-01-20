package com.kh.myPage;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet(name = "mypagehome", urlPatterns = "/mypage/mypagehome")
public class MyPageHome extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public MyPageHome() {
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher dispatcher = request.getRequestDispatcher("/views/mypage/mypagehome.jsp");
		
		dispatcher.forward(request, response);
	}

}