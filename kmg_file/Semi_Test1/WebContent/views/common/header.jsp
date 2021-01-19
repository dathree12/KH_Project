<%@page import="com.kh.member.model.vo.Member"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String saveId = null;
	Member loginMember = (Member)session.getAttribute("loginMember");
	Cookie[] cookies = request.getCookies();
	
	// 쿠키값 받아오기	
	if (cookies != null) {
		for (Cookie c : cookies) {
			if(c.getName().equals("saveId")) {
				saveId = c.getValue();
				
				break;
			}
		}
	}

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/style.css" type="text/css">
<script src="<%=request.getContextPath() %>/js/jquery-3.5.1.js"></script>
</head>
<body>
	<header>
		<h1 align="center">베프 프로젝트</h1>
		<div class="login-container">
			<form id="loginFrm" action="<%= request.getContextPath()%>/login" method="post">
				<table>
					<tr>
						<td>
							<input type="text" name="userId" id="userId" value="" 
									placeholder="아이디" required>
						</td>
						<td></td>
					</tr>
					<tr>
						<td>
							<input type="password" name="userPwd" id="userPwd" placeholder="비밀번호" required>
						</td>
						<td>
							<input type="submit" value="로그인">						
						</td>
					</tr>
				</table>
			</form>
				<table>
					<tr>
						<td>
							<input type="button" value="로그아웃" onclick="location.replace('<%= request.getContextPath() %>/logout');">
							<input type="button" value="회원가입" onclick="location.href = '<%= request.getContextPath() %>/member/enroll';"> 
						</td>
					</tr>
				</table>
		</div>
		<nav id="abc">
			<ul class="main-nav">
				<li class="home"><a href="<%=request.getContextPath()%>">Home</a></li>
				<li id="notice"><a href="<%= request.getContextPath() %>/mypage/mypagehome">마이페이지</a></li>
				<li id="board"><a href="<%=request.getContextPath() %>/board/list">게시판</a></li>
			</ul>
		</nav>
	</header>