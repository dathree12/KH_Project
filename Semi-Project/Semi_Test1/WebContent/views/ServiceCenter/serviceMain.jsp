<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp"%>
    
<section id="content">
            <h1>고객센터</h1>
        </div>
        <div id="qna-sidebar">
        	<ul>
            	<li><a href="<%= request.getContextPath()%>/ServiceCenter/Notice">공지사항</a></li>
            	<li><a href="<%= request.getContextPath()%>/ServiceCenter/FAQ">FAQ</a></li>
            	<li><a href="<%= request.getContextPath()%>/ServiceCenter/Q&A">Q&A</a></li>
        	</ul>
    	</div>
</section>
<%@ include file="/views/common/footer.jsp"%>