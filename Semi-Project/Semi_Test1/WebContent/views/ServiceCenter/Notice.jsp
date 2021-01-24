<%@page import="com.kh.common.util.PageInfo"%>
<%@page import="com.kh.ServiceCenter.model.vo.NOTICE"%>
<%@page import="java.util.List"%>
<%@ page import="java.util.ArrayList" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="/views/common/header.jsp" %>
    
<%
	List<NOTICE> list = (ArrayList) request.getAttribute("list");
	PageInfo pageInfo = (PageInfo) request.getAttribute("pageInfo");
	
	System.out.println(list);
%>    

		<!--사이드바 옆 div-->
		<div id="rightdiv">
		<!--검색창, 필터, 등등 도구섹션 -->
			<div id="board-name">
				<h3>공지사항</h3>
			</div>
			<% if(loginMember != null) { %>
				<% if(loginMember.getUserId().equals("admin")) { %>
					<div id="qna-toolbar">
						<div>
							<button id="QnAbtn" class="btn btn-dark text-white"  type="button" onclick="location.href ='<%=request.getContextPath() %>/ServiceCenter/Notice/write'">글쓰기</button>
						</div>
					</div>	
				<% } %>
			<% } %>
			<div>
				<table id="board-table"  class="table table-striped">
					<thead>
						<tr>
							<th>번호</th>
							<th>제목</th>
							<th>회원번호</th>
							<th>등록날짜</th>
							<th>조회수</th>
						</tr>
					</thead>
					<tbody>
					<% if(list.isEmpty()) { %>		
					<tr>
						<td colspan="6">
							조회된 공지사항이 없습니다.
						</td>
					</tr>	
					<% } else {
			  			for(NOTICE notice : list) {
					%>
						<tr>
							<td><%= notice.getNNUM() %></td>
							<td id="listqnatitle">
								<a href="<%=request.getContextPath() %>/ServiceCenter/Notice/view?NNUM=<%= notice.getNNUM() %>">
									<%= notice.getNTITLE() %>
								</a>
							</td>
							<td><%= notice.getUser_Num() %></td>
							<td><%= notice.getNDATE() %></td>
							<td><%= notice.getNHIT() %></td>
						</tr> 
					<% }
		   			  } %>
					</tbody>
				</table>
			</div>
		</div>

	<%@ include file="/views/common/footer.jsp" %>


































