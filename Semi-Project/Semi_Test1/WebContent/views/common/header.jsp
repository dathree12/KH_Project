<%@page import="com.kh.member.model.vo.Member"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	Member loginMember = (Member)session.getAttribute("loginMember");
	Cookie[] cookies = request.getCookies();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Vegan Friends</title>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/style.css" type="text/css">
<script src="<%=request.getContextPath() %>/js/jquery-3.5.1.js"></script>
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/headerStyles.css">
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
</head>
<body>
	<header>
		<div>
			<img src="<%=request.getContextPath() %>/image/LogoTemp.PNG" alt="VeganFriends" class="mainLogo">
		</div>
		<nav class="navbar navbar-expand-lg navbar-light bg-warning">
        <a class="navbar-brand" href="<%=request.getContextPath()%>">비건 프랜즈</a>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav ml-auto topnav">
                <li class="nav-item">
                    <a class="nav-link" href="<%=request.getContextPath()%>">Home</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="<%=request.getContextPath() %>/board/list">레시피 게시판</a>
                </li>
                <% if(loginMember != null) {%>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="<%= request.getContextPath() %>/mypage/mypagehome" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        마이페이지
                    </a>
                    <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                        <a class="dropdown-item" href="<%= request.getContextPath() %>/mypage/mypagehome">마이페이지 홈</a>
                        <a class="dropdown-item" href="<%= request.getContextPath() %>/mypage/updatepwd">비밀번호 변경</a>
                        <a class="dropdown-item" href="<%= request.getContextPath() %>/mypage/update?userId=<%= loginMember.getUserId() %>">회원정보 수정</a>
                        <div class="dropdown-divider"></div>
                        <a class="dropdown-item" href="<%= request.getContextPath() %>/mypage/delete">회원탈퇴</a>
                    </div>
                </li>
                <% } %>
                <li class="nav-item">
                    <a class="nav-link" href="<%=request.getContextPath() %>/service">고객센터</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">소개</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">연락처</a>
                </li>
                <% if(loginMember == null) {%>
                <li class="nav-item">
                    <a class="nav-link btn btn-primary text-white" type="button" id="modalOpen" data-toggle="modal" data-target="#myModal">로그인</a>                  
                </li>
                <li class="nav-item">
                    <a class="nav-link btn btn-success text-white" type="button" href="<%= request.getContextPath() %>/member/enroll">회원가입</a>
                </li>
                <% } else { %>
                <li class="nav-item">
                    <a class="nav-link btn btn-secondary text-white" type="button" href="<%= request.getContextPath() %>/mypage/mypagehome"><%= loginMember.getUserId() %></a>
                </li>
                <li class="nav-item">
                    <a class="nav-link btn btn-danger text-white" type="button" onclick="location.replace('<%= request.getContextPath() %>/member/logout');" data-toggle="modal" data-target="#myModal">로그아웃</a>
                </li>
                <% } %>
            </ul>
        </div>
        </nav>
	</header>

	<!-- Modal -->

<div id="myModal" class="modal fade">
	<div class="modal-dialog modal-login">
		<div class="modal-content">
			<div class="modal-header">
				<h4 class="modal-title">회원 로그인</h4>
				<button type="button" id="modalClose" class="close" aria-hidden="true">&times;</button>
			</div>
			<div class="modal-body">
				<form action="<%= request.getContextPath()%>/member/login" method="POST">
					<div class="form-group">
						<i class="fa fa-user"></i>
						<input type="text" class="form-control" name="userId" placeholder="아이디" required>
					</div>
					<div class="form-group">
						<i class="fa fa-lock"></i>
						<input type="password" class="form-control" name="userPwd" placeholder="비밀번호" required>
					</div>
					<div class="form-group">
						<input type="submit" class="btn btn-primary btn-block btn-lg" value="Login">
					</div>
				</form>
			</div>
			<div class="modal-footer">
				<a href="<%= request.getContextPath() %>/member/enroll">아직 회원이 아니신가요?</a>
			</div>
		</div>
	</div>
</div>
<script>
$('#modalOpen').on('click', function(e) {
    e.preventDefault();
    $("#myModal").modal('show');
});
$('#modalClose').on('click', function(e) {
    e.preventDefault();
    $("#myModal").modal('hide');
});
</script>