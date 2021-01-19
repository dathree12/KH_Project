<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
Member member = (Member)request.getAttribute("member");
%>
<%@ include file="/views/mypage/common/mymenu.jsp" %>
<div class="title">회원탈퇴</div>
        <form name="memberDelete" action="<%= request.getContextPath()%>/mypage/delete" method="POST">
        	<input type="text" name="userId" class="hidden" value="<%= loginMember.getUserId() %>" readonly>
            <label>비밀번호 : <input type="password" name="userPwd" required></label> <br><br>
            <input type="submit" value="회원탈퇴" id="submitDelete">
        </form>
</section>
</body>
</html>