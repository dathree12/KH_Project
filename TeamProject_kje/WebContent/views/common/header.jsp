<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
	<title>고객센터</title>
	<link rel="stylesheet" href="<%=request.getContextPath() %>/css/style.css">
</head>
<body>

    <section>
    <!--마이페이지 제목섹션-->
    <%--	<li id="board"><a href="<%=request.getContextPath()%>/board/list">게시판</a></li>--%>
        <div id="qna-header">
            <h1>고객센터</h1>
        </div>
        <div id="qna-sidebar">
        	<ul>
            	<li><a href="<%= request.getContextPath()%>/ServiceCenter/Notice">공지사항</a></li>
            	<li><a href="<%= request.getContextPath()%>/ServiceCenter/FAQ">FAQ</a></li>
            	<li><a href="<%= request.getContextPath()%>/ServiceCenter/Q&A">Q&A</a></li>
        	</ul>
    	</div>