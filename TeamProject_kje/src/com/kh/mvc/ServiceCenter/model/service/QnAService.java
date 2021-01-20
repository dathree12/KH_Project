package com.kh.mvc.ServiceCenter.model.service;

import static com.kh.mvc.common.jdbc.JDBCTemplate.close;
import static com.kh.mvc.common.jdbc.JDBCTemplate.commit;
import static com.kh.mvc.common.jdbc.JDBCTemplate.getConnection;
import static com.kh.mvc.common.jdbc.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.List;

import com.kh.mvc.ServiceCenter.model.dao.QnADAO;
import com.kh.mvc.ServiceCenter.model.vo.QnA;
import com.kh.mvc.common.util.PageInfo;

public class QnAService {
	
	public List<QnA> getQnAList(PageInfo info) {
		Connection conn = getConnection();
		
		List<QnA> list = new QnADAO().findAll(conn, info);
		
		close(conn);		
		
		return list;
	}

	public int getQnACount() {
		Connection conn = getConnection();
		
		int result = new QnADAO().getQnACount(conn);
		
		close(conn);
		
		return result;	
	}
	
	public int saveQnA(QnA qna) {
		int result = 0;
		Connection conn = getConnection();
		
		if(qna.getQue_Num() != 0) {
			result = new QnADAO().updateQnA(conn, qna);	
		} else {
			result = new QnADAO().insertQnA(conn, qna);			
		}
		
		if (result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}

		close(conn);
		
		return result;
	}
	
	
	
}

































