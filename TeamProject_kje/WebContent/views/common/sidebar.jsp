<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <div id="qna-header">
            <h1>고객센터</h1>
        </div>
        <div id="qna-sidebar" class="content">
        	<ul>
            	<li><a href="<%= request.getContextPath()%>/ServiceCenter/Notice">공지사항</a></li>
            	<li><a href="<%= request.getContextPath()%>/ServiceCenter/FAQ">FAQ</a></li>
            	<li><a href="<%= request.getContextPath()%>/ServiceCenter/Q&A">Q&A</a></li>
        	</ul>
    	</div>