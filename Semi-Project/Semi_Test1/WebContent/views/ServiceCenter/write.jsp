<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="/views/common/header.jsp" %>

<form action='<%=request.getContextPath() %>/ServiceCenter/Q&A/write' method="post" <%-- enctype="multipart/form-data" --%> >

<div id="QnAcontainer">
    <div class="qtitle">Q&A 작성</div>
    <label class="w-title input-group-text">제목 : <input class="form-control" type="text" name="Que_Title" placeholder="제목을 입력해주세요." required></label>
    <label class="w-writer input-group-text">회원번호 : <input class="form-control" type="text"name="User_Num" id="writer" required value="<%= loginMember.getUserNum() %>" readonly="readonly"></label> <br>
    <textarea class="w-content form-control" name="Que_Content"cols="30" rows="10" placeholder="내용을 입력해주세요." style="resize: none;" required maxlength="666"></textarea>
    <button type="submit" name="btn" class="w-btn btn btn-secondary text-white">작성하기</button>
</div>
</form>



<%@ include file="/views/common/footer.jsp" %>


































