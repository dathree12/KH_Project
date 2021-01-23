package com.kh.ServiceCenter.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.ServiceCenter.model.service.NoticeService;
import com.kh.ServiceCenter.model.service.NoticeService;
import com.kh.ServiceCenter.model.vo.NOTICE;
import com.kh.ServiceCenter.model.vo.NOTICE;

@WebServlet("/ServiceCenter/Notice/view")
public class NoticeViewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public NoticeViewServlet() {
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int NNUM = Integer.parseInt(request.getParameter("NNUM"));
		NOTICE notice = null;
		
				Cookie[] cookies = request.getCookies();
				String noticeHistory = "";
				boolean hasRead = false;
				
				if(cookies != null) {
					String name = null;
					String value = null;
					
					for(Cookie cookie : cookies) {
						name = cookie.getName();
						value = cookie.getValue();
						
						if("noticeHistory".equals(name)) {
							noticeHistory = value;
							if(value.contains("|" + NNUM + "|")) {
								
								hasRead = true;
								 
								break;
							}
						}
					}
				}
				
				
				if(!hasRead) {
					Cookie cookie = new Cookie("noticeHistory", noticeHistory + "|" + NNUM + "|");
					
					cookie.setMaxAge(-1);
					response.addCookie(cookie);
				}
				
				notice = new NoticeService().getNotice(NNUM, hasRead);
				
				System.out.println("NoticeViewServlet-notice : " + notice);
				
				request.setAttribute("notice", notice);				
				request.getRequestDispatcher("/views/ServiceCenter/nview.jsp").forward(request, response);
	}
}




























