package com.kh.board.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.board.model.service.BoardService;
import com.kh.board.model.vo.BoardReply;
import com.kh.member.model.vo.Member;


@WebServlet("/board/reply")
public class BoardReplyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public BoardReplyServlet() {
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String msg = "";
		request.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession(false);
		Member loginMember = session != null? (Member)session.getAttribute("loginMember") : null;
		
		int boardNo = Integer.parseInt(request.getParameter("boardNo"));
		String content = request.getParameter("content");
		String writer = request.getParameter("writer");
		
				
		if(loginMember != null) {
			if(loginMember.getUserId().equals(writer)) {
			BoardReply reply = new BoardReply();			
			
			reply.setBoardNo(boardNo);
			reply.setReplyContent(content);
			reply.setReplyWriterNo(loginMember.getUserNum());
			
			int result = new BoardService().saveBoardReply(reply);
			
				if(result > 0) {
					msg = "댓글 등록 성공";			
					
				} else {
					msg = "댓글 등록 실패";			
				}
			}else {
				msg = "본인은 작성이 불가능합니다..";
			}	
		}else {
			msg = "로그인 진행 후 작성해주세요. ";
		}
				
			
		request.setAttribute("msg", msg);
		request.setAttribute("location", "/board/view?boardNo=" + boardNo);		
		request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);		
	}
}