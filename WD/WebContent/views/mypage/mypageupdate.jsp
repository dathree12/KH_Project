<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
Member member = (Member)request.getAttribute("member");
String vcheck = member.getVegType();
%>
<%@ include file="/views/mypage/common/mymenu.jsp" %>
<div class="title">회원정보수정</div>
        <form name="enrollForm" action="<%= request.getContextPath()%>/mypage/update" method="POST">
        	<input type="text" name="userId" id="hiddenId" value="<%= member.getUserId() %>" readonly>
            <label>이메일 : <input type="email" name="userEmail" value="<%= member.getEmail() %>" required></label> <br><br>
            <label>닉네임 : <input type="text" name="userName" value="<%= member.getUserName() %>" required></label> <br><br>
            <label class="under">선호 채식 : </label>
            <div id="radio-container">
                <label><input type="radio" name="vegType" value="v1" id="v1">비건</label>
                <label><input type="radio" name="vegType" value="v2" id="v2">락토/오보베지테리언</label>
                <label><input type="radio" name="vegType" value="v3" id="v3">페스코테리언</label>
                <label><input type="radio" name="vegType" value="v4" id="v4">플렉시테리언</label>
                <label><input type="radio" name="vegType" value="v0" id="v0">없음</label>
            <input type="submit" value="회원정보 수정" id="enrollSubmit">
        </form>
</div>
</section>

<script>
	
	$(document).ready(() => {
		$("#<%= vcheck %>").prop("checked", true);
	});
</script>
</body>
</html>