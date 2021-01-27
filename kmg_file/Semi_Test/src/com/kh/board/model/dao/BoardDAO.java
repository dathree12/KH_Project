package com.kh.board.model.dao;

import static com.kh.common.jdbc.JDBCTemplate.close;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.kh.board.model.vo.Board;
import com.kh.board.model.vo.BoardReply;
import com.kh.board.model.vo.PageInfo;

public class BoardDAO {

	public int insertBoard(Connection conn, Board board) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		try {
			pstmt = conn.prepareStatement(
					"INSERT INTO BOARD VALUES(SEQ_BOARD_NO.NEXTVAL,?,?,?,DEFAULT,DEFAULT,?,?,DEFAULT,DEFAULT, ?, ?, ?, ?, DEFAULT)");
			
			pstmt.setString(1, board.getBoardTitle());
			pstmt.setString(2, board.getBoardContent());
			pstmt.setString(3, board.getBoardImageFile());
			pstmt.setString(4, board.getVeganlist());
			pstmt.setString(5, board.getSituation());
			pstmt.setString(6, board.getImagefile1());
			pstmt.setString(7, board.getImagefile2());
			pstmt.setString(8, board.getImagefile3());
			pstmt.setInt(9, board.getBoardWriteNo());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}		
		
		return result;
	}
	
	public int updateBoard(Connection conn, Board board) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		try {
			pstmt = conn.prepareStatement("UPDATE BOARD SET BOARD_TITLE=?,BOARD_CONTENT=?,BOARD_IMAGEF_FILE=?,VEGANLIST=?,SITUATION=?, IMAGE_FILE1=?, IMAGE_FILE2=?, IMAGE_FILE3=? WHERE BOARD_NO=?");
			
			pstmt.setString(1, board.getBoardTitle());
			pstmt.setString(2, board.getBoardContent());
			pstmt.setString(3, board.getBoardImageFile());
			pstmt.setString(4, board.getVeganlist());
			pstmt.setString(5, board.getSituation());
			pstmt.setString(6, board.getImagefile1());
			pstmt.setString(7, board.getImagefile2());
			pstmt.setString(8, board.getImagefile3());
			pstmt.setInt(9, board.getBoardNo());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}		
		
		return result;
	}
	
	public Board findBoardByNo(Connection conn, int boardNo) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Board board = null;
		String query =  "SELECT  B.BOARD_NO, "
				+         "B.BOARD_TITLE, "
				+         "M.USER_ID, "
				+         "B.BOARD_READCOUNT, "
				+         "B.BOARD_IMAGEF_FILE, "
				+         "B.BOARD_CONTENT, "
				+         "B.BOARD_CREATE_DATE, "
				+		  "B.VEGANLIST, "
				+ 		  "B.SITUATION, "
				+		  "B.IMAGE_FILE1, "
				+		  "B.IMAGE_FILE2, "
				+		  "B.IMAGE_FILE3, "
				+         "BOARD_MODIFY_DATE, "
				+		  "B.RECOMMEND "
				+ "FROM BOARD B "
				+ "JOIN MEMBER M ON(B.BOARD_WRITER_NO = M.USER_NO) "
				+ "WHERE B.STATUS = 'Y' AND B.BOARD_NO=?";
		
		
		try {
			pstmt = conn.prepareStatement(query);
			
			pstmt.setInt(1, boardNo);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				board = new Board();
				
				board.setBoardNo(rs.getInt("BOARD_NO"));
				board.setBoardTitle(rs.getString("BOARD_TITLE"));
				board.setUserId(rs.getString("USER_ID"));
				board.setBoardContent(rs.getString("BOARD_CONTENT"));
				board.setBoardImageFile(rs.getNString("BOARD_IMAGEF_FILE"));
				board.setBoardCreateDate(rs.getDate("BOARD_CREATE_DATE"));
				board.setBoardModifyDate(rs.getDate("BOARD_MODIFY_DATE"));
				board.setVeganlist(rs.getString("VEGANLIST"));
				board.setSituaion(rs.getString("SITUATION"));
				board.setImagefile1(rs.getString("IMAGE_FILE1"));
				board.setImagefile2(rs.getString("IMAGE_FILE2"));
				board.setImagefile3(rs.getString("IMAGE_FILE3"));
				board.setRecommned(rs.getInt("RECOMMEND"));
				board.setBoardReadCount(rs.getInt("BOARD_READCOUNT"));
			}			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}		
		
		return board;
	}
	
	public int updateReadCount(Connection conn, Board board) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		try {
			pstmt = conn.prepareStatement("UPDATE BOARD SET BOARD_READCOUNT=? WHERE BOARD_NO=?");
			
			board.setBoardReadCount(board.getBoardReadCount() + 1);
			
			pstmt.setInt(1, board.getBoardReadCount());
			pstmt.setInt(2, board.getBoardNo());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}		
		
		return result;
	}
	
	public List<Board> findAll(Connection conn) {
		List<Board> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String query = 
				  "SELECT BOARD_TITLE, BOARD_CREATE_DATE, BOARD_IMAGEF_FILE FROM BOARD ORDER BY BOARD_CREATE_DATE DESC";
			
		try {
			pstmt = conn.prepareStatement(query);
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				Board board = new Board(); 
				
				board.setBoardNo(rs.getInt("BOARD_NO"));
				board.setBoardTitle(rs.getString("BOARD_TITLE"));
				board.setBoardCreateDate(rs.getDate("BOARD_CREATE_DATE"));
				board.setBoardImageFile(rs.getString("BOARD_IAMAGEF_FILE"));
				
				list.add(board);				
			}			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
	
		return list;
	}

	public List<BoardReply> getReplies(Connection conn, int boardNo) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<BoardReply> list = new ArrayList();
		String query = 
				  "SELECT REPLY_NO, "
				+ 	   "BOARD_NO, "
				+ 	   "USER_ID, "
				+ 	   "REPLY_CONTENT, "
				+      "R.REPLY_CREATE_DATE, "
				+      "R.STATUS "
				+ "FROM REPLY R "
				+ "JOIN MEMBER M ON(R.REPLY_WRITER_NO = M.USER_NO) "
				+ "WHERE R.STATUS='Y' AND BOARD_NO = ?	"
				+ "ORDER BY REPLY_CREATE_DATE DESC";
		
		try {
			pstmt = conn.prepareStatement(query);
			
			pstmt.setInt(1, boardNo);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				BoardReply reply=new BoardReply();
				
				reply.setReplyNo(rs.getInt("REPLY_NO"));
				reply.setBoardNo(rs.getInt("BOARD_NO"));
				reply.setUserId(rs.getString("USER_ID"));
				reply.setReplyContent(rs.getString("REPLY_CONTENT"));
				reply.setReplyCreateDate(rs.getDate("REPLY_CREATE_DATE"));
				
				list.add(reply);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}return list;
	}
	
	
	public int insertBoardReply(Connection conn, BoardReply reply) {
		int result = 0;
		PreparedStatement pstmt = null;
		String query = "INSERT INTO REPLY VALUES(SEQ_REPLY_NO.NEXTVAL, ?, ?, SYSDATE, ?, DEFAULT)";
		
		try {
			pstmt = conn.prepareStatement(query);
			
			pstmt.setInt(1, reply.getBoardNo());
			pstmt.setString(2, reply.getReplyContent());
			pstmt.setInt(3, reply.getReplyWriterNo());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;
	}
	
	public int updateBoardStatus(Connection conn, int boardNo, String status) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		try {
			pstmt = conn.prepareStatement("UPDATE BOARD SET STATUS=? WHERE BOARD_NO=?");
			
			pstmt.setString(1, status);
			pstmt.setInt(2, boardNo);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}		
		
		return result;
	}

	public int updateReplyStatus(Connection conn, int replyNo, String status) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		try {
			pstmt = conn.prepareStatement("UPDATE REPLY SET STATUS=? WHERE REPLY_NO=?");
			
			pstmt.setString(1, status);
			pstmt.setInt(2, replyNo);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}		
		
		return result;
	}

	public int updateBoardRecommend(Connection conn, Board board) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		try {
			pstmt = conn.prepareStatement("UPDATE BOARD SET RECOMMEND=? WHERE BOARD_NO=?");
			
			board.setRecommned(board.getRecommned()+1);
			
			pstmt.setInt(1, board.getRecommned());
			pstmt.setInt(2, board.getBoardNo());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}		
		
		return result;
	}
	
}