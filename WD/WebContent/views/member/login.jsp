<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String saveId = null;
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
</head>
<body>
        <form id="loginForm" action="<%= request.getContextPath()%>/member/login" method="POST">
            <label id="id">아이디 : <input type="text" name="userId" placeholder="아이디를 입력하세요." value="<%= saveId == null ? "" : saveId %>" required></label> <br>
            <label><input type="checkbox" name="saveId" <%= saveId == null ? "" : "checked" %>>아이디 저장</label> <br>
            <label id="pwd">비밀번호 : <input type="password" name="userPwd" placeholder="비밀번호를 입력하세요." required></label> <br>
            <input type="submit" value="로그인" id="login">
        </form>
        <p>아직 회원이 아니신가요?</p>
        <a onclick="location.href = '<%= request.getContextPath() %>/member/enroll';">회원가입하기</a>
</body>
</html>