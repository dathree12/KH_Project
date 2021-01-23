<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="/views/common/header.jsp" %>

<form action='<%=request.getContextPath() %>/ServiceCenter/Q&A/write' method="post" <%-- enctype="multipart/form-data" --%> >

<div id="QnAcontainer">
    <div class="Qtitle">Q&A 작성</div>
    <label class="title">제목 : <input type="text" name="Que_Title" id="title" placeholder="제목을 입력해주세요."></label> <br>
    <label class="writer">회원번호 : <input type="text"name="User_Num" id="writer"></label> <br>
    <textarea name="Que_Content" id="content" cols="30" rows="10" placeholder="내용을 입력해주세요." style="resize: none;"></textarea>
    <button type="submit" name="btn" class="btn">작성하기</button>
</div>
</form>



<%@ include file="/views/common/footer.jsp" %>


































