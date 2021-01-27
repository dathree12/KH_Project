<%@page import="com.kh.member.model.vo.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp"%>
    
	<link rel="stylesheet" href="<%=request.getContextPath() %>/css/myPageStyles.css" type="text/css">
	
<%
	String vt = loginMember.getVegType();
	char vtChar = vt.charAt(1);
	String vtPrint = "";
	switch (vtChar) {
	case '0' : vtPrint = "없음"; break;
	case '1' : vtPrint = "비건"; break;
	case '2' : vtPrint = "락토/오보베지테리언"; break;
	case '3' : vtPrint = "페스코테리언"; break;
	case '4' : vtPrint = "플렉시테리언"; break;
	}
	%>

    <section id="myPage-container" class="container-md d-flex justify-content-center CS1">
	        <form>
	        <div class="form-group">
	        <h1 class="CS2">마이페이지 홈</h1>
	        </div>
            <div class="form-group">
            	<label class="mpLabel" for="userId">아이디</label>
            	<p id="userId"><%= loginMember.getUserId() %></p>
            </div>
	        <div class="form-group">
	            <label class="mpLabel" for="userEmail">이메일</label>
				<p id="userEmail"><%= loginMember.getEmail() %></p>
            </div>
            <div class="form-group">
	            <label class="mpLabel" for="vtPrint">선호채식</label>
	            <p id="vtPrint"></p>
            </div>
            </form>
    </section>

<script>
	$(document).ready(() => {
		$("#vtPrint").text("<%= vtPrint %>");
	});
</script>
</body>
</html>
<%@ include file="/views/common/footer.jsp"%>