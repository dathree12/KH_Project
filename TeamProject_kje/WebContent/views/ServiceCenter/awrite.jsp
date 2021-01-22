<%@page import="java.util.List"%>
<%@page import="com.kh.mvc.ServiceCenter.model.vo.QnA"%>
<%@ page import="java.util.ArrayList" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="/views/common/header.jsp" %>
<%@ include file="/views/common/sidebar.jsp" %>

<%
	QnA qna = (QnA) request.getAttribute("qna");

	System.out.println(qna);
%>


<%--<div id="QnAcontainer">--%>
<%--    <div class="Qtitle viewQtitle">Q&A</div>--%>
<%--    <div class="viewtitle">제목 : <%= qna.getQue_Title() %></div>--%>
<%--    <div class="viewwriter">회원번호 : <%= qna.getQue_Num() %></div>--%>
<%--    <div id="viewQnAContent"><%= qna.getQue_Content() %></div>--%>
<%--</div>--%>


<form action='<%=request.getContextPath() %>/ServiceCenter/Q&A/answer/write' method="post" <%-- enctype="multipart/form-data" --%> >

<div id="QnAcontainer">
    <div class="Qtitle">Q&A 답변 작성</div>
    <table id="qex" border="1px slid lightgray">
        <tr class="qextr">
            <td class="pQtitle qextd">제목</td>
            <td class="qextd"><%= qna.getQue_Title() %></td>
        </tr>
        <tr class="qextr">
            <td class="pQnum qextd">회원번호</td>
            <td class="qextd"><%= qna.getUser_Num() %></td>
        </tr>
        <tr>
            <td colspan="2" class="qextd"><%= qna.getQue_Content() %></td>
        </tr>
    </table>
    <label class="title">제목 : <input type="text" name="Que_Title" id="title" placeholder="제목을 입력해주세요." value="┗ "></label> <br>
    <label class="writer">회원번호 : <input type="text"name="User_Num" id="writer"></label> <br>
    <textarea name="Que_Content" id="content" cols="30" rows="10" placeholder="내용을 입력해주세요." style="resize: none;"></textarea>
    <textarea name="QGROUP" cols="30" rows="10" class="qgroup"><%= qna.getQGROUP() %></textarea>
    <textarea name="STEP" cols="30" rows="10" class="qstep"><%= qna.getSTEP() %></textarea>
    <button type="submit" name="btn" class="btn">작성하기</button>
</div>
</form>



<%@ include file="/views/common/footer.jsp" %>
























