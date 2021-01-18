<%@page import="com.kh.board.model.vo.Board"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <% 
 	Board board = (Board)request.getAttribute("board");
 %>
  
<%@ include file="/views/common/header.jsp" %>
<section id="content">
	<form action='<%=request.getContextPath()%>/board/update' method="post">
		<input type="hidden" name="boardNo" value="<%=board.getBoardNo()%>">
		<table id='board-table'>
			<tr>
				<th>제목</th>
				<td><input type="text" id="title" name="title" value="<%= board.getBoardTitle() %>"></td>
			</tr>
			<tr>
				<th>비건종류</th>
				<td>
					<div action="" id="vegan-box1">
						<input type="radio" id="vegan-check" value="비건" name="veganlist">비건 &nbsp; <input type="radio" id="vegan-check" value="락토 베지테리언" name="veganlist">락토 &nbsp; 
						<input type="radio" id="vegan-check" value="오보 베지테리언" name="veganlist">오보 &nbsp; <input type="radio" id="vegan-check" value="락토 오보 베지테리언" name="veganlist">락토오보 &nbsp;
						<input type="radio" id="vegan-check" value="페스코 베지테리언" name="veganlist">페스코 &nbsp; 
					</div>
				</td>
			</tr>
			<tr>
				<th>상황별</th>
				<td>
					<div action="" id="vegan-box2">
						<input type="checkbox" id="vegan-check" value="건강식" name="situation">건강식 &nbsp; <input type="checkbox" id="vegan-check" value="빠른요리" name="situation">빠른요리 &nbsp; 
						<input type="checkbox" id="vegan-check" value="일상식사" name="situation">일상식사 &nbsp; <input type="checkbox" id="vegan-check" value="다이어트" name="situation">다이어트 &nbsp;
						<input type="checkbox" id="vegan-check" value="아침/점심" name="situation">아침/점심 &nbsp; <input type="checkbox" id="vegan-check" value="저녁" name="situation">저녁 &nbsp; 
					</div>
				</td>
			</tr>
			<tr>
				<th>대표 사진</th>
				<td><input type="file" name="boardImageFile"><%=board.getBoardImageFile()%></td>
			</tr>
			<tr>
				<th>내용</th>
				<td><textarea name="content" cols="130" rows="50" id="text"><%=board.getBoardContent() %></textarea></td>
			</tr>
			<tr>
				<th>완성 사진</th>
				<td><input type="file" name="imagefile1"><input type="file" name="imagefile2"><input type="file" name="imagefile3"></td>
			</tr>
		</table>
		<br><br>
		<div id="write_1">
			<div>
			<input type="submit" value="수정" id="button1">
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<input type="reset" value="취소" id="button1">
			</div>
		</div>
		
		</form>

<script type="text/javascript">

$('#text').val().replace(/\n/g, "<br>")</script>
	
</section>
<%@ include file="/views/common/footer.jsp" %>