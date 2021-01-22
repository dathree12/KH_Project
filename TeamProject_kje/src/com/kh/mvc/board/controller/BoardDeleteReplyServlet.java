package com.kh.mvc.board.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.board.model.service.BoardService;


@WebServlet("/board/deletereply")
public class BoardDeleteReplyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	  
    public BoardDeleteReplyServlet() {

    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String msg = "";
		int replyNo = Integer.parseInt(request.getParameter("replyNo"));
		int result = new BoardService().deleteReply(replyNo);
		
		if(result>0) {
			msg = "정상적으로 삭제되었습니다.";
		}else {
			msg = "삭제가 실패하였습니다.";
		}
		
		request.setAttribute("msg", msg);
		request.setAttribute("location", "/board/list");		
		request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
	}

}
