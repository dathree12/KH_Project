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
		System.out.println('=' + request.getParameter("boardNo"));
		System.out.println('=' + request.getParameter("vegan"));
		
		int boardNo = Integer.parseInt(request.getParameter("boardNo"));
		String veganlist = request.getParameter("vegan"); 
		
		Board board = null;
		List<BoardReply> replies = null;
		List<Board> vegan = null;

		board = new BoardService().getBoard(boardNo);
		replies = new BoardService().getReplyList(boardNo);
		vegan = new BoardService().getVegan(veganlist);
		
		
		request.setAttribute("board", board);				
		request.setAttribute("replies", replies);		
		request.setAttribute("vegan", vegan);		
		request.getRequestDispatcher("/views/board/read.jsp").forward(request, response);
	}

}