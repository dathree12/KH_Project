package com.kh.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/member/logout")
public class MemberLogoutServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
    public MemberLogoutServlet() {
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 로그아웃순서
		//1 . session을 삭제한다.			
		HttpSession session = request.getSession(false); // 현재 세션 객체가 있으면 가져오고 없으면 null을 반환
		
		if (session != null) {
			session.invalidate(); // 세션을 삭제하는 메소드
			System.out.println("Session ID : " + session.getId() + " >> invalidate!");
		}
		
		// 2. 삭제 후 메인화면으로 리다이렉트
		response.sendRedirect(request.getContextPath() + "/");
	}
}
