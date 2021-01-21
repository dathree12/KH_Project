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
				+ "JOIN MEMBER M ON(B.BOARD_WRITER_NO = M.USER_NUM) "
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
	
	public List<Board> findAll(Connection conn, PageInfo info) {
		List<Board> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String query = 
				  "SELECT * "
							+ "FROM ("
							+    "SELECT ROWNUM AS RNUM, "
							+           "BOARD_NO, "
							+ 			"BOARD_TITLE, "
							+ 			"USER_ID, "
							+ 			"BOARD_CREATE_DATE, "
							+ 			"BOARD_IMAGEF_FILE, "
							+  			"BOARD_READCOUNT, "
							+			"VEGANLIST, "
							+			"RECOMMEND, "
							+     		"STATUS "
							+ 	 "FROM ("
							+ 	    "SELECT B.BOARD_NO, "
							+ 			   "B.BOARD_TITLE, "
							+  			   "M.USER_ID, "
							+ 			   "B.BOARD_CREATE_DATE, "
							+ 			   "B.BOARD_IMAGEF_FILE, "
							+ 			   "B.BOARD_READCOUNT, "
							+			   "B.VEGANLIST, "
							+ 	   		   "B.STATUS, "
							+			   "B.RECOMMEND "
							+ 		"FROM BOARD B "
							+ 		"JOIN MEMBER M ON(B.BOARD_WRITER_NO = M.USER_NUM) "
							+ 		"WHERE B.STATUS = 'Y'  ORDER BY B.BOARD_CREATE_DATE DESC"
							+ 	 ")"
							+ ") WHERE RNUM BETWEEN ? and ?";
			
		try {
			pstmt = conn.prepareStatement(query);
			
			pstmt.setInt(1, info.getStartList());
			pstmt.setInt(2, info.getEndList());
			
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				Board board = new Board(); 
				
				board.setBoardNo(rs.getInt("BOARD_NO"));
				board.setRowNum(rs.getInt("RNUM"));
				board.setBoardTitle(rs.getString("BOARD_TITLE"));
				board.setBoardCreateDate(rs.getDate("BOARD_CREATE_DATE"));
				board.setBoardImageFile(rs.getString("BOARD_IMAGEF_FILE"));
				board.setBoardReadCount(rs.getInt("BOARD_READCOUNT"));
				board.setUserId(rs.getString("USER_ID"));
				board.setVeganlist(rs.getString("VEGANLIST"));
				board.setRecommned(rs.getInt("RECOMMEND"));
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
				+ "JOIN MEMBER M ON(R.REPLY_WRITER_NO = M.USER_NUM) "
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
	
	public int getBoardCount(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int result = 0;
		String query = "SELECT COUNT(*) FROM BOARD WHERE STATUS = 'Y'";
		
		try {
			pstmt = conn.prepareStatement(query);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				result = rset.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}		
		
		return result;
	}

	

	public List<Board> getBoardVegan(Connection conn, String veganlist) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<Board> list = new ArrayList<>();
				
		String query = 
				"SELECT BOARD_NO, BOARD_IMAGEF_FILE, BOARD_TITLE, VEGANLIST FROM BOARD WHERE STATUS = 'Y' AND VEGANLIST = ? ORDER BY BOARD_NO";
		
		try {
			pstmt = conn.prepareStatement(query);
			
			pstmt.setString(1, veganlist);
			
			rs = pstmt.executeQuery();
		
			
			while(rs.next()) {
				Board board = new Board();
				
				board.setBoardNo(rs.getInt("BOARD_NO"));
				board.setBoardImageFile(rs.getString("BOARD_IMAGEF_FILE"));
				board.setBoardTitle(rs.getString("BOARD_TITLE"));
				board.setVeganlist(rs.getString("VEGANLIST"));
								
				list.add(board);
				
				
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		System.out.println("##" + list);
		return list;
	}

	
		public List<Board> searchRecipe(Connection conn, String searchword, String searchoption, PageInfo info) {
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			List<Board> list = new ArrayList<>();
			String query1 = "SELECT * FROM (SELECT ROWNUM AS RNUM, BOARD_NO, BOARD_TITLE, USER_ID, BOARD_CREATE_DATE, BOARD_IMAGEF_FILE, BOARD_READCOUNT, VEGANLIST, STATUS FROM (SELECT B.BOARD_NO, B.BOARD_TITLE, M.USER_ID, B.BOARD_CREATE_DATE, B.BOARD_IMAGEF_FILE, B.BOARD_READCOUNT, B.VEGANLIST, B.STATUS FROM BOARD B JOIN MEMBER M ON(B.BOARD_WRITER_NO = M.USER_NUM) WHERE B.STATUS = 'Y' AND B.BOARD_TITLE LIKE '%' || ? || '%'  ORDER BY B.BOARD_CREATE_DATE DESC)) WHERE RNUM BETWEEN ? and ?";
					
			String query2 = 
					  "SELECT * "
								+ "FROM ("
								+    "SELECT ROWNUM AS RNUM, "
								+           "BOARD_NO, "
								+ 			"BOARD_TITLE, "
								+ 			"USER_ID, "
								+ 			"BOARD_CREATE_DATE, "
								+ 			"BOARD_IMAGEF_FILE, "
								+  			"BOARD_READCOUNT, "
								+			"VEGANLIST, "
								+     		"STATUS "
								+ 	 "FROM ("
								+ 	    "SELECT B.BOARD_NO, "
								+ 			   "B.BOARD_TITLE, "
								+  			   "M.USER_ID, "
								+ 			   "B.BOARD_CREATE_DATE, "
								+ 			   "B.BOARD_IMAGEF_FILE, "
								+ 			   "B.BOARD_READCOUNT, "
								+			   "B.VEGANLIST, "
								+ 	   		   "B.STATUS "
								+ 		"FROM BOARD B "
								+ 		"JOIN MEMBER M ON(B.BOARD_WRITER_NO = M.USER_NUM) "
								+ 		"WHERE B.STATUS = 'Y' AND  M.USER_ID LIKE '%' || ? || '%'  ORDER BY B.BOARD_CREATE_DATE DESC"
								+ 	 ")"
								+ ") WHERE RNUM BETWEEN ? and ?";
				
			  
			String query3 = 
					  "SELECT * "
								+ "FROM ("
								+    "SELECT ROWNUM AS RNUM, "
								+           "BOARD_NO, "
								+ 			"BOARD_TITLE, "
								+ 			"USER_ID, "
								+ 			"BOARD_CREATE_DATE, "
								+ 			"BOARD_IMAGEF_FILE, "
								+  			"BOARD_READCOUNT, "
								+			"VEGANLIST, "
								+     		"STATUS "
								+ 	 "FROM ("
								+ 	    "SELECT B.BOARD_NO, "
								+ 			   "B.BOARD_TITLE, "
								+  			   "M.USER_ID, "
								+ 			   "B.BOARD_CREATE_DATE, "
								+ 			   "B.BOARD_IMAGEF_FILE, "
								+ 			   "B.BOARD_READCOUNT, "
								+			   "B.VEGANLIST, "
								+ 	   		   "B.STATUS "
								+ 		"FROM BOARD B "
								+ 		"JOIN MEMBER M ON(B.BOARD_WRITER_NO = M.USER_NUM) "
								+ 		"WHERE B.STATUS = 'Y' AND   B.BOARD_CONTENT LIKE '%' || ? || '%' ORDER BY B.BOARD_CREATE_DATE DESC"
								+ 	 ")"
								+ ") WHERE RNUM BETWEEN ? and ?";
			
			try {
			         if(searchoption.equals("s_title")) {
			        	
			        	pstmt = conn.prepareStatement(query1);
			         	pstmt.setString(1, searchword);
			         	pstmt.setInt(2, info.getStartList());
			         	pstmt.setInt(3, info.getEndList());
	
			          
			         } else if(searchoption.equals("s_id")) {
			        	 	System.out.println("aaaaa" + searchoption);
				        	pstmt = conn.prepareStatement(query2);
				         	pstmt.setString(1, searchword);
				        	pstmt.setInt(2, info.getStartList());
				         	pstmt.setInt(3, info.getEndList());
				         	System.out.println("bbbbbbbbb");
				         }
				         else if(searchoption.equals("s_content")) {
				        	 pstmt = conn.prepareStatement(query3);
				        	 pstmt.setString(1, searchword);
				        		pstmt.setInt(2, info.getStartList());
					         	pstmt.setInt(3, info.getEndList());
				         }
			       
			        rs = pstmt.executeQuery();
			        
			     
			        
			        while (rs.next()) {
					Board board = new Board(); 
					
					board.setBoardNo(rs.getInt("BOARD_NO"));
					board.setRowNum(rs.getInt("RNUM"));
					board.setBoardTitle(rs.getString("BOARD_TITLE"));
					board.setBoardCreateDate(rs.getDate("BOARD_CREATE_DATE"));
					board.setBoardImageFile(rs.getString("BOARD_IMAGEF_FILE"));
					board.setBoardReadCount(rs.getInt("BOARD_READCOUNT"));
					board.setUserId(rs.getString("USER_ID"));
					board.setVeganlist(rs.getString("VEGANLIST"));
					
					list.add(board);				
					
					} 
				} catch (Exception e) {
					e.printStackTrace();
				} finally {
					close(pstmt);
				}
			
			System.out.println("1"+list);
			return list;
			
		}

		public List<Board> findRecommendlist(Connection conn, PageInfo info) {
			List<Board> list = new ArrayList<>();
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			String query = 
					  "SELECT * "
								+ "FROM ("
								+    "SELECT ROWNUM AS RNUM, "
								+           "BOARD_NO, "
								+ 			"BOARD_TITLE, "
								+ 			"USER_ID, "
								+ 			"BOARD_CREATE_DATE, "
								+ 			"BOARD_IMAGEF_FILE, "
								+  			"BOARD_READCOUNT, "
								+			"VEGANLIST, "
								+			"RECOMMEND, "
								+     		"STATUS "
								+ 	 "FROM ("
								+ 	    "SELECT B.BOARD_NO, "
								+ 			   "B.BOARD_TITLE, "
								+  			   "M.USER_ID, "
								+ 			   "B.BOARD_CREATE_DATE, "
								+ 			   "B.BOARD_IMAGEF_FILE, "
								+ 			   "B.BOARD_READCOUNT, "
								+			   "B.VEGANLIST, "
								+ 	   		   "B.STATUS, "
								+			   "B.RECOMMEND "
								+ 		"FROM BOARD B "
								+ 		"JOIN MEMBER M ON(B.BOARD_WRITER_NO = M.USER_NUM) "
								+ 		"WHERE B.STATUS = 'Y'  ORDER BY B.RECOMMEND DESC"
								+ 	 ")"
								+ ") WHERE RNUM BETWEEN ? and ?";
				
			try {
				pstmt = conn.prepareStatement(query);
				
				pstmt.setInt(1, info.getStartList());
				pstmt.setInt(2, info.getEndList());
				
				rs = pstmt.executeQuery();
				
				while (rs.next()) {
					Board board = new Board(); 
					
					board.setBoardNo(rs.getInt("BOARD_NO"));
					board.setRowNum(rs.getInt("RNUM"));
					board.setBoardTitle(rs.getString("BOARD_TITLE"));
					board.setBoardCreateDate(rs.getDate("BOARD_CREATE_DATE"));
					board.setBoardImageFile(rs.getString("BOARD_IMAGEF_FILE"));
					board.setBoardReadCount(rs.getInt("BOARD_READCOUNT"));
					board.setUserId(rs.getString("USER_ID"));
					board.setVeganlist(rs.getString("VEGANLIST"));
					board.setRecommned(rs.getInt("RECOMMEND"));
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

		public List<Board> searchRecoRecipe(Connection conn, String searchword, String searchoption, PageInfo info) {
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			List<Board> list = new ArrayList<>();
			String query1 = "SELECT * FROM (SELECT ROWNUM AS RNUM, BOARD_NO, BOARD_TITLE, USER_ID, BOARD_CREATE_DATE, BOARD_IMAGEF_FILE, BOARD_READCOUNT, VEGANLIST, STATUS, RECOMMEND FROM (SELECT B.BOARD_NO, B.BOARD_TITLE, M.USER_ID, B.BOARD_CREATE_DATE, B.BOARD_IMAGEF_FILE, B.BOARD_READCOUNT, B.VEGANLIST, B.STATUS, B.RECOMMEND FROM BOARD B JOIN MEMBER M ON(B.BOARD_WRITER_NO = M.USER_NUM) WHERE B.STATUS = 'Y' AND B.BOARD_TITLE LIKE '%' || ? || '%'  ORDER BY B.RECOMMEND DESC)) WHERE RNUM BETWEEN ? and ?";
					
			String query2 = 
					  "SELECT * "
								+ "FROM ("
								+    "SELECT ROWNUM AS RNUM, "
								+           "BOARD_NO, "
								+ 			"BOARD_TITLE, "
								+ 			"USER_ID, "
								+ 			"BOARD_CREATE_DATE, "
								+ 			"BOARD_IMAGEF_FILE, "
								+  			"BOARD_READCOUNT, "
								+			"VEGANLIST, "
								+     		"STATUS, "
								+			"RECOMMEND "
								+ 	 "FROM ("
								+ 	    "SELECT B.BOARD_NO, "
								+ 			   "B.BOARD_TITLE, "
								+  			   "M.USER_ID, "
								+ 			   "B.BOARD_CREATE_DATE, "
								+ 			   "B.BOARD_IMAGEF_FILE, "
								+ 			   "B.BOARD_READCOUNT, "
								+			   "B.VEGANLIST, "
								+ 	   		   "B.STATUS, "
								+			   "B.RECOMMEND "
								+ 		"FROM BOARD B "
								+ 		"JOIN MEMBER M ON(B.BOARD_WRITER_NO = M.USER_NUM) "
								+ 		"WHERE B.STATUS = 'Y' AND  M.USER_ID LIKE '%' || ? || '%'  ORDER BY B.RECOMMEND DESC"
								+ 	 ")"
								+ ") WHERE RNUM BETWEEN ? and ?";
				
			  
			String query3 = 
					  "SELECT * "
								+ "FROM ("
								+    "SELECT ROWNUM AS RNUM, "
								+           "BOARD_NO, "
								+ 			"BOARD_TITLE, "
								+ 			"USER_ID, "
								+ 			"BOARD_CREATE_DATE, "
								+ 			"BOARD_IMAGEF_FILE, "
								+  			"BOARD_READCOUNT, "
								+			"VEGANLIST, "
								+     		"STATUS, "
								+			"RECOMMEND "
								+ 	 "FROM ("
								+ 	    "SELECT B.BOARD_NO, "
								+ 			   "B.BOARD_TITLE, "
								+  			   "M.USER_ID, "
								+ 			   "B.BOARD_CREATE_DATE, "
								+ 			   "B.BOARD_IMAGEF_FILE, "
								+ 			   "B.BOARD_READCOUNT, "
								+			   "B.VEGANLIST, "
								+ 	   		   "B.STATUS, "
								+			   "B.RECOMMEND "
								+ 		"FROM BOARD B "
								+ 		"JOIN MEMBER M ON(B.BOARD_WRITER_NO = M.USER_NUM) "
								+ 		"WHERE B.STATUS = 'Y' AND   B.BOARD_CONTENT LIKE '%' || ? || '%' ORDER BY B.RECOMMEND DESC"
								+ 	 ")"
								+ ") WHERE RNUM BETWEEN ? and ?";
			
			try {
			         if(searchoption.equals("s_title")) {
			        	
			        	pstmt = conn.prepareStatement(query1);
			         	pstmt.setString(1, searchword);
			         	pstmt.setInt(2, info.getStartList());
			         	pstmt.setInt(3, info.getEndList());
	
			          
			         } else if(searchoption.equals("s_id")) {
				        	pstmt = conn.prepareStatement(query2);
				         	pstmt.setString(1, searchword);
				        	pstmt.setInt(2, info.getStartList());
				         	pstmt.setInt(3, info.getEndList());
				         }
				         else if(searchoption.equals("s_content")) {
				        	 pstmt = conn.prepareStatement(query3);
				        	 pstmt.setString(1, searchword);
				        		pstmt.setInt(2, info.getStartList());
					         	pstmt.setInt(3, info.getEndList());
				         }
			       
			        rs = pstmt.executeQuery();
			        
			     
			        
			        while (rs.next()) {
					Board board = new Board(); 
					
					board.setBoardNo(rs.getInt("BOARD_NO"));
					board.setRowNum(rs.getInt("RNUM"));
					board.setBoardTitle(rs.getString("BOARD_TITLE"));
					board.setBoardCreateDate(rs.getDate("BOARD_CREATE_DATE"));
					board.setBoardImageFile(rs.getString("BOARD_IMAGEF_FILE"));
					board.setBoardReadCount(rs.getInt("BOARD_READCOUNT"));
					board.setUserId(rs.getString("USER_ID"));
					board.setVeganlist(rs.getString("VEGANLIST"));
					board.setRecommned(rs.getInt("RECOMMEND"));
					
					list.add(board);				
					
					} 
				} catch (Exception e) {
					e.printStackTrace();
				} finally {
					close(pstmt);
				}
			
			System.out.println("SEARCHRECO"+list);
			return list;
		}
	}
