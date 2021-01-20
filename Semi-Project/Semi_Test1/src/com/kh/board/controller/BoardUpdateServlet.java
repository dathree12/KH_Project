package com.kh.board.controller;

import java.io.IOException;
import java.util.Arrays;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.board.model.service.BoardService;
import com.kh.board.model.vo.Board;


@WebServlet("/board/update")
public class BoardUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
    public BoardUpdateServlet() {
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int boardNo = Integer.parseInt(request.getParameter("boardNo"));
		Board board = new BoardService().getBoard(boardNo);  
		

		request.setAttribute("board", board);				
		request.getRequestDispatcher("/views/board/update.jsp").forward(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		int result = 0;
		String msg = "";
		int boardNo = Integer.parseInt(request.getParameter("boardNo"));
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		String boardImageFile = request.getParameter("boardImageFile");
		String veganlist = request.getParameter("veganlist");
		String situation[] = request.getParameterValues("situation");
		String imagefile1 = request.getParameter("imagefile1");
		String imagefile2 = request.getParameter("imagefile2");
		String imagefile3 = request.getParameter("imagefile3");
		
		String str = Arrays.toString(situation);
		
		Board board = new Board();
		
		board.setBoardNo(boardNo);
		board.setBoardContent(content);
		board.setBoardTitle(title);
		board.setVeganlist(veganlist);
		board.setSituation(str);
		board.setBoardImageFile(boardImageFile);
		board.setImagefile1(imagefile1);
		board.setImagefile2(imagefile2);
		board.setImagefile3(imagefile3);
		
		result = new BoardService().saveBoard(board);
		
		if(result > 0) {
			msg = "성공적으로 수정되었습니다.";
		}else {
			msg = "게시판 수정에 실패하였습니다.";
		}
		
		request.setAttribute("msg", msg);
		request.setAttribute("location", "/board/view?boardNo=" + boardNo);		
		request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
	}

}
