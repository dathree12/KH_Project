<%@page import="com.kh.member.model.vo.Member"%>
<%@page import="java.util.List"%>
<%@page import="com.kh.board.model.vo.BoardReply"%>
<%@page import="com.kh.board.model.vo.Board"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp"%>
<%
	Board board = (Board) request.getAttribute("board");
	List<BoardReply> replies = (List) request.getAttribute("replies");
	
	
	System.out.println(replies);
%>
<section id="content">
	<div id='board-container'>
        <!-- 대표 이미지 가져와 출력 -->
        <div id="food_image" align="center">
        <img src="<%=request.getContextPath()%>/image/<%=board.getBoardImageFile()%>">
        </div>
		<div>
			<h2 id="title" align="center"><%=board.getBoardTitle() %></h2>
			<div align="right">
			<table >
				<tr>
				<td>채식주의 종류 :</td>
				<td> <%=board.getVeganlist() %></td>
				</tr>
				<tr>
				<td>상황 카테고리 :</td>
				<td> <%=board.getSituation() %></td>
				</tr>
			</table>
			</div>
			
			<hr>
		</div>

		<div id="date">
			<a align="left"><%=board.getBoardCreateDate()%></a> 
			<a class="num"><%=board.getBoardReadCount()%></a> <img src="<%=request.getContextPath()%>/image/3.JPG" class="num"> 
			<a class="num"><%=replies.size()%></a> <img src="<%=request.getContextPath()%>/image/1.JPG" class="num"> 
			<a class="num">추천수 </a> <img src="<%=request.getContextPath()%>/image/2.JPG" class="num">
			<!-- 추천 댓글 아이콘 구하기  -->
		</div>

		<hr>
		<br>

		<div id="write"><pre><%=board.getBoardContent()%></pre></div>

		<br>
		<hr>
		
        <!-- 업로드한 이미지를 가져온다. -->
        <div id="food_images">
            <h2>완성사진</h2>
            <img src="<%=request.getContextPath()%>/image/<%=board.getImagefile1() %>" width="300" height="300">
            <img src="<%=request.getContextPath()%>/image/<%=board.getImagefile2() %>" width="300" height="300">
            <img src="<%=request.getContextPath()%>/image/<%=board.getImagefile3() %>" width="300" height="300">
        </div>
        
        <hr>

        <!-- 추천버튼 스크랩 버튼 -->
		<div id="icon1">
			<button onclick=""><img src="<%=request.getContextPath()%>/image/reco.JPG" ></button> 
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
			<button onclick=""><img src="<%=request.getContextPath()%>/image/scrap.JPG" ></button> 
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
			<span id="del"><button onclick="updateBoard()" id="submit">수정</button></span>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
			<span id="del"><button onclick="deleteBoard()" id="submit2">삭제</button></span>
		</div>

		<br>

		<div id=reply>
			<strong>요리후기</strong> &nbsp;&nbsp; <a><%=replies.size()%>개의 댓글이 존재합니다.</a> 
			<br><br>

			<table id="tbl-comment">
			<!-- for문을 사용하여 댓글수만큼 출럭 가능하게 구현하기 -->
			<%for(BoardReply reply : replies){ %>
			<tr class="level1">
					<td><sub class="comment-writer"><%=reply.getUserId()%> </sub> 
					<sub class="comment-date"><%=reply.getReplyCreateDate()%></sub>
					<a id="deletereply" href="<%=request.getContextPath()%>/board/deletereply?replyNo=<%=reply.getReplyNo()%>">삭제</a>
					 <br><br> 
						<%=reply.getReplyContent()%>
					<br><br>
					</td>
				</tr>
			<% } %>
			</table>


			<!-- 별점은 다른 라이브러리 사용 -->
			<p id="star_grade">
				<a href="#">★</a><a href="#">★</a><a href="#">★</a><a href="#">★</a><a href="#">★</a>
			</p>


            <!-- 댓글 등록 부분참조 -->
			<div id="comment-container">
				<form action="<%=request.getContextPath()%>/board/reply" method="post" id="reply_form">
					<input type="hidden" name="boardNo" value="<%=board.getBoardNo()%>">
					<textarea name="content" cols="110" rows="6"></textarea>
					<button type="submit" id="btn-insert">등록</button>
				</form>
			</div>
		</div>
		
		<br><br><br>
		
		<div id="other-recommend">
			<h3>다른 추천 메뉴</h3>
		</div>
		
	</div>
	
	<script type="text/javascript">
		function updateBoard(){
		location.href = "<%=request.getContextPath()%>/board/update?boardNo=<%=board.getBoardNo()%>";
		}
		
		function deleteBoard(){		
			if(confirm("정말로 게시글을 삭제 하시겠습니까?")){
				location.replace('<%=request.getContextPath()%>/board/delete?boardNo=<%=board.getBoardNo()%>');
			}
		}
		
	</script>
 
</section>

<%@ include file="/views/common/footer.jsp"%>
