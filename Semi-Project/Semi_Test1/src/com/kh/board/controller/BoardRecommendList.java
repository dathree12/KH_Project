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


@WebServlet("/boardrecommendlist")
public class BoardRecommendList extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
    public BoardRecommendList() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
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
		
		
		list = new BoardService().getBoardRecommendList(info);
		
		
		
		request.setAttribute("list", list);
		request.setAttribute("pageInfo", info);
		request.getRequestDispatcher("/views/board/BoardReco.jsp").forward(request, response);
	}

	
	
}
