<%@page import="com.kh.vef.member.model.vo.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
Member loginMember = (Member)session.getAttribute("loginMember");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<% if(loginMember == null) {%>
<input type="button" value="로그인" onclick="location.href = '<%= request.getContextPath() %>/member/login';">
<input type="button" value="회원가입" onclick="location.href = '<%= request.getContextPath() %>/member/enroll';">
<% } else { %>
<p><%= loginMember.getUserId() %> 님 안녕하세요.<p> <br>
<input type="button" value="마이페이지" onclick="location.href = '<%= request.getContextPath() %>/mypage/mypagehome';">
<input type="button" value="로그아웃" onclick="location.replace('<%= request.getContextPath() %>/member/logout');">
<% } %>
</body>
</html>