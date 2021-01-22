package com.kh.mvc.ServiceCenter.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.mvc.ServiceCenter.model.service.NoticeService;
import com.kh.mvc.ServiceCenter.model.service.QnAService;
import com.kh.mvc.ServiceCenter.model.vo.NOTICE;
import com.kh.mvc.ServiceCenter.model.vo.QnA;

@WebServlet("/ServiceCenter/Notice/write")
public class NoticeWriteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public NoticeWriteServlet() {
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/views/ServiceCenter/nwrite.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		String NTITLE = request.getParameter("NTITLE");
		int User_Num = Integer.parseInt(request.getParameter("User_Num"));
		String NCONTENT = request.getParameter("NCONTENT");
		
		response.setContentType("text/html; charset=UTF-8");
		
		System.out.println("NTITLE : " + NTITLE + ", User_Num : " + User_Num + ", NCONTENT : " + NCONTENT);
		

		
		
		NOTICE notice = new NOTICE();
		
		notice.setNTITLE(NTITLE);
		notice.setUser_Num(User_Num);
		notice.setNCONTENT(NCONTENT);
		
		int result = new NoticeService().saveNotice(notice);
		String msg = null;
		
		
		if(result > 0) {
			msg = "공지사항 등록 성공";
		} else {
			msg = "공지사항 등록 실패";
		}
		
		request.setAttribute("msg", msg);
		request.setAttribute("location", "/ServiceCenter/Notice");
		request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
	}
}
































