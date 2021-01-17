package com.kh.board.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.board.model.service.BoardService;
import com.kh.board.model.vo.Board;
import com.kh.board.model.vo.BoardReply;

@WebServlet("/board/view")
public class BoardViewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public BoardViewServlet() {
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int boardNo = Integer.parseInt(request.getParameter("boardNo"));
		Board board = null;
		List<BoardReply> replies = null;
		
		// 새로고침시 조회수가 증가하는 것을 방지하는 로직 
		// 쿠키에 조회한 내용을 기록하여 한 번 조회하면 그 뒤에는 조회수가 올라가지 않게 설정
		// 1. 쿠키에 조회한 이력이 있는 지 확인

		board = new BoardService().getBoard(boardNo);
		replies = new BoardService().getReplyList(boardNo);
		
		request.setAttribute("board", board);				
		request.setAttribute("replies", replies);				
		request.getRequestDispatcher("/views/common/read.jsp").forward(request, response);
	}

}