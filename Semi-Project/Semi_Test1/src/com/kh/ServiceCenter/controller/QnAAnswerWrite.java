package com.kh.ServiceCenter.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.ServiceCenter.model.service.QnAService;
import com.kh.ServiceCenter.model.vo.QnA;

@WebServlet("/ServiceCenter/Q&A/answer/write")
public class QnAAnswerWrite extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public QnAAnswerWrite() {
    }
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int Que_Num = Integer.parseInt(request.getParameter("Que_Num"));
		QnA qna = null;
		
		// 새로고침시 조회수가 증가하는 것을 방지하는 로직 
				// 쿠키에 조회한 내용을 기록하여 한 번 조회하면 그 뒤에는 조회수가 올라가지 않게 설정
				// 1. 쿠키에 조회한 이력이 있는 지 확인
				Cookie[] cookies = request.getCookies();
				String qnaHistory = ""; //이력을 저장하는 변수
				boolean hasRead = false; //읽은 글이면 true, 안 읽었으면 false
				
				if(cookies != null) {
					String name = null;
					String value = null;
					
					for(Cookie cookie : cookies) {
						name = cookie.getName();
						value = cookie.getValue();
						
						if("qnaHistory".equals(name)) {
							qnaHistory = value;
							if(value.contains("|" + Que_Num + "|")) {
								
								hasRead = true;
								 
								break;
							}
						}
					}
				}
				
				
				if(!hasRead) {
					Cookie cookie = new Cookie("qnaHistory", qnaHistory + "|" + Que_Num + "|");
					
					cookie.setMaxAge(-1);
					response.addCookie(cookie);
				}
				
				qna = new QnAService().getQnA(Que_Num, hasRead);
				
				request.setAttribute("qna", qna);				
		
		request.getRequestDispatcher("/views/ServiceCenter/awrite.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		String Que_Title = request.getParameter("Que_Title");
		int User_Num = Integer.parseInt(request.getParameter("User_Num"));
		String Que_Content = request.getParameter("Que_Content");
		String QGROUP = request.getParameter("QGROUP");
		String STEP = request.getParameter("STEP");
		
		response.setContentType("text/html; charset=UTF-8");
		
		System.out.println("Que_Title : " + Que_Title + ", User_Num : " + User_Num + ", Que_Content : " + Que_Content);
		

		
		
		QnA qna = new QnA();
		
		qna.setQue_Title(Que_Title);
		qna.setUser_Num(User_Num);
		qna.setQue_Content(Que_Content);
		qna.setQGROUP(Integer.parseInt(QGROUP));
		qna.setSTEP(Integer.parseInt(STEP));
		
		int result = new QnAService().saveQnAAnswer(qna);
		String msg = null;
		
		
		if(result > 0) {
			msg = "Q&A답변 등록 성공";
		} else {
			msg = "Q&A답변 등록 실패";
		}
		
		System.out.println("Que_Title : " + Que_Title + ", User_Num : " + User_Num + ", Que_Content : " + Que_Content + ", QGROUP : " + QGROUP);
		
		request.setAttribute("msg", msg);
		request.setAttribute("location", "/ServiceCenter/Q&A");
		request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
		
	}

}


























