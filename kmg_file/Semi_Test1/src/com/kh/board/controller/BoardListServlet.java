package com.kh.board.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.board.model.service.BoardService;
import com.kh.board.model.vo.Board;
import com.kh.board.model.vo.PageInfo;

@WebServlet("/board/list")
public class BoardListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public BoardListServlet() {
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO 1. 게시물 리스트 불러오기 
		// TODO 2. 페이징 처리
		
		int page = 0;
		int listCount = 0;
		List<Board> list = null;
		
		
		
		list = new BoardService().getBoardList();
		
		request.setAttribute("list", list);
		request.getRequestDispatcher("/views/common/list.jsp").forward(request, response);
	}

}
