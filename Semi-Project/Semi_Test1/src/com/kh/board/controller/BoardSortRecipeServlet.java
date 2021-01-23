package com.kh.board.controller;

import java.io.IOException;
import java.util.Arrays;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.board.model.service.BoardService;
import com.kh.board.model.vo.Board;
import com.kh.board.model.vo.PageInfo;

@WebServlet("/recipesorting")
public class BoardSortRecipeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public BoardSortRecipeServlet() {
        super();

    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String []veganOptions = request.getParameterValues("vgsort");
		String []situOptions = request.getParameterValues("situsort");
		String veganOption = "";
		String situOption = "";
		
		
		int i = 0;
		int j = 0;
		if(veganOptions != null) {
			while(i < veganOptions.length -1) {
				veganOption += "'"+veganOptions[i]+"', ";
				i++;
			} 
			if(i == veganOptions.length -1) {
				veganOption += "'"+veganOptions[i]+"'";
			}
		}
		if(situOptions != null) {
			while(j < situOptions.length -1) {
				situOption += "'"+situOptions[j]+"', ";
				j++;
			}  
			if(j == situOptions.length -1) {
				situOption += "'"+situOptions[j]+"'";
			}
		};		
		System.out.println(veganOption + "이랑" + situOption);

		int page= 0;
		int listCount = 0;
		PageInfo info = null;

		List<Board> sortlist = null;
		
		try {
			page = Integer.parseInt(request.getParameter("page"));
		} catch (NumberFormatException e) {
			page = 1;
		}
	
		listCount = new BoardService().getBoardCount();
		info = new PageInfo(page, 10, listCount, 9);

		Board board = new Board();
		sortlist = new BoardService().getBoardSortList(veganOption, situOption, info);		
		
		System.out.println("=" + sortlist);
		
		request.setAttribute("sortlist", sortlist);
		request.setAttribute("pageInfo", info);

		request.getRequestDispatcher("/views/board/BoardSorting.jsp").forward(request, response);
	}


}