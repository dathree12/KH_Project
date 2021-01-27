<%@page import="com.kh.member.model.vo.Member"%>
<%@page import="java.util.List"%>
<%@page import="com.kh.board.model.vo.BoardReply"%>
<%@page import="com.kh.board.model.vo.Board"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp"%>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css">
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

#coment{
	width: 50px;
	height: 50px;
}

svg{
 width: 50px;
 height: 50px;
 
}

.num{
	background: #a6f0c6;
	border-radius: 10px;
	padding: 5px;
	border: solid 1px green;
	font-weight: bolder;
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
			<strong>카테고리  :</strong> <span id="siPrint"></span>
		</div>
		
		<hr>
	
		<div id="date">
			 <div id="icon"> <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-hand-thumbs-up-fill" viewBox="0 0 16 16">
  			<path d="M6.956 1.745C7.021.81 7.908.087 8.864.325l.261.066c.463.116.874.456 1.012.964.22.817.533 2.512.062 4.51a9.84 9.84 0 0 1 .443-.05c.713-.065 1.669-.072 2.516.21.518.173.994.68 1.2 1.273.184.532.16 1.162-.234 1.733.058.119.103.242.138.363.077.27.113.567.113.856 0 .289-.036.586-.113.856-.039.135-.09.273-.16.404.169.387.107.819-.003 1.148a3.162 3.162 0 0 1-.488.9c.054.153.076.313.076.465 0 .306-.089.626-.253.912C13.1 15.522 12.437 16 11.5 16H8c-.605 0-1.07-.081-1.466-.218a4.826 4.826 0 0 1-.97-.484l-.048-.03c-.504-.307-.999-.609-2.068-.722C2.682 14.464 2 13.846 2 13V9c0-.85.685-1.432 1.357-1.616.849-.231 1.574-.786 2.132-1.41.56-.626.914-1.279 1.039-1.638.199-.575.356-1.54.428-2.59z"/>
			</svg><br><br><a class="num"> 추천 : <%=board.getRecommned()%></a></div>
			 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			 <div id="icon"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-chat" viewBox="0 0 16 16"><path d="M2.678 11.894a1 1 0 0 1 .287.801 10.97 10.97 0 0 1-.398 2c1.395-.323 2.247-.697 2.634-.893a1 1 0 0 1 .71-.074A8.06 8.06 0 0 0 8 14c3.996 0 7-2.807 7-6 0-3.192-3.004-6-7-6S1 4.808 1 8c0 1.468.617 2.83 1.678 3.894zm-.493 3.905a21.682 21.682 0 0 1-.713.129c-.2.032-.352-.176-.273-.362a9.68 9.68 0 0 0 .244-.637l.003-.01c.248-.72.45-1.548.524-2.319C.743 11.37 0 9.76 0 8c0-3.866 3.582-7 8-7s8 3.134 8 7-3.582 7-8 7a9.06 9.06 0 0 1-2.347-.306c-.52.263-1.639.742-3.468 1.105z"/>
			 </svg><br><br><a class="num"> 댓글 : <%=replies.size()%></a></div> 
			 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			 <div id="icon"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-eye" viewBox="0 0 16 16">
  			<path d="M16 8s-3-5.5-8-5.5S0 8 0 8s3 5.5 8 5.5S16 8 16 8zM1.173 8a13.133 13.133 0 0 1 1.66-2.043C4.12 4.668 5.88 3.5 8 3.5c2.12 0 3.879 1.168 5.168 2.457A13.133 13.133 0 0 1 14.828 8c-.058.087-.122.183-.195.288-.335.48-.83 1.12-1.465 1.755C11.879 11.332 10.119 12.5 8 12.5c-2.12 0-3.879-1.168-5.168-2.457A13.134 13.134 0 0 1 1.172 8z"/>
  			<path d="M8 5.5a2.5 2.5 0 1 0 0 5 2.5 2.5 0 0 0 0-5zM4.5 8a3.5 3.5 0 1 1 7 0 3.5 3.5 0 0 1-7 0z"/>
			</svg><br><br> <a class="num"> 조회수 : <%=board.getBoardReadCount()%></a> </div> 
			<!-- 추천 댓글 아이콘 구하기  -->
		</div>

		<br><br><br><hr><br>

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
					<textarea name="content" cols="100" rows="4" onfocus="checklogin()"></textarea>
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