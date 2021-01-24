<%@page import="com.kh.member.model.vo.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="/views/common/header.jsp"%>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/myPageStyles.css" type="text/css">
	<section class="container">
		<!--마이페이지 제목섹션-->
		<div id="mypage-header">
			<h1>마이페이지</h1>
		</div>
		<!-- 사이드바 메뉴 (추후에 부트스트랩 등등 이용 ) -->
		<div id="mypage-sidebar">
			<ul>
				<li id="myMenuHome" onclick="location.href = '<%= request.getContextPath() %>/mypage/mypagehome';">마이페이지홈</li>
				<li id="myMenuScrap">레시피스크랩</li>
				<li id="myMenuPassword" onclick="location.href = '<%= request.getContextPath() %>/mypage/updatepwd';">비밀번호 변경</li>
				<li id="myMenuUpdate" onclick="location.href = '<%= request.getContextPath() %>/mypage/update?userId=<%= loginMember.getUserId() %>';">회원정보 수정</li>
				<li id="myMenuDelete" onclick="location.href = '<%= request.getContextPath() %>/mypage/delete';">회원탈퇴</li>
			</ul>
		</div>