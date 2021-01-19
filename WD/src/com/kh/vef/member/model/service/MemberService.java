package com.kh.vef.member.model.service;

import static com.kh.vef.common.jdbc.JDBCTemplate.close;
import static com.kh.vef.common.jdbc.JDBCTemplate.commit;
import static com.kh.vef.common.jdbc.JDBCTemplate.getConnection;
import static com.kh.vef.common.jdbc.JDBCTemplate.rollback;

import java.sql.Connection;

import com.kh.vef.member.model.dao.MemberDAO;
import com.kh.vef.member.model.vo.Member;

public class MemberService {
	private MemberDAO dao = new MemberDAO();	
	
	public Member login(String id, String pwd) {
		Connection conn = getConnection();
		
		Member member = dao.findMemberByIdAndPwd(conn, id, pwd);
		
		close(conn);
		
		return member;
	}

	public int enrollMember(Member member) {
		Connection conn = getConnection();
		
		int result = dao.insertMember(conn, member);
		
		if (result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		return result;
	}

	public boolean validate(String userId) {
		Connection conn = getConnection();
		
		Member member = dao.findMemberById(conn, userId);
		
		close(conn);
		
		return member != null;
	}

	public Member findMemberById(String userId) {
		Connection conn = getConnection();
		
		Member member = dao.findMemberById(conn, userId);
		
		close(conn);
		
		return member;
	}

	public int updatePassword(String id, String pwd, String newPwd) {
		Connection conn = getConnection();
		int result = dao.updatePassword(conn, id, pwd, newPwd);
		
		if (result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
				
		close(conn);
		
		return result;
	}

	public int updateMember(Member member) {
		Connection conn = getConnection();
		int result = dao.updateMember(conn, member);
		
		if (result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
				
		close(conn);
		
		return result;
	}

	public int deleteMember(String id, String pwd) {
		Connection conn = getConnection();
		int result = dao.updateMemberStatus(conn, id, pwd, "N");
		
		if (result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
				
		close(conn);
		
		return result;
	}
}
