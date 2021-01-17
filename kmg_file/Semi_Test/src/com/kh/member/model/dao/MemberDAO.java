package com.kh.member.model.dao;

import static com.kh.common.jdbc.JDBCTemplate.close;
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
			
			pstmt = conn.prepareStatement("SELECT * FROM MEMBER WHERE USER_ID = ? AND USER_PWD = ? ");
			
			pstmt.setString(1, id);
			pstmt.setString(2, pwd);

			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				System.out.println(rset.getString("USER_ID") + ", " + rset.getString("USER_PWD"));
				member = new Member(
						rset.getInt("USER_NO"),
						rset.getString("USER_ID"),
						rset.getString("USER_PWD"),
						rset.getString("USER_NAME")
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
	

	
	
	
	
}
