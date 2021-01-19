package com.kh.vef.member.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.vef.member.model.service.MemberService;
import com.kh.vef.member.model.vo.Member;

@WebServlet("/mypage/update")
public class MemberUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public MemberUpdateServlet() {
    }
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userId = request.getParameter("userId");
		Member member = new MemberService().findMemberById(userId);
		
		request.setAttribute("member", member);
		request.getRequestDispatcher("/views/mypage/mypageupdate.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 클라이언트가 보낸값 받아오기
		String msg = "";
		int result = 0;
		Member member = new Member();
		
		member.setUserName(request.getParameter("userName"));
		member.setEmail(request.getParameter("userEmail"));
		member.setVegType(request.getParameter("vegType"));
		member.setUserId(request.getParameter("userId"));
		
		System.out.println(member);	
		
		result = new MemberService().updateMember(member);
		
		if(result > 0) {
			msg = "성공적으로 수정되었습니다.";
		} else {
			msg = "회원정보 수정에 실패했습니다.";
		}
		
		request.setAttribute("msg", msg);
		request.setAttribute("location", "/");
		request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
	}
}
