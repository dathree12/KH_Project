package com.kh.ServiceCenter.controller;


import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet(name="service", urlPatterns = "/service")
public class serviceMain extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public serviceMain() {
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 회원가입 페이지로 전환해주는 기능
		RequestDispatcher dispatcher = request.getRequestDispatcher("/views/ServiceCenter/serviceMain.jsp");
		
		dispatcher.forward(request, response);
	}
}