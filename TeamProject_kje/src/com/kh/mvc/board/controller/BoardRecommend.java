package com.kh.mvc.board.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.board.model.service.BoardService;
import com.kh.board.model.vo.Board;
import com.kh.board.model.vo.BoardReply;


@WebServlet("/board/recommend")
public class BoardRecommend extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public BoardRecommend() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String msg = "";
		int boardNo = Integer.parseInt(request.getParameter("boardNo"));
		int result = new BoardService().boardRecommend(boardNo);
			
		if(result > 0) {
			msg = "추천하였습니다";			
			
		} else {
			msg = "추천 실패";			
		}
		
		request.setAttribute("msg", msg);
		request.setAttribute("location", "/board/view?boardNo=" + boardNo);		
		request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);		
	}

	

}
