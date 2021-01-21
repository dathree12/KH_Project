package com.kh.member.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.member.model.service.MemberService;
import com.kh.member.model.vo.Member;

@WebServlet(name = "login", urlPatterns = "/login")
public class MemberLoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public MemberLoginServlet() {
    }

    @Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userId = request.getParameter("userId");
		String userPwd = request.getParameter("userPwd");
		Member member = null;
		
		System.out.println("userID : " + userId + ", userPwd : " + userPwd);
		
		member = new MemberService().login(userId, userPwd);
		
		System.out.println(member);
		
		// member가 null이면 로그인 실패
		// member가 null이 아니면 로그인 성공
		if(member != null) {
			// 로그인에 대한 member 객체를 session 객체에 보관한다.
			HttpSession session = request.getSession(); 
			
			session.setAttribute("loginMember", member);
			
			System.out.println("Session ID : " + session.getId());
			
			// 로그인이 완료되면 메인화면으로 이동시킨다.
			response.sendRedirect(request.getContextPath() + "/");
		} else {
			// 로그인 실패
			// 로그인 실패에 대한 메세지 띄워주고 메인화면으로 이동
			
			// 1. 공용으로 사용하는 에러 메시지 출력 페이지에 전달해줄 메세지와 이동할 페이지를 request 객체에 저장한다.
			request.setAttribute("msg", "아이디나 비밀번호가 일치하지 않습니다.");
			request.setAttribute("location", "/");
			
			// 2. request 객체의 데이터를 유지해서 페이지를 넘기기위해 RequestDispatcher를 이용해서 페이지 전환(forward)
			RequestDispatcher dispatcher = request.getRequestDispatcher("/views/common/msg.jsp");
			
			dispatcher.forward(request, response);
		}
	}
}
