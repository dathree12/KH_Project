<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp"%>
    
<section id="content">
        	<div>
				<div class="dropdown-header">고객센터</div>
            	<a class="dropdown-item" href="<%= request.getContextPath()%>/ServiceCenter/Notice">공지사항</a>
            	<a class="dropdown-item" href="<%= request.getContextPath()%>/ServiceCenter/FAQ">FAQ</a>
            	<a class="dropdown-item" href="<%= request.getContextPath()%>/ServiceCenter/Q&A">Q&A</a>
        	</div>
</section>
<%@ include file="/views/common/footer.jsp"%>