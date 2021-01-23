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
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
<style>
.modal-login {
	color: #636363;
	width: 450px;
}
.modal-login .modal-content {
	padding: 20px;
	border-radius: 5px;
	border: none;
}
.modal-login .modal-header {
	border-bottom: none;
	position: relative;
	justify-content: center;
}
.modal-login h4 {
	text-align: center;
	font-size: 26px;
}
.modal-login  .form-group {
	position: relative;
}
.modal-login i {
	position: absolute;
	left: 13px;
	top: 11px;
	font-size: 18px;
}
.modal-login .form-control {
	padding-left: 40px;
}
.modal-login .form-control:focus {
	border-color: #00ce81;
}
.modal-login .form-control, .modal-login .btn {
	min-height: 40px;
	border-radius: 3px; 
}
.modal-login .hint-text {
	text-align: center;
	padding-top: 10px;
}
.modal-login .close {
	position: absolute;
	top: -5px;
	right: -5px;
}
.modal-login .btn, .modal-login .btn:active {	
	border: none;
	background: #00ce81 !important;
	line-height: normal;
}
.modal-login .btn:hover, .modal-login .btn:focus {
	background: #00bf78 !important;
}
.modal-login .modal-footer {
	background: #ecf0f1;
	border-color: #dee4e7;
	text-align: center;
	margin: 0 -20px -20px;
	border-radius: 5px;
	font-size: 13px;
	justify-content: center;
}
.modal-login .modal-footer a {
	color: #999;
}
.btn {
    -webkit-appearance: button;
    -moz-appearance: button;
    appearance: button;

    text-decoration: none;
    color: initial;
}
</style>
</head>
<body>
	<header>
		<h1 align="center">베프 프로젝트</h1>
		<div class="login-container">
		<% if(loginMember == null) {%>
		<input type="button" value="로그인" id="modalOpen">
		<input type="button" value="회원가입" onclick="location.href = '<%= request.getContextPath() %>/member/enroll';">
		<% } else { %>
		<p><%= loginMember.getUserId() %> 님 안녕하세요.<p> <br>
		<input  type="button" value="마이페이지" onclick="location.href = '<%= request.getContextPath() %>/mypage/mypagehome';">
		<input type="button" value="로그아웃" onclick="location.replace('<%= request.getContextPath() %>/member/logout');">
		<% } %>
		</div>
		<nav id="abc">
			<ul class="main-nav">
				<li class="home"><a href="<%=request.getContextPath()%>">Home</a></li>
				<% if(loginMember != null) {%>
				<li id="notice"><a href="<%= request.getContextPath() %>/mypage/mypagehome">마이페이지</a></li>
				<% } %>
				<li id="board"><a href="<%=request.getContextPath() %>/board/list">게시판</a></li>
				<li id="board"><a href="<%=request.getContextPath() %>/service">고객센터</a></li>
			</ul>
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