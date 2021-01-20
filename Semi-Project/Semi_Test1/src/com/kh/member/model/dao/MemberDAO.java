package com.kh.member.model.dao;

import static com.kh.common.jdbc.JDBCTemplate.close;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.kh.member.model.vo.Member;

public class MemberDAO {

	public MemberDAO() {
	}

	public Member findMemberByIdAndPwd(Connection conn, String id, String pwd){
		Member member = null;
		ResultSet rset = null;
		PreparedStatement pstmt = null;
		
		try {
			
			pstmt = conn.prepareStatement("SELECT * FROM MEMBER WHERE USER_ID = ? AND USER_PWD = ? AND STATUS='Y'");
			
			pstmt.setString(1, id);
			pstmt.setString(2, pwd);

			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				System.out.println(rset.getString("USER_ID") + ", " + rset.getString("USER_PWD"));
				member = new Member(
						rset.getInt("USER_NUM"),
						rset.getString("USER_ID"),
						rset.getString("USER_PWD"),
						rset.getString("USER_EMAIL"),
						rset.getDate("ENROLL_DATE"),
						rset.getString("VEG_TYPE"),
						rset.getString("USER_ROLE"),
						rset.getString("STATUS")
				);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return member;
	}

	public int insertMember(Connection conn, Member member) {
		int result = 0;
		PreparedStatement pstmt = null;		
		
		try {			
			pstmt = conn.prepareStatement("INSERT INTO MEMBER VALUES(SEQ_USER_NUM.NEXTVAL, ?, ?, ?, SYSDATE, ?, 'ROLE_USER', DEFAULT)");
			
			pstmt.setString(1, member.getUserId());
			pstmt.setString(2, member.getUserPwd());
			pstmt.setString(3, member.getEmail());
			pstmt.setString(4, member.getVegType());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public Member findMemberById(Connection conn, String userId) {
		Member member = null;
		ResultSet rset = null;
		PreparedStatement pstmt = null;
		
		try {
			
			pstmt = conn.prepareStatement("SELECT * FROM MEMBER WHERE USER_ID = ?");
			
			pstmt.setString(1, userId);

			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				System.out.println(rset.getString("USER_ID") + ", " + rset.getString("USER_PWD"));
				member = new Member(
						rset.getInt("USER_NUM"),
						rset.getString("USER_ID"),
						rset.getString("USER_PWD"),
						rset.getString("USER_EMAIL"),
						rset.getDate("ENROLL_DATE"),
						rset.getString("VEG_TYPE"),
						rset.getString("USER_ROLE"),
						rset.getString("STATUS")
				);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return member;
	}

	public int updatePassword(Connection conn, String id, String pwd, String newPwd) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		try {
			pstmt = conn.prepareStatement("UPDATE MEMBER SET USER_PWD=? WHERE USER_ID=? AND USER_PWD=?");
			
			pstmt.setString(1, newPwd);
			pstmt.setString(2, id);
			pstmt.setString(3, pwd);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
				
		return result;
	}

	public int updateMember(Connection conn, Member member) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		try {
			pstmt = conn.prepareStatement("UPDATE MEMBER SET USER_EMAIL=?,VEG_TYPE=? WHERE USER_ID=?");
			
			pstmt.setString(1, member.getEmail());
			pstmt.setString(2, member.getVegType());
			pstmt.setString(3, member.getUserId());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
				
		return result;
	}

	public int updateMemberStatus(Connection conn, String id, String pwd, String status) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		try {
			pstmt = conn.prepareStatement("UPDATE MEMBER SET STATUS=? WHERE USER_ID=? AND USER_PWD=?");
			
			pstmt.setString(1, status);
			pstmt.setString(2, id);
			pstmt.setString(3, pwd);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
				
		return result;
	}
}
