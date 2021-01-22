package com.kh.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.common.util.EncryptUtil;
import com.kh.member.model.service.MemberService;

@WebServlet(name="updatePwd", urlPatterns = "/mypage/updatepwd")
public class MemberUpdatePwdServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public MemberUpdatePwdServlet() {
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/views/mypage/mypageupdatepwd.jsp").forward(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userId = request.getParameter("userId");
		String userPwd = request.getParameter("userPwd");
		String newPwd = request.getParameter("newPwd");
		String msg = "비밀번호가 정상적으로 변경되었습니다.";
		String loc = "/";
		String salt = new MemberService().getSalt(userId);
		String stretchPwd = EncryptUtil.oneWayEnc(userPwd, salt);
		String encPwd = EncryptUtil.oneWayEnc(stretchPwd, salt);
		String stretchNewPwd = EncryptUtil.oneWayEnc(newPwd, salt);
		String encNewPwd = EncryptUtil.oneWayEnc(stretchNewPwd, salt);
		
		int result = new MemberService().updatePassword(userId, encPwd, encNewPwd);
		
		if(result <= 0) {
			msg = "비밀번호 변경에 실패했습니다.";
			loc= "/member/updatePwd?userId=" + userId;
		}
		
		request.setAttribute("msg", msg);
		request.setAttribute("location", loc);
		request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
	}
}