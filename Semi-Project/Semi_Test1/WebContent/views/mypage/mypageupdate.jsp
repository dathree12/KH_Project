<%@page import="com.kh.member.model.vo.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp"%>

<%
String vcheck = loginMember.getVegType();
%>
    
	<link rel="stylesheet" href="<%=request.getContextPath() %>/css/myPageStyles.css" type="text/css">
	
	<section id="myPage-container" class="container-md d-flex justify-content-center CS1">
	        <form name="enrollForm" action="<%= request.getContextPath()%>/mypage/update" method="POST">
	        <div class="form-group">
	        <h1 class="CS2">회원정보수정</h1>
	        </div>
            <div class="form-group">
				<input type="text" name="userId" class="hidden" value="<%= loginMember.getUserId() %>" readonly>
            	<label class="mpLabel" for="userEmail">이메일</label>
            	<input type="email" name="userEmail" value="<%= loginMember.getEmail() %>" required>
            </div>
            <div class="form-group radio-container">
            <label class="mpLabel" for="vegType">선호 채식</label>
            <table>
            	<tr>
            		<td><label class="vtLabel"><input type="radio" name="vegType" value="v1" id="v1">비건</label></td>
            		<td><label class="vtLabel"><input type="radio" name="vegType" value="v2" id="v2">락토 베지테리언</label></td>
            		<td><label class="vtLabel"><input type="radio" name="vegType" value="v3" id="v3">오보 베지테리언</label></td>
            	</tr>
            	<tr>
            		<td><label class="vtLabel"><input type="radio" name="vegType" value="v4" id="v4">락토/오보 베지테리언</label></td>
            		<td><label class="vtLabel"><input type="radio" name="vegType" value="v5" id="v5">페스코테리언</label></td>
            		<td><label class="vtLabel"><input type="radio" name="vegType" value="v6" id="v6">플렉시테리언</label></td>
            		<td><label class="vtLabel"><input type="radio" name="vegType" value="v0" id="v0">없음</label></td>
            	</tr>
            </table>
            </div>
            <button type="submit" class="btn btn-primary">회원정보 수정</button>
            </form>
    </section>
<script>	
	$(document).ready(() => {
		$("#<%= vcheck %>").prop("checked", true);
	});
</script>
</body>
</html>
<%@ include file="/views/common/footer.jsp"%>