package com.kh.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.common.util.EncryptUtil;
import com.kh.member.model.service.MemberService;

@WebServlet(name="delete", urlPatterns = "/mypage/delete")
public class MemberDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public MemberDeleteServlet() {
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/views/mypage/mypagedelete.jsp").forward(request, response);
	}
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userId = request.getParameter("userId");
		String userPwd = request.getParameter("userPwd");
		String salt = new MemberService().getSalt(userId);
		String stretchPwd = EncryptUtil.oneWayEnc(userPwd, salt);
		String encPwd = EncryptUtil.oneWayEnc(stretchPwd, salt);
		String msg = "정상적으로 탈퇴되었습니다.";
		String loc = "/member/logout";
		int result = new MemberService().deleteMember(userId, encPwd);
		
		if(result <= 0) {
			msg = "탈퇴에 실패하였습니다.";
			loc = "/mypage/delete";
		}
		
		request.setAttribute("msg", msg);
		request.setAttribute("location", loc);
		request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
	}
}
