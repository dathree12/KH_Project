package com.kh.board.model.service;

import static com.kh.common.jdbc.JDBCTemplate.close;
import static com.kh.common.jdbc.JDBCTemplate.commit;
import static com.kh.common.jdbc.JDBCTemplate.getConnection;
import static com.kh.common.jdbc.JDBCTemplate.rollback;


import java.sql.Connection;
import java.util.List;

import com.kh.board.model.dao.BoardDAO;
import com.kh.board.model.vo.Board;
import com.kh.board.model.vo.BoardReply;
import com.kh.board.model.vo.PageInfo;

public class BoardService {

	public int saveBoard(Board board) {
		int result = 0;
		Connection conn = getConnection();
		
		if(board.getBoardNo() != 0) {
			result = new BoardDAO().updateBoard(conn, board);	
		} else {
			result = new BoardDAO().insertBoard(conn, board);			
		}
		
		if (result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}

		close(conn);
		
		return result;
	}

	
	public Board getBoard(int boardNo) {
		int result = 0;
		Connection conn = getConnection();
		Board board = new BoardDAO().findBoardByNo(conn, boardNo);
		
		// 게시글 조회수 증가 로직
		if(board != null) {
			result = new BoardDAO().updateReadCount(conn, board);
			
			if (result > 0) {
				commit(conn);
			} else {
				rollback(conn);
			}
		}		
		
		close(conn);	
		
		return board;
	}
	
	public List<Board> getBoardList(PageInfo info) {
		Connection conn = getConnection();
		
		List<Board> list = new BoardDAO().findAll(conn,info);
		
		close(conn);		
		
		return list;
	}	
	public List<BoardReply> getReplyList(int boardNo) {
		Connection conn = getConnection();
		
		List<BoardReply> replies = new BoardDAO().getReplies(conn, boardNo);
		
		close(conn);		
		
		return replies;
	}
	
	public int saveBoardReply(BoardReply reply) {
		int result = 0;
		Connection conn = getConnection();

		result = new BoardDAO().insertBoardReply(conn, reply);			

		if (result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}

		close(conn);
		
		return result;		
	}
	
	public int deleteBoard(int boardNo) {
		Connection conn = getConnection();
		int result = new BoardDAO().updateBoardStatus(conn, boardNo, "N");
		
		if (result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}

		close(conn);
		
		return result;
	}


	public int deleteReply(int replyNo) {
		Connection conn = getConnection();
		int result = new BoardDAO().updateReplyStatus(conn, replyNo, "N");
		
		if (result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}

		close(conn);
		
		return result;
	}
	

	public int boardRecommend(int boardNo) {
		Connection conn = getConnection();
		Board board = new BoardDAO().findBoardByNo(conn, boardNo);
		
		int result = new BoardDAO().updateBoardRecommend(conn, board);
		
		if (result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}

		close(conn);
		
		return result;
	}
	
	public int getBoardCount() {
		Connection conn = getConnection();
		
		int result = new BoardDAO().getBoardCount(conn);
		
		close(conn);
		
		return result;
	}


	public List<Board> getVegan(String veganlist) {
		Connection conn = getConnection();
		
	
		List<Board> vegan = new BoardDAO().getBoardVegan(conn, veganlist);
		
		close(conn);
		
		return vegan;
	}


	public List<Board> getBoardSearchList(String searchword, String searchoption, PageInfo info) {
		Connection conn = getConnection();
		
		List<Board> list = new BoardDAO().searchRecipe(conn,searchword,searchoption, info);
		
		close(conn);		
		
		return list;
	}


	public List<Board> getBoardRecommendList(PageInfo info) {
		Connection conn = getConnection();
		
		List<Board> list = new BoardDAO().findRecommendlist(conn,info);
		
		close(conn);		
		
		return list;
	}


	public List<Board> getBoardSearchRecoList(String searchword, String searchoption, PageInfo info) {
		Connection conn = getConnection();
		
		List<Board> list = new BoardDAO().searchRecoRecipe(conn,searchword,searchoption, info);
		
		close(conn);		
		
		return list;
	}
	
	public List<Board> getBoardSortList(String veganOption, String situOption, PageInfo info) {
		Connection conn = getConnection();
		
		List<Board> sortlist = new BoardDAO().sortingRecipe(conn,veganOption, situOption, info);
		
		close(conn);		
		
		return sortlist;
	}
	
	
}
	
