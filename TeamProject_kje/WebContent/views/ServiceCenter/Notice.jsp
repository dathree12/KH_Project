<%@page import="com.kh.mvc.common.util.PageInfo"%>
<%@page import="com.kh.mvc.ServiceCenter.model.vo.NOTICE"%>
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
			<div id="qna-toolbar"> 
				<!--검색창-->
				<div id="qna-search">
					<span>
						<input type='text' class='' />
					</span>
					<button type='submit' class=''>검색</button>
				</div>
				<div id="writing">
					<button type="button" onclick="location.href ='<%=request.getContextPath() %>/ServiceCenter/Notice/write'">글쓰기</button>
				</div>	
			</div>
			<div>
				<table id="board-table">
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
							조회된 Q&A가 없습니다.
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
			<div class="page">
				<button><</button>
				<button>1</button>
				<button>2</button>
				<button>3</button>
				<button>4</button>
				<button>5</button>
				<button>6</button>
				<button>7</button>
				<button>8</button>
				<button>9</button>
				<button>10</button>
				<button>></button>
			</div>
		</div>

	<%@ include file="/views/common/footer.jsp" %>


































