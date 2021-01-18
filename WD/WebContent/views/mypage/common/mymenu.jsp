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
<title>마이페이지</title>
<style>

		#mypage-sidebar {
		width: 150px;
		height: 800px;
        padding: 5px;
        margin-bottom: 5px;
        float: left;
        border: 1px solid #bcbcbc;
		}
		
		section {
        margin: 1rem auto;
		width: 800px;
		height: 1000px;
        border: 1px solid black;
	  }
	  
	  #mypage-header {
		padding: 20px;
        margin-bottom: 20px;
        border: 1px solid #bcbcbc;
	  }

	  #mypage-toolbar {
		width: 600px;
		height: 40px;
		float: right;
		padding: 5px;
        margin-bottom: 5px;
		border: 1px solid #bcbcbc;
	  }

	  .mypage-search {
		padding : 5px;
		float: left;
	  }

	  .mypage-sorting {
		padding : 5px;
		position: relative;
		display: inline-block;
	  }

	  .dropdown-button {
		  background-color: #ffdab9;
		  padding: 5px;
		  font-size: 14px;
		  border: none;
	  }

	  .dropdown-content {
		  display: none;
		  position: absolute;
		  background-color: #ffdab9;
		  min-width: 75px;
		  padding : 5px;
		  box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
	  }
	  .dropdown-content a {
		  display : block;
		  padding: 8px;
		  text-decoration: none;
		  color: black;
	  }

	  .dropdown-content a:hover {background-color: #cd853f;}
	  .mypage-sorting:hover .dropdown-content { display : block;}
	  .mypage-sorting:hover .dropdown-content {background-color: #cd853f;}
</style>
<script src="<%=request.getContextPath() %>/js/jquery-3.5.1.min.js"></script>
</head>
<body>
	<section>
		<!--마이페이지 제목섹션-->
		<div id="mypage-header">
			<h1>마이페이지</h1>
		</div>
		<!-- 사이드바 메뉴 (추후에 부트스트랩 등등 이용 ) -->
		<div id="mypage-sidebar">
			<ul>
				<li id="myMenuHome" onclick="location.href = '<%= request.getContextPath() %>/mypage/mypagehome';">마이페이지홈</li>
				<li id="myMenuScrap">레시피스크랩</li>
				<li id="myMenuEdit" onclick="location.href = '<%= request.getContextPath() %>/mypage/edit?userId=<%= loginMember.getUserId() %>';">회원정보수정</li>
				<li id="myMenuDelete">회원탈퇴</li>
			</ul>
		</div>