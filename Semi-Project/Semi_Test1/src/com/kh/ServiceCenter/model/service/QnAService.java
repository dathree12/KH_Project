package com.kh.ServiceCenter.model.service;

import static com.kh.common.jdbc.JDBCTemplate.close;
import static com.kh.common.jdbc.JDBCTemplate.commit;
import static com.kh.common.jdbc.JDBCTemplate.getConnection;
import static com.kh.common.jdbc.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.List;

import com.kh.ServiceCenter.model.dao.QnADAO;
import com.kh.ServiceCenter.model.vo.QnA;
import com.kh.common.util.PageInfo;

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

	public QnA getQnA(int que_Num, boolean hasRead) {
		int result = 0;
		Connection conn = getConnection();
		QnA qna = new QnADAO().findQnAByNo(conn, que_Num);
		
		// 게시글 조회수 증가 로직
		if(qna != null && !hasRead) {
			result = new QnADAO().updateReadCount(conn, qna);
			
			if (result > 0) {
				commit(conn);
			} else {
				rollback(conn);
			}
		}		
		
		close(conn);	
		
		return qna;
	}

	public int saveQnAAnswer(QnA qna) {
		int result = 0;
		Connection conn = getConnection();
		
		if(qna.getQue_Num() != 0) {
			result = new QnADAO().updateQnAAnswer(conn, qna);	
		} else {
			result = new QnADAO().insertQnAAnswer(conn, qna);			
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

































