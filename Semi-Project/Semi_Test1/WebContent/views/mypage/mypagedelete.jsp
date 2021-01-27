<%@page import="com.kh.member.model.vo.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp"%>
    
	<link rel="stylesheet" href="<%=request.getContextPath() %>/css/myPageStyles.css" type="text/css">
	
	<section id="myPage-container" class="container-md d-flex justify-content-center CS1">
	        <form name="memberDelete" action="<%= request.getContextPath()%>/mypage/delete" method="POST">
	        <div class="form-group">
	        <h1 class="CS2">회원탈퇴</h1>
	        </div>
            <div class="form-group">
				<input type="text" name="userId" class="hidden" value="<%= loginMember.getUserId() %>" readonly>
            	<label class="mpLabel" for="userPwd">비밀번호</label>
            	<input type="password" name="userPwd" required>
            </div>
            <button type="submit" class="btn btn-primary">회원탈퇴</button>
            </form>
    </section>

</body>
</html>
<%@ include file="/views/common/footer.jsp"%>