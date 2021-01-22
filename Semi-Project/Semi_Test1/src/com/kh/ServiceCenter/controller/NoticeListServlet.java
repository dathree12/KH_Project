package com.kh.ServiceCenter.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.ServiceCenter.model.service.NoticeService;
import com.kh.ServiceCenter.model.service.QnAService;
import com.kh.ServiceCenter.model.vo.NOTICE;
import com.kh.ServiceCenter.model.vo.QnA;
import com.kh.common.util.PageInfo;

@WebServlet("/ServiceCenter/Notice")
public class NoticeListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public NoticeListServlet() {
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int page = 0;
		int listCount = 0;
		PageInfo info = null;
		List<NOTICE> list = null;
		
		try {
			page = Integer.parseInt(request.getParameter("page"));
		}catch(NumberFormatException e) {
			page = 1;
		}		
		
		listCount = new NoticeService().getNoticeCount();
		info = new PageInfo(page, 10, listCount, 5);		
		list = new NoticeService().getNoticeList(info);
		
		request.setAttribute("list", list);
		request.setAttribute("pageInfo", info);
		
		request.getRequestDispatcher("/views/ServiceCenter/Notice.jsp").forward(request, response);
	}
}






















