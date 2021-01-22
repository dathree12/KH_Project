package com.kh.ServiceCenter.model.service;

import static com.kh.common.jdbc.JDBCTemplate.close;
import static com.kh.common.jdbc.JDBCTemplate.commit;
import static com.kh.common.jdbc.JDBCTemplate.getConnection;
import static com.kh.common.jdbc.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.List;

import com.kh.ServiceCenter.model.dao.NoticeDAO;
import com.kh.ServiceCenter.model.dao.NoticeDAO;
import com.kh.ServiceCenter.model.dao.NoticeDAO;
import com.kh.ServiceCenter.model.dao.NoticeDAO;
import com.kh.ServiceCenter.model.vo.NOTICE;
import com.kh.ServiceCenter.model.vo.NOTICE;
import com.kh.ServiceCenter.model.vo.NOTICE;
import com.kh.common.util.PageInfo;

public class NoticeService {

	public int getNoticeCount() {
		Connection conn = getConnection();
		
		int result = new NoticeDAO().getNoticeCount(conn);
		
		close(conn);
		
		return result;
	}

	public List<NOTICE> getNoticeList(PageInfo info) {
		Connection conn = getConnection();
		
		List<NOTICE> list = new NoticeDAO().findAll(conn, info);
		
		close(conn);
		
		return list;
	}

	public int saveNotice(NOTICE notice) {
		int result = 0;
		Connection conn = getConnection();
		
		if(notice.getNNUM() != 0) {
			result = new NoticeDAO().updateNotice(conn, notice);	
		} else {
			result = new NoticeDAO().insertNotice(conn, notice);			
		}
		
		if (result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}

		close(conn);
		
		return result;
	}

	public NOTICE getNotice(int NNUM, boolean hasRead) {
		int result = 0;
		Connection conn = getConnection();
		NOTICE notice = new NoticeDAO().findNoticeByNo(conn, NNUM);
		
		// 게시글 조회수 증가 로직
		if(notice != null && !hasRead) {
			result = new NoticeDAO().updateReadCount(conn, notice);
			
			if (result > 0) {
				commit(conn);
			} else {
				rollback(conn);
			}
		}		
		
		close(conn);
		
		System.out.println("NoticeService-notice : " + notice);
		
		return notice;
	}
}



































