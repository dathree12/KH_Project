package com.kh.ServiceCenter.model.dao;

import static com.kh.common.jdbc.JDBCTemplate.close;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.kh.ServiceCenter.model.vo.QnA;
import com.kh.common.util.PageInfo;

public class QnADAO {
	
	public List<QnA> findAll(Connection conn, PageInfo info) {
		List<QnA> list = new ArrayList<>();
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String query = 
				  "SELECT Que_Num, User_Num, Que_Title, Que_Content, Que_Date, HIT, QGROUP, STEP, QINDENT "
				  + "FROM QNA_MEMBER "
				  + "ORDER BY QGROUP DESC, STEP ASC, Que_Num ASC";
		
		try {
			pstmt = conn.prepareStatement(query);
			
//			pstmt.setInt(1, info.getStartList());
//			pstmt.setInt(2, info.getEndList());
			
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				QnA qna = new QnA(); 
				
				qna.setQue_Num(rs.getInt("Que_Num"));
				qna.setUser_Num(rs.getInt("User_Num"));
				qna.setQue_Title(rs.getString("Que_Title"));
				qna.setQue_Content(rs.getString("Que_Content"));
				qna.setQue_Date(rs.getDate("Que_Date"));
				qna.setHIT(rs.getInt("HIT"));
				qna.setQGROUP(rs.getInt("QGROUP"));
				qna.setSTEP(rs.getInt("STEP"));
				qna.setQINDENT(rs.getInt("QINDENT"));
				
				list.add(qna);				
			}			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		
//		System.out.println("test-QnADAO : " + list);
		
		return list;
	}

	public int getQnACount(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int result = 0;
		String query = "SELECT COUNT(*) FROM QNA_MEMBER";
		
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
	
	public int insertQnA(Connection conn, QnA qna) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		try {
			pstmt = conn.prepareStatement("INSERT INTO QNA_MEMBER VALUES(SEQ_QnA_MEMBER_NO.NEXTVAL, ?, ?, ?, DEFAULT, DEFAULT, SEQ_QNA_MEMBER_NO.CURRVAL, 0, 0)");
			
			pstmt.setInt(1, qna.getUser_Num());
			pstmt.setString(2, qna.getQue_Title());
			pstmt.setString(3, qna.getQue_Content());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public int updateQnA(Connection conn, QnA qna) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		try {
			pstmt = conn.prepareStatement("UPDATE QnA_MEMBER SET Que_Title=?, Que_Content=? WHERE USER_NUM=?");
			
			pstmt.setString(1, qna.getQue_Title());
			pstmt.setString(2, qna.getQue_Content());
			pstmt.setInt(3, qna.getUser_Num());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public QnA findQnAByNo(Connection conn, int que_Num) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		QnA qna = null;
		String query = 
					"SELECT Que_Num, User_Num, Que_Title, Que_Content, Que_Date, HIT, QGROUP, STEP, QINDENT "
						  + "FROM QNA_MEMBER WHERE Que_Num=?";
		
		try {
			pstmt = conn.prepareStatement(query);
			
			pstmt.setInt(1, que_Num);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				qna = new QnA();
				
				qna.setQue_Num(rs.getInt("Que_Num"));
				qna.setUser_Num(rs.getInt("User_Num"));
				qna.setQue_Title(rs.getString("Que_Title"));
				qna.setQue_Content(rs.getString("Que_Content"));
				qna.setQue_Date(rs.getDate("Que_Date"));
				qna.setHIT(rs.getInt("HIT"));
				qna.setQGROUP(rs.getInt("QGROUP"));
				qna.setSTEP(rs.getInt("STEP"));
				qna.setQINDENT(rs.getInt("QINDENT"));
			}			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}		
		
		return qna;
	}

	public int updateReadCount(Connection conn, QnA qna) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		try {
			pstmt = conn.prepareStatement("UPDATE QnA_MEMBER SET HIT=? WHERE Que_Num=?");
			
			qna.setHIT(qna.getHIT() + 1);
			
			pstmt.setInt(1, qna.getHIT());
			pstmt.setInt(2, qna.getQue_Num());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}		
		
		return result;
	}

	public int updateQnAAnswer(Connection conn, QnA qna) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		try {
			pstmt = conn.prepareStatement("UPDATE QnA_MEMBER SET Que_Title=?, Que_Content=?, QGROUP=?, STEP=?, QINDENT=? WHERE USER_NUM=?");
			
			pstmt.setString(1, qna.getQue_Title());
			pstmt.setString(2, qna.getQue_Content());
			pstmt.setInt(3, qna.getQGROUP());
			pstmt.setInt(4, qna.getSTEP() + 1);
			pstmt.setInt(5, qna.getQINDENT() + 1);
			pstmt.setInt(6, qna.getUser_Num());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}		
		
		System.out.println(result);
		
		return result;
	}

	public int insertQnAAnswer(Connection conn, QnA qna) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		try {
			pstmt = conn.prepareStatement("INSERT INTO QNA_MEMBER VALUES(SEQ_QnA_MEMBER_NO.NEXTVAL, ?, ?, ?, DEFAULT, DEFAULT, ?, ?, ?)");
			
			pstmt.setInt(1, qna.getUser_Num());
			pstmt.setString(2, qna.getQue_Title());
			pstmt.setString(3, qna.getQue_Content());
			pstmt.setInt(4, qna.getQGROUP());
			pstmt.setInt(5, qna.getSTEP() + 1);
			pstmt.setInt(6, qna.getQINDENT() + 1);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}		
		
		System.out.println(result);
		
		return result;
	}
	
}

























