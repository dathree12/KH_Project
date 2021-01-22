package com.kh.mvc.ServiceCenter.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.mvc.ServiceCenter.model.service.QnAService;
import com.kh.mvc.ServiceCenter.model.vo.QnA;

@WebServlet("/ServiceCenter/FAQ")
public class FAQListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
    public FAQListServlet() {
    }
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	request.getRequestDispatcher("/views/ServiceCenter/FAQ.jsp").forward(request, response);
	}
}





















