<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp"%>

<section id="content">
	
	<button type="button" id="btn-add"
			onclick="location.href ='<%=request.getContextPath() %>/board/write'" onfocus="checklogin()">글쓰기</button>
			
	<button type="button" id="btn-add"
			onclick="location.href ='<%=request.getContextPath() %>/board/list'">글리스트</button>
			
			<a href="<%=request.getContextPath() %>/board/view?boardNo=1">글읽기</a>
			
			<a href="<%=request.getContextPath()%>/board/delete?boardNo=52">삭제</a>
			
			
			<script type="text/javascript">
			function checklogin() {
				if(<%= loginMember == null %>){
					alert("로그인 후 이용해주세요!");
					$("#userId").focus();
				}
			}
			</script>
</section>

<%@ include file="/views/common/footer.jsp"%>
