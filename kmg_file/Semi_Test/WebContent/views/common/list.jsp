<%@page import="com.kh.board.model.vo.Board"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
    
<%@ include file="/views/common/header.jsp" %>

<%
	List<Board> list = (ArrayList) request.getAttribute("list");
	System.out.println(list);
%>
<section id="content">
	<h2 align="center">게시판 </h2>
	<div id="board-container">
	
		<button type="button" id="btn-add" onclick="location.href ='<%=request.getContextPath() %>/board/write'">글쓰기</button>
	
		<table id="tbl-board">
			<tr>
				<th>제목</th>
				<th>작성일</th>
				<th>첨부파일</th>
			</tr>
		<% for(Board board : list) { %>
			<tr>
				<td>
					<%= board.getBoardTitle() %>
				</td>
				<td><%= board.getBoardCreateDate() %></td>
				<td>
					<%=board.getBoardImageFile() %>
				</td>
			</tr>		
		<%    }%>
		
		</table>
		
	</div>
</section>
<%@ include file="/views/common/footer.jsp" %>