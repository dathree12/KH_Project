<%@page import="java.util.List"%>
<%@page import="com.kh.ServiceCenter.model.vo.NOTICE"%>
<%@ page import="java.util.ArrayList" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/views/common/header.jsp" %>    
<%
	NOTICE notice = (NOTICE) request.getAttribute("notice");

	System.out.println("nview.jsp-notice : " + notice);
%>

<div id="QnAcontainer" class="qnaview">
	<table id="qex" border="1px slid lightgray" class="table table-bordered">
		<tr class="qextr">
			<th class="pQtitle qextd">제목</th>
			<td class="qextd"><%= notice.getNTITLE() %></td>
		</tr>
		<tr class="qextr">
			<th class="pQnum qextd">회원번호</th>
			<td class="qextd"><%= notice.getUser_Num() %></td>
		</tr>
		<tr>
			<td colspan="2" class="qextd"><%= notice.getNCONTENT() %></td>
		</tr>
	</table>
</div>
    
    
<%@ include file="/views/common/footer.jsp" %> 

































