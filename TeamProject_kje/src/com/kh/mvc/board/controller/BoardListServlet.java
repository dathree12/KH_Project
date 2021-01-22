package com.kh.mvc.board.controller;

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
		PageInfo info = null;
		List<Board> list = null;
		
		try {
			page = Integer.parseInt(request.getParameter("page"));
		}catch (NumberFormatException e) {
			page = 1;
		}
		
		listCount = new BoardService().getBoardCount();
		info = new PageInfo(page, 10, listCount, 9);
		
		
		list = new BoardService().getBoardList(info);
		
		
		
		request.setAttribute("list", list);
		request.setAttribute("pageInfo", info);
		request.getRequestDispatcher("/views/board/list.jsp").forward(request, response);
	}

}
