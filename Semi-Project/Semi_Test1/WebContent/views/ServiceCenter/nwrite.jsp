<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="/views/common/header.jsp" %>

<form action='<%=request.getContextPath() %>/ServiceCenter/Notice/write' method="post" <%-- enctype="multipart/form-data" --%> >

<div id="QnAcontainer">
    <div class="qtitle">공지사항 작성</div>
    <label class="ntitle w-title input-group-text">제목 : <input class="form-control" type="text" name="NTITLE" placeholder="제목을 입력해주세요." required></label> <br>
    <label class="nnum w-title input-group-text">회원번호 : <input class="form-control" type="text"name="User_Num" id="writer" required  value="<%= loginMember.getUserNum() %>" readonly></label> <br>
    <textarea name="NCONTENT" id="content" class="w-content form-control" cols="30" rows="10" placeholder="내용을 입력해주세요." style="resize: none;" required maxlength="666"></textarea>
    <button type="submit" name="btn" class="w-btn btn btn-secondary">작성하기</button>
</div>
</form>



<%@ include file="/views/common/footer.jsp" %>