<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Enroll</title>
    <script src="<%=request.getContextPath() %>/js/jquery-3.5.1.js"></script>
    </head>
    <body>
    <section id="signup-container">
        <div class="title">회원가입</div>
        <form name="enrollForm" action="<%= request.getContextPath()%>/member/enroll" method="POST">
            <label>아이디 : <input type="text" name="userId" id="newId" required></label><input type="button" id="validateBtn" value="중복확인"><br>
            <span id="validateMsg"></span><br><br>
            <label>비밀번호 : <input type="password" name="userPwd" id="pwd1" placeholder="n글자 이상, 특수문자를 포함해야합니다." required></label> <br><br>
            <label>비밀번호 확인 : <input type="password" id="pwd2" required></label><br>
            <span id="validatePwd"></span><br><br>
            <label>이메일 : <input type="email" name="userEmail" required></label> <br><br>
            <label class="under">선호 채식 : </label>
            <div id="radio-container">
                <label><input type="radio" name="vegType" value="v1">비건</label>
                <label><input type="radio" name="vegType" value="v2">락토/오보베지테리언</label>
                <label><input type="radio" name="vegType" value="v3">페스코테리언</label>
                <label><input type="radio" name="vegType" value="v4">플렉시테리언</label>
                <label><input type="radio" name="vegType" value="v0" checked="checked">없음</label>
            </div>
            <input type="submit" value="가입하기" id="enrollSubmit">
        </form>
        <form name="checkIdForm">
	 		<input type="hidden" name="userId">
	 	</form>
    </section>
	<script>
		
	$(document).ready(() => {
		// 아이디 중복 확인
		
		$("#validateBtn").on("click", () => {
			// 중복확인전에 아이디 값이 4글자 이상인지 확인
			let id = $("#newId").val().trim();
			
			if (id.length < 4) {
				$("#validateMsg").text("아이디는 4글자 이상이어야 합니다.").css("color","red");
				return;
			}
		
			const url = "<%= request.getContextPath()%>/member/checkId";
			const title = "duplicate";
			const status = "left=500px,top=100px,width=300px,height=200px";
			
			open("", title, status);
			
			// form에 데이터들을 채우고 open된 윈도우에서 결과를 받는 로직을 구성한다.
			// 자바스크립트에서 form은 name 속성으로 요소를 가져올 수 있다.
			checkIdForm.target = title;
			checkIdForm.action = url;
			checkIdForm.method = "post";
			checkIdForm.userId.value = id;
			
			checkIdForm.submit();
		});

		//	패스워드 일치 확인
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
		
		$("#enrollSubmit").on("click", () => {
			// TODO 전송하기 전에 각 영역에 유효성 검사!
			//alert("유요성 검사 후 전송하도록 만들어보세요^^");
			
			//return false;
		});
	});
</script>
</body>
</html>