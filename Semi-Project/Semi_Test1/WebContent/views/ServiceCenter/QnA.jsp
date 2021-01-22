<%@page import="com.kh.common.util.PageInfo"%>
<%@page import="com.kh.ServiceCenter.model.vo.QnA"%>
<%@page import="java.util.List"%>
<%@ page import="java.util.ArrayList" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="/views/common/header.jsp" %>
    
<%
	List<QnA> list = (ArrayList) request.getAttribute("list");
	PageInfo pageInfo = (PageInfo) request.getAttribute("pageInfo");
	
	System.out.println(list);
%>    

		<!--사이드바 옆 div-->
		<div id="rightdiv">
		<!--검색창, 필터, 등등 도구섹션 -->
			<div id="board-name">
				<h3>Q&A</h3>
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
					<button type="button" onclick="location.href ='<%=request.getContextPath() %>/ServiceCenter/Q&A/write'">글쓰기</button>
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
							<th></th>
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
			  			for(QnA qna : list) {
					%>
						<tr>
							<td><%= qna.getQue_Num() %></td>
							<td id="listqnatitle">
								<a href="<%=request.getContextPath() %>/ServiceCenter/Q&A/view?Que_Num=<%= qna.getQue_Num() %>">
									<%= qna.getQue_Title() %>
								</a>
							</td>
							<td><%= qna.getUser_Num() %></td>
							<td><%= qna.getQue_Date() %></td>
							<td><%= qna.getHIT() %></td>
							<td><button type="button" onclick="location.href ='<%=request.getContextPath() %>/ServiceCenter/Q&A/answer/write?Que_Num=<%= qna.getQue_Num() %>'">답변쓰기</button></td>
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







