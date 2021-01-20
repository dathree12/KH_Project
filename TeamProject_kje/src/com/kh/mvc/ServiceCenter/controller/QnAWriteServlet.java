package com.kh.mvc.ServiceCenter.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.mvc.ServiceCenter.model.service.QnAService;
import com.kh.mvc.ServiceCenter.model.vo.QnA;

@WebServlet("/ServiceCenter/Q&A/write")
public class QnAWriteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public QnAWriteServlet() {
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/views/ServiceCenter/write.jsp").forward(request, response);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
//		if(!ServletFileUpload.isMultipartContent(request)) {
//			request.setAttribute("msg", "관리자에게 문의하세요.");
//			request.setAttribute("location", "/board/list");
//			request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
//			
//			return;
//		}
//		
//		String path = getServletContext().getRealPath("/upload");
//		
//		int maxSize = 1024 *1024 * 10;
//		
//		String encoding = "UTF-8";
//		
//		MultipartRequest mr = new MultipartRequest(request, path, maxSize, encoding, new DefaultFileRenamePolicy());
//		
//		String title = mr.getParameter("title");
//		String writer = mr.getParameter("writer");
//		String content = mr.getParameter("content");
//		
//		System.out.println("title : " + title + ", writer : " + writer + ", content : " + content);
		
		request.setCharacterEncoding("UTF-8");
		
		String Que_Title = request.getParameter("Que_Title");
		int User_Num = Integer.parseInt(request.getParameter("User_Num"));
		String Que_Content = request.getParameter("Que_Content");
		
		response.setContentType("text/html; charset=UTF-8");
		
		System.out.println("Que_Title : " + Que_Title + ", User_Num : " + User_Num + ", Que_Content : " + Que_Content);
		

		
		
		QnA qna = new QnA();
		
		qna.setQue_Title(Que_Title);
		qna.setUser_Num(User_Num);
		qna.setQue_Content(Que_Content);
		
		int result = new QnAService().saveQnA(qna);
		String msg = null;
		
		
		if(result > 0) {
			msg = "Q&A 등록 성공";
		} else {
			msg = "Q&A 등록 실패";
		}
		
		request.setAttribute("msg", msg);
		request.setAttribute("location", "/ServiceCenter/Q&A");
		request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
	}

}

























