package com.kh.member.model.service;

import static com.kh.common.jdbc.JDBCTemplate.close;
import static com.kh.common.jdbc.JDBCTemplate.commit;
import static com.kh.common.jdbc.JDBCTemplate.getConnection;
import static com.kh.common.jdbc.JDBCTemplate.rollback;
import static com.kh.common.jdbc.JDBCTemplate.close;
import static com.kh.common.jdbc.JDBCTemplate.getConnection;

import java.sql.Connection;

import com.kh.member.model.dao.MemberDAO;
import com.kh.member.model.vo.Member;


public class MemberService {
	private MemberDAO dao = new MemberDAO();	
	
	public Member login(String id, String pwd) {
		Connection conn = getConnection();
		
		Member member = dao.findMemberByIdAndPwd(conn, id, pwd);
		
		close(conn);
		
		return member;
	}
	
}
