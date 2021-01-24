<%@page import="java.util.List"%>
<%@page import="com.kh.ServiceCenter.model.vo.QnA"%>
<%@ page import="java.util.ArrayList" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="/views/common/header.jsp" %>

<%
	QnA qna = (QnA) request.getAttribute("qna");

	System.out.println(qna);
%>

<form action='<%=request.getContextPath() %>/ServiceCenter/Q&A/answer/write' method="post" <%-- enctype="multipart/form-data" --%> >

<div id="QnAcontainer">
    <div class="qtitle">Q&A 답변 작성</div>
    <table id="qex" border="1px slid lightgray"  class="table table-bordered">
        <tr class="qextr">
            <th class="pQtitle qextd">제목</th>
            <td class="qextd"><%= qna.getQue_Title() %></td>
        </tr>
        <tr class="qextr">
            <th class="pQnum qextd">회원번호</th>
            <td class="qextd"><%= qna.getUser_Num() %></td>
        </tr>
        <tr>
            <td colspan="2" class="qextd"><%= qna.getQue_Content() %></td>
        </tr>
    </table>
    <label class="w-title input-group-text">제목 : <input class="form-control" type="text" name="Que_Title" placeholder="제목을 입력해주세요." value="┗ re : " required></label>
    <label class="w-writer input-group-text">회원번호 : <input class="form-control" type="text"name="User_Num" required  value="<%= loginMember.getUserNum() %>" readonly="readonly"></label> <br>
    <textarea name="Que_Content" class="w-content form-control" id="content" cols="30" rows="10" placeholder="내용을 입력해주세요." style="resize: none;" required maxlength="666"></textarea>
    <textarea name="QGROUP" cols="30" rows="10" class="qgroup"><%= qna.getQGROUP() %></textarea>
    <textarea name="STEP" cols="30" rows="10" class="qstep"><%= qna.getSTEP() %></textarea>
    <button type="submit" name="btn" class="w-btn btn btn-secondary">작성하기</button>
</div>
</form>



<%@ include file="/views/common/footer.jsp" %>
























