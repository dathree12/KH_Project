<%@page import="com.kh.member.model.vo.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp"%>
    
	<link rel="stylesheet" href="<%=request.getContextPath() %>/css/myPageStyles.css" type="text/css">
	
	<section id="myPage-container" class="container-md d-flex justify-content-center CS1">
	        <form name="updatePwdForm" action="<%= request.getContextPath()%>/mypage/updatepwd" method="POST">
	        <div class="form-group">
	        <h1 class="CS2">비밀번호 변경</h1>
	        </div>
            <div class="form-group">
				<input type="text" name="userId" class="hidden" value="<%= loginMember.getUserId() %>" readonly>
            	<label class="mpLabel" for="userPwd">현재 비밀번호</label>
            	<input type="password" name="userPwd" required>
            </div>
            <div class="form-group">
            	<label class="mpLabel" for="newPwd">변경할 비밀번호</label>
            	<input type="password" name="newPwd" id="pwd1" required>
            </div>
            <div class="form-group">
            	<label class="mpLabel" for="pwd2">비밀번호 확인</label>
	            <input type="password" id="pwd2" required><br>
            	<span id="validatePwd"></span>
            </div>
            <button type="submit" class="btn btn-primary">비밀번호 변경</button>
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