<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
Member member = (Member)request.getAttribute("member");
%>
<%@ include file="/views/mypage/common/mymenu.jsp" %>
<div class="title">비밀번호수정</div>
        <form name="updatePwdForm" action="<%= request.getContextPath()%>/mypage/updatepwd" method="POST">
        	<input type="text" name="userId" class="hidden" value="<%= loginMember.getUserId() %>" readonly>
            <label>현재 비밀번호 : <input type="password" name="userPwd" required></label> <br><br>
            <label>바꿀 비밀번호 : <input type="password" name="newPwd" id="pwd1" required></label> <br><br>
            <label>비밀번호 확인 : <input type="password" id="pwd2" required></label> <br>
            <span id="validatePwd"></span><br><br>
            <input type="submit" value="비밀번호 수정" id="updatePwdSubmit">
        </form>
</section>

<script>

$("#pwd2").blur((e) => {
	let pwd1 = $("#pwd1").val();
	let pwd2 = $(e.target).val();
	if(pwd1 != ""){
		if(pwd1 == pwd2){
			console.log("pass-true");
			$("#validatePwd").text("패스워드가 일치합니다.").css("color","green");
		}else {
			console.log("pass-false");
			$("#validatePwd").text("패스워드가 일치하지 않습니다.").css("color","red");
			$("#pwd2").val("");
		}
	}
});
</script>
</body>
</html>
<%@ include file="/views/common/footer.jsp"%>