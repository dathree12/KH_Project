<%@page import="java.util.List"%>
<%@page import="com.kh.ServiceCenter.model.vo.QnA"%>
<%@ page import="java.util.ArrayList" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/views/common/header.jsp" %>    
<%
	QnA qna = (QnA) request.getAttribute("qna");

	System.out.println(qna);
%>

<div id="QnAcontainer" class="qnaview">
	<table id="qex" border="1px slid lightgray" class="table table-bordered">
		<tr class="qextr">
			<th class="pQtitle qextd">제목</th>
			<td class="qextd"><%= qna.getQue_Title() %></td>
		</tr>
		<tr class="qextr">
			<th class="pQnum qextd">회원번호</th>
			<td class="qextd"><%= qna.getUser_Num() %></td>
		</tr>
		<tr>
			<td colspan="2" class="qextd"><%= qna.getQue_Content() %></td>
		</tr>
	</table>
</div>
    
    
<%@ include file="/views/common/footer.jsp" %>    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    