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
	List<Board> vegan = (List) request.getAttribute("vegan");
	
	String vl = board.getVeganlist();
	char vlChar = vl.charAt(1);
	String vlPrint = null;
	switch(vlChar){
	case '1' : vlPrint = "비건"; break;
	case '2' : vlPrint = "락토 베지테리언"; break;
	case '3' : vlPrint = "오보 베지테리언"; break;
	case '4' : vlPrint = "락토 오보 베지테리언"; break;
	case '5' : vlPrint = "페스코 베지테리언"; break;
	}
	
	String si = board.getSituation();
	si = si.substring(1);
	si = si.substring(0,si.length()-1);
	
	String[] silist = si.split(", ");
	String str = "";
	String siPrint = null;
	char siChar;
	
	for(int i = 0; i < silist.length; i++){
		 siChar = silist[i].charAt(1);
		
		 switch(siChar){
			case '1' : siPrint = "아침/점심 "; 
						str += siPrint; 
						break;
			case '2' : siPrint = "저녁 ";  
						str += siPrint; 
						break;
			case '3' : siPrint = "빠른조리 ";
						str += siPrint; 
						break;
			case '4' : siPrint = "간식 ";
						str += siPrint;
						break;
			case '5' : siPrint = "파티 ";
						str += siPrint;  
						break;
			}
		
	}
	
	
	
%>

<style>
#date{
	text-align: center;
}

#list{
text-align: center;
}

#date{
height: 50px;
}

#icon{
	display: inline-block;
}
</style>

<section id="content">
	<div id='board-container'>
        <!-- 대표 이미지 가져와 출력 -->
        <div id="food_image" align="center">
        <img src="<%=request.getContextPath()%>/image/<%=board.getBoardImageFile()%>">
        </div>
		<div id="list">
			<h2 id="title" align="center"><%=board.getBoardTitle() %></h2>
			<a id="date"><%=board.getBoardCreateDate()%></a><br><hr><br>
			<strong>채식주의 종류 : </strong> <span id="vlPrint"></span>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<strong>상황  :</strong> <span id="siPrint"></span>
		</div>
		
		<hr>
	
		<div id="date">
			 <div id="icon"> <img src="<%=request.getContextPath()%>/image/2.JPG" class="num"> <br> <a class="num"> 추천순 : <%=board.getRecommned()%></a></div>
			 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			 <div id="icon"><img src="<%=request.getContextPath()%>/image/1.JPG" class="num"> <br> <a class="num"> 댓글 : <%=replies.size()%></a></div> 
			 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			 <div id="icon"><img src="<%=request.getContextPath()%>/image/3.JPG" class="num"> <br> <a class="num"> 조회수 : <%=board.getBoardReadCount()%></a> </div> 
			<!-- 추천 댓글 아이콘 구하기  -->
		</div>

		<br><br><hr><br>

		<div id="write"><pre><%=board.getBoardContent()%></pre></div>

		<br>
		<hr>
		
        <!-- 업로드한 이미지를 가져온다. -->
        <div id="food_images">
            <h2>완성사진</h2>
            <%if(board.getImagefile1() != null){ %>
            <img src="<%=request.getContextPath()%>/image/<%=board.getImagefile1() %>" width="300" height="300">
            <%}else { %>
            <div id="foodimage"></div>
            <% } %>
            
            <%if(board.getImagefile2() != null){ %>
             <img src="<%=request.getContextPath()%>/image/<%=board.getImagefile2() %>" width="300" height="300">
            <%}else { %>
            <div id="foodimage" ></div>
            <% } %>
            
            <%if(board.getImagefile2() != null){ %>
              <img src="<%=request.getContextPath()%>/image/<%=board.getImagefile3() %>" width="300" height="300">
            <%}else { %>
            <div  id="foodimage"></div>
            <% } %>
            
           
        </div>
        
        <hr>

        <!-- 추천버튼 스크랩 버튼 -->
		<div id="icon1">
			<button onclick="boardrecommend()"><img src="<%=request.getContextPath()%>/image/reco.JPG" ></button> 
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
			<button onclick=""><img src="<%=request.getContextPath()%>/image/scrap.JPG" ></button> 
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
		
		
			<% if(loginMember != null && (loginMember.getUserId().equals(board.getUserId()))) { %> 
				<span id="del"><button onclick="updateBoard()" id="submit">수정</button></span>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
				<span id="del"><button onclick="deleteBoard()" id="submit2">삭제</button></span>
			 <%}%>
		</div>

		<br><br>

		<div id=reply>
			<strong>요리후기</strong> &nbsp;&nbsp; <a><%=replies.size()%>개의 댓글이 존재합니다.</a> 
			<br><br>

			<table id="tbl-comment">
			<!-- for문을 사용하여 댓글수만큼 출럭 가능하게 구현하기 -->
			<%for(BoardReply reply : replies){ %>
			<tr class="level1">
					<td><sub class="comment-writer"><%=reply.getUserId()%> </sub> 
					<sub class="comment-date"><%=reply.getReplyCreateDate()%></sub>
					<% if(loginMember != null && (loginMember.getUserId().equals(reply.getUserId()))) { %> 
					<a id="deletereply" href="<%=request.getContextPath()%>/board/deletereply?replyNo=<%=reply.getReplyNo()%>">삭제</a>
					 <% }%>
					 <br><br> 
						<%=reply.getReplyContent()%>
					<br><br>
					</td>
				</tr>
			<% } %>
			</table>


			<!-- 별점은 다른 라이브러리 사용 -->
			<p class="star_rating">
   			 <a href="#" onclick="abc(1)">★</a>
		     <a href="#" onclick="abc(2)">★</a>
		     <a href="#" onclick="abc(3)">★</a>
		     <a href="#" onclick="abc(4)">★</a>
		     <a href="#" onclick="abc(5)">★</a>
			</p>

			
            <!-- 댓글 등록 -->
			<div id="comment-container">
				<form action="<%=request.getContextPath()%>/board/reply" method="post" id="reply_form">
					<input type="hidden" name="boardNo" value="<%=board.getBoardNo()%>">
					<input type="hidden" name="writer" value="<%= loginMember != null ? loginMember.getUserId() : "" %>">
					<textarea name="content" cols="110" rows="6" onfocus="checklogin()"></textarea>
					<button type="submit" id="btn-insert">등록</button>
				</form>
			</div>
		</div>
		
		<br><br><br>
		
		<div id="other-recommend">
			<h3>다른 추천 메뉴</h3>
			<div class="slideshow-container">
			<%int count = 0; int i = 0; %> 
				<div class="mySlides fade2">
					<span class="prev" onclick="plusSlides(-1)">❮</span>
					<%for(i=0; i < vegan.size(); i++){ count++; if(count>3){ break;}%>	
					<% Board b = vegan.get(i); %>
					<div id="slide">
					<a href="<%=request.getContextPath() %>/board/view?boardNo=<%= b.getBoardNo()%>&vegan=<%=b.getVeganlist()%>"> 
					<img class="main_slideImg" src="<%=request.getContextPath()%>/image/<%=b.getBoardImageFile()%>"><figcaption><%=b.getBoardTitle()%></figcaption></a>
					</div>
					<%} %>
					<span class="next" onclick="plusSlides(1)">❯</span>
				</div>
			
			<%count = 0; %> 
				<div class="mySlides fade2">
					<span class="prev" onclick="plusSlides(-1)">❮</span>
					<%for(i=3; i < vegan.size(); i++){ count++; if(count>3){ break;}%>	
					<% Board b = vegan.get(i); %>
					<div id="slide">
					<a href="<%=request.getContextPath() %>/board/view?boardNo=<%= b.getBoardNo()%>&vegan=<%=b.getVeganlist()%>"> 
					<img class="main_slideImg" src="<%=request.getContextPath()%>/image/<%=b.getBoardImageFile()%>"><figcaption><%=b.getBoardTitle()%></figcaption></a>
					</div>
					<%} %>
					<span class="next" onclick="plusSlides(1)">❯</span>
				</div>
				
				<%count = 0; %> 
				<div class="mySlides fade2">
					<span class="prev" onclick="plusSlides(-1)">❮</span>
					<%for(i=6; i < vegan.size(); i++){ count++; if(count>3){ break;}%>	
					<% Board b = vegan.get(i); %>
					<div id="slide">
					<a href="<%=request.getContextPath() %>/board/view?boardNo=<%= b.getBoardNo()%>&vegan=<%=b.getVeganlist()%>"> 
					<img class="main_slideImg" src="<%=request.getContextPath()%>/image/<%=b.getBoardImageFile()%>"><figcaption><%=b.getBoardTitle()%></figcaption></a>
					</div>
					<%} %>
					<span class="next" onclick="plusSlides(1)">❯</span>
				</div>
				
				<div style="text-align: center" id="dot">
				<span class="dot" onclick="currentSlide(1)"></span> 
				<span class="dot" onclick="currentSlide(2)"></span> 
				<span class="dot" onclick="currentSlide(3)"></span>
				</div>
		</div>
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
		
		function boardrecommend(){		
			location.replace('<%=request.getContextPath()%>/board/recommend?boardNo=<%=board.getBoardNo()%>');
		}
		
		function checklogin() {
			if(<%= loginMember == null %>){
				alert("로그인 후 이용해주세요!");
				$("#userId").focus();
			}
		}
		
		$( ".star_rating a" ).click(function() {
		    $(this).parent().children("a").removeClass("on");
		    $(this).addClass("on").prevAll("a").addClass("on");
		    return false;
		});
		
		var slideIndex = 1;
		showSlides(slideIndex);
		function plusSlides(n) {
			showSlides(slideIndex += n);
		}
		function currentSlide(n) {
			showSlides(slideIndex = n);
		}
		function showSlides(n) {
			var i;
			var slides = document.getElementsByClassName("mySlides");
			var dots = document.getElementsByClassName("dot");
			if (n > slides.length) {
				slideIndex = 1
			}
			if (n < 1) {
				slideIndex = slides.length
			}
			for (i = 0; i < slides.length; i++) {
				slides[i].style.display = "none";
			}
			for (i = 0; i < dots.length; i++) {
				dots[i].className = dots[i].className.replace(" active", "");
			}
			slides[slideIndex - 1].style.display = "block";
			dots[slideIndex - 1].className += " active";
		}
		
		var starscore= 0;
		
		function abc(n) {
			starscore = n;
			return starscore;
		}
		
		$(document).ready(() => {
			$("#vlPrint").text("<%=vlPrint %>");
		});
		
		$(document).ready(() => {
			$("#siPrint").text("<%=str%>");
		});
	</script>
 
</section>

<%@ include file="/views/common/footer.jsp"%>