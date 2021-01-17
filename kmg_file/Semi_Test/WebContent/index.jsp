<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp"%>

<section id="content">
	<button type="button" id="btn-add"
			onclick="location.href ='<%=request.getContextPath() %>/board/write'">글쓰기</button>
				
	<button type="button" id="btn-add"
			onclick="location.href ='<%=request.getContextPath() %>/board/list'">글리스트</button>
			
			<a href="<%=request.getContextPath() %>/board/view?boardNo=50">글읽기</a>
			
			<a href="<%=request.getContextPath()%>/board/delete?boardNo=52">삭제</a>
</section>

<%@ include file="/views/common/footer.jsp"%>
