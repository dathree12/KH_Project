package com.kh.ServiceCenter.model.dao;

import static com.kh.common.jdbc.JDBCTemplate.close;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.kh.ServiceCenter.model.vo.NOTICE;
import com.kh.ServiceCenter.model.vo.NOTICE;
import com.kh.ServiceCenter.model.vo.NOTICE;
import com.kh.ServiceCenter.model.vo.NOTICE;
import com.kh.common.util.PageInfo;

public class NoticeDAO {

	public int getNoticeCount(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int result = 0;
		String query = "SELECT COUNT(*) FROM NOTICE";
		
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

	public List<NOTICE> findAll(Connection conn, PageInfo info) {
		List<NOTICE> list = new ArrayList<>();
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String query = 
				  "SELECT NNUM, User_Num, NTITLE, NCONTENT, NDATE, NHIT "
				  + "FROM NOTICE";
		
		try {
			pstmt = conn.prepareStatement(query);
			
//			pstmt.setInt(1, info.getStartList());
//			pstmt.setInt(2, info.getEndList());
			
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				NOTICE notice = new NOTICE(); 
				
				notice.setNNUM(rs.getInt("NNUM"));
				notice.setUser_Num(rs.getInt("User_Num"));
				notice.setNTITLE(rs.getString("NTITLE"));
				notice.setNCONTENT(rs.getString("NCONTENT"));
				notice.setNDATE(rs.getDate("NDATE"));
				notice.setNHIT(rs.getInt("NHIT"));
				
				list.add(notice);				
			}			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		
		return list;
	}

	public int updateNotice(Connection conn, NOTICE notice) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		try {
			pstmt = conn.prepareStatement("UPDATE NOTICE SET NTITLE=?, NCONTENT=? WHERE User_Num=?");
			
			pstmt.setString(1, notice.getNTITLE());
			pstmt.setString(2, notice.getNCONTENT());
			pstmt.setInt(3, notice.getUser_Num());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public int insertNotice(Connection conn, NOTICE notice) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		try {
			pstmt = conn.prepareStatement("INSERT INTO NOTICE VALUES(SEQ_NOTICE_NO.nextval, ?, ?, ?, DEFAULT, DEFAULT)");
			
			pstmt.setInt(1, notice.getUser_Num());
			pstmt.setString(2, notice.getNTITLE());
			pstmt.setString(3, notice.getNCONTENT());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public NOTICE findNoticeByNo(Connection conn, int NNUM) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		NOTICE notice = null;
		String query = 
					"SELECT NNUM, User_Num, NTITLE, NCONTENT, NDATE, NHIT FROM NOTICE WHERE User_Num =?";
		
		try {
			pstmt = conn.prepareStatement(query);
			
			pstmt.setInt(1, NNUM);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				notice = new NOTICE();
				
				notice.setNNUM(rs.getInt("NNUM"));
				notice.setUser_Num(rs.getInt("User_Num"));
				notice.setNTITLE(rs.getString("NTITLE"));
				notice.setNCONTENT(rs.getString("NCONTENT"));
				notice.setNDATE(rs.getDate("NDATE"));
				notice.setNHIT(rs.getInt("NHIT"));
			}			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}	
		
		System.out.println("NoticeDAO-notice : " + notice);
		
		return notice;
	}

	public int updateReadCount(Connection conn, NOTICE notice) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		try {
			pstmt = conn.prepareStatement("UPDATE NOTICE SET NHIT=? WHERE User_Num=?");
			
			notice.setNHIT(notice.getNHIT() + 1);
			
			pstmt.setInt(1, notice.getNHIT());
			pstmt.setInt(2, notice.getNNUM());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}		
		
		return result;
	}
	
	

}


































