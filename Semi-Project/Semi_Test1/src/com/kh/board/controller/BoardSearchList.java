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
import com.kh.board.model.vo.PageInfo;
import com.kh.board.model.vo.PageSearch;


@WebServlet("/searchrecipe")
public class BoardSearchList extends HttpServlet {
	private static final long serialVersionUID = 1L;
 
    public BoardSearchList() {
        super();
       
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String searchword = request.getParameter("searchword");
		String searchoption = request.getParameter("search_sort");
		int page= 0;
		int listCount = 0;
		PageInfo info = null;
		PageSearch search = null;
		List<Board> list = null;
		
	
		
		try {
			page = Integer.parseInt(request.getParameter("page"));
		} catch (NumberFormatException e) {
			page = 1;
		}
		
		listCount = new BoardService().getBoardCount();
		info = new PageInfo(page, 10, listCount, 9);
		search = new PageSearch(searchword, searchoption);
		Board board = new Board();
		list = new BoardService().getBoardSearchList(searchword, searchoption,info);		
		
		System.out.println("=" + list);
		
		request.setAttribute("list", list);
		request.setAttribute("pageInfo", info);
		request.setAttribute("pageSearch", search);
		request.getRequestDispatcher("/views/board/BoardSearch.jsp").forward(request, response);
	}
	


}