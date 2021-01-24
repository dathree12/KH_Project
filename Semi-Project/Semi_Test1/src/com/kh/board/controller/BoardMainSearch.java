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
import com.kh.board.model.vo.MainSearch;
import com.kh.board.model.vo.PageInfo;
import com.kh.board.model.vo.PageSearch;

@WebServlet("/mainsearch")
public class BoardMainSearch extends HttpServlet {
	private static final long serialVersionUID = 1L;
 
    public BoardMainSearch() {
       
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String search1 = request.getParameter("search");
		int page = 0;
		int listCount = 0;
		PageInfo info = null;
		MainSearch search = null;
		List<Board> list = null;
		
		try {
			page = Integer.parseInt(request.getParameter("page"));
		} catch (NumberFormatException e) {
			page = 1;
		}
		
		listCount = new BoardService().getBoardCount();
		info = new PageInfo(page, 10, listCount, 9);
		search = new MainSearch(search1);
		Board board = new Board();
		list = new BoardService().getMainSearch(search1,info);		
		
		System.out.println("=" + list);
		
		request.setAttribute("list", list);
		request.setAttribute("pageInfo", info);
		request.setAttribute("mainSearch", search);
		request.getRequestDispatcher("/views/board/MainSearch.jsp").forward(request, response);
	}

}
