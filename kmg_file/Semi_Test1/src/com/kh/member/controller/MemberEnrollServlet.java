package com.kh.member.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.member.model.service.MemberService;
import com.kh.member.model.vo.Member;

@WebServlet(name="member/enroll", urlPatterns = "/member/enroll")
public class MemberEnrollServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public MemberEnrollServlet() {
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 회원가입 페이지로 전환해주는 기능
		RequestDispatcher dispatcher = request.getRequestDispatcher("/views/common/memberenroll.jsp");
		
		dispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String msg = "";
		String location = "";
		Member member = new Member();

		member.setUserId(request.getParameter("userId"));
		member.setUserPwd(request.getParameter("userPwd"));
		member.setEmail(request.getParameter("userEmail"));
		member.setUserName(request.getParameter("userName"));
		member.setVegType(request.getParameter("vegType"));
		
		System.out.println(member);		
		
		// 전달받은 데이터를 DB에 저장
		int result = new MemberService().enrollMember(member);
		
		// result 결과에 따라 가입 성공여부 메세지를 출력하고 메인화면 또는 회원가입 화면으로 이동
		if (result > 0) {
			msg = "회원가입 성공";			
			location = "/";
		} else {
			msg = "회원가입 실패";			
			location = "/member/enroll";		
		}		
				
		request.setAttribute("msg", msg);			
		request.setAttribute("location", location);		
		
		request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
	}

	
	
	
	
	
	
	
	
	
	
}