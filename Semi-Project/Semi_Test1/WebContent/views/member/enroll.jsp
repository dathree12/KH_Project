<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp"%>
    <style>
    	.CS1{
    		background-color: rgba(201, 252, 191, 0.2);
    		-webkit-box-shadow: 2px 2px 2px 2px rgba(0,0,0,0.6); 
			box-shadow: 2px 2px 2px 2px rgba(0,0,0,0.6);
    		width: 600px;
    		padding: 20px;
    		margin: 20px auto;
    		border-radius: 25px;
    	}
    	form > .CS2 {
	    	text-align: center;
    	}
    	label {
    		min-width: 120px;
    		margin: 0px 30px;
    	}
    	h1 {
    		text-align: center;
    	}
    	input[type="radio"] {
    	margin-left : 25px;
    	}
    	span {
    	font-size: small;
    	margin-left: 195px;
    	}
    	button.btn.btn-primary{
    		width:350px;
    		text-align: center;
    		display: block;
    		margin: auto;
    	}
    </style>
    <section id="signup-container" class="container-md d-flex justify-content-center CS1">
        <form name="enrollForm" action="<%= request.getContextPath()%>/member/enroll" method="POST">
	        <h1 class="CS2">회원가입</h1>
	            <span id="validateMsg"></span>
            <div class="form-group">
            	<label for="userId">아이디</label>
            	<input type="text" name="userId" id="newId" required>
            	<input type="button" id="validateBtn" value="중복확인">
            </div>
	            <span id="validatePwd"></span>
	        <div class="form-group">
	            <label for="userPwd">비밀번호</label>
				<input type="password" name="userPwd" id="pwd1" required><br><br>
	            <label>비밀번호 확인</label>
	            <input type="password" id="pwd2" required>
            </div>
            <div class="form-group">
	            <label for="userEmail">이메일</label>
	            <input type="email" name="userEmail" required>
            </div>
            <div class="form-group">
	            <fieldset>
	            	<legend>선호 채식</legend>
		            <div id="radio-container">
		                <div><input type="radio" name="vegType" value="v1" id="v1"><label for="v1">비건</label></div>
		                <div><input type="radio" name="vegType" value="v2" id="v2"><label for="v2">락토 베지테리언</label></div>
		                <div><input type="radio" name="vegType" value="v3" id="v3"><label for="v3">오보 베지테리언</label></div>
		                <div><input type="radio" name="vegType" value="v4" id="v4"><label for="v4">락토/오보 베지테리언</label></div>
		                <div><input type="radio" name="vegType" value="v5" id="v5"><label for="v5">페스코테리언</label></div>
		                <div><input type="radio" name="vegType" value="v6" id="v6"><label for="v6">플렉시테리언</label></div>
		                <div><input type="radio" name="vegType" value="v0" checked="checked" id="v0"><label for="v0">없음</label></div>
	           	    </div>
           	    </fieldset>
	        </div>
	        	<button type="submit" class="btn btn-primary">가입하기</button>
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
<%@ include file="/views/common/footer.jsp"%>