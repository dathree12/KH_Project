<%@page import="java.util.List"%>
<%@page import="com.kh.mvc.ServiceCenter.model.vo.QnA"%>
<%@ page import="java.util.ArrayList" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/views/common/header.jsp" %>    
<%
	QnA qna = (QnA) request.getAttribute("qna");

	System.out.println(qna);
%>

<div id="QnAcontainer">
	<div class="Qtitle viewQtitle">Q&A</div>
	<div class="viewtitle">제목 : <%= qna.getQue_Title() %></div>
	<div class="viewwriter">회원번호 : <%= qna.getUser_Num() %></div>
	<div id="viewQnAContent"><%= qna.getQue_Content() %></div>
</div>
    
    
<%@ include file="/views/common/footer.jsp" %>    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    