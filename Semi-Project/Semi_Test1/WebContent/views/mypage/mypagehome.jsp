<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/mypage/common/mymenu.jsp" %>
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
<h1>마이페이지 홈</h1>
<div>
<h2>내 정보</h2>
<table>
<tr>
	<th>아이디</th>
	<td><%= loginMember.getUserId() %></td>
</tr>
<tr>
	<th>이메일</th>
	<td><%= loginMember.getEmail() %></td>
</tr>
<tr>
	<th>선호채식</th>
	<td id="vtPrint"></td>
</tr>
</table>
</div>
<div>
<h2>(옵션)스크랩 미리보기 4개</h2>
</div>
</section>
<script>
	$(document).ready(() => {
		$("#vtPrint").text("<%= vtPrint %>");
	});
</script>
</body>
</html>
<%@ include file="/views/common/footer.jsp"%>