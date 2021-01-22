<%@page import="java.util.List"%>
<%@page import="com.kh.mvc.ServiceCenter.model.vo.NOTICE"%>
<%@ page import="java.util.ArrayList" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/views/common/header.jsp" %>
<%@ include file="/views/common/sidebar.jsp" %>   
<%
	NOTICE notice = (NOTICE) request.getAttribute("notice");

	System.out.println("nview.jsp-notice : " + notice);
%>

<div id="QnAcontainer">
	<div class="Qtitle viewQtitle">공지사항</div>
	<div class="viewtitle">제목 : <%= notice.getNTITLE() %></div>
	<div class="viewwriter">회원번호 : <%= notice.getUser_Num() %></div>
	<div id="viewQnAContent"><%= notice.getNCONTENT() %></div>
</div>
    
    
<%@ include file="/views/common/footer.jsp" %> 

































