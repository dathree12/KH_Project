<%@page import="com.kh.board.model.service.BoardService"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.kh.board.model.vo.Board"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@ include file="/views/common/header.jsp"%>


<link rel="stylesheet" href="css/index.css">
<link rel="stylesheet" href="css/slick.css">
<link rel="stylesheet" href="css/slick-theme.css">
<script src="js/slick.js"></script>
    
<%

List<Board> list = new BoardService().getMainVegan1();	
	

List<Board> list1 = new BoardService().getMainList();

if(loginMember != null){
	list =  new BoardService().getMainVegan(loginMember.getVegType());	
	System.out.println("type : " + loginMember.getVegType());
}


%>

<style>
#aaa{
	display: inline-block;
	}
	
	 #content1{
	text-align: center;
	position: relative;
	display: inline-block;
	margin-bottom: 10px;
	margin-right: 13px;
	
   }
	
	.main_img{
	width: 250px;
	height: 250px;
	}
	 
	.m_img{
	width: 250px;
	height: 250px;
	text-align: center;
	display: block;
	margin: 0px auto;
	
	}
	
	#main_view{
		text-align: center;
		min-height: 1000px;
		position: relative;
		width: 900px;
		left: -17%;
	}
	
	#recipelist{
	width: 100%;
	height: 400px;
	position: relative;
	background-color: #b8de6f;
	left: 50%;
	transform:translate(-50%, -50%); 
	}
	
	#searchbar{
	text-align: center;
	height: 200px;
	width: 100%;
	}
	
	#search_main{
	width: 900px;
    border-bottom: 3px solid #4f4f4f;
    margin: auto;
    position: relative;
    text-align: center;
    margin-top: 5%;
	}
	
	#search_button{
	    color: white;
	    width: 100px;
    	float: right;
	}
	
	#search_text{
	    width: 700px;
   		height: 70px;
   		border: 0px;
	}
	
	#search_icon{
	width: 40px;
    height: 40px;
    
    position: relative;
	}
	
	#relist{
	text-align: center;
	margin:5px auto;
	width: 700px;
	min-height: 300px;
	position: relative;
	top: -320px;
	}
	
	#we{
	text-align: center;
	color: white;
	}
	
	#recipe_text{
		color: white;
		text-align: center;
	}
	
	#today_list{
	background-color: #f1e189;
	margin:5px auto;
	width: 100%;
	min-height: 500px;
	text-align: center;
	}
	
	#last{
	background-color: #cdd0cb;
	margin:5px auto;
	width: 100%;
	min-height: 300px;
	text-align: center;
	}
	
	.dot {
	cursor: pointer;
	height: 13px;
	width: 13px;
	margin: 0 2px;
	background-color: #bbb;
	border-radius: 50%;
	display: inline-block;
	transition: background-color 0.6s ease;
}
#dot{
	clear: both;
}
.list{
	text-align: center;
	
}
#img_text{
height: 50px;
width: 300px;
position: relative;
display: inline-block;
}
</style>


<section id="today_list">
<%
    
     
%>
<br>
<div id="today_best">
<h1 id="today_text">Today Best!</h1><br>
        <div id="today">
        <% int count1 = 0;  for(Board board1 : list1) { count1++; if(count1>16){break;} %>
          <div class="list" >
          <a href="<%=request.getContextPath() %>/board/view?boardNo=<%= board1.getBoardNo() %>&vegan=<%=board1.getVeganlist()%>"><img src="image/<%=board1.getBoardImageFile()%>" class="m_img"></a>
          <br><strong id="title"><%=board1.getBoardTitle() %></strong>
          </div>
     <% } %>
     
       </div>
       <div style="text-align: center" id="dot">
				<span class="dot" onclick="currentSlide(1)"></span> 
				<span class="dot" onclick="currentSlide(2)"></span> 
				<span class="dot" onclick="currentSlide(3)"></span>
				<span class="dot" onclick="currentSlide(4)"></span>
		</div>
</div>
</section>

<div id = "searchbar">
	<div id="search_main">
	<form  method="GET" action=<%=request.getContextPath()%>/mainsearch>
	<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-search" viewBox="0 0 16 16" id="search_icon">
  	<path d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z"/>
	</svg>
	<form  method="GET" action=<%=request.getContextPath()%>/mainsearch>
	<input type="text" class="entryStyle" name="search" placeholder = "검색어 입력" id="search_text">
	<button  id="search_button" type="submit" class="btn btn-primary btn-lg"> 검색 </button>
	</form>
	</div>
</div>


<br><br><br><br><br><br><br><br><br><br><br>
<div id="recipelist">
<br><br><br>
<h1 id="recipe_text">맞춤 레시피!</h1><br>
<h5 id="we">베지테리언 프렌드에서는 </h5>
<h5 id="we">회원님의 관심분야와 관련된 레시피를 제공합니다 </h5>
</div>

<section id=relist>
<div id="main_view">
 <% int count = 0;  for(Board board : list) { count++; if(count>9){break;} %>
          <div id="content1" class="content" >
          <a href="<%=request.getContextPath() %>/board/view?boardNo=<%= board.getBoardNo() %>&vegan=<%=board.getVeganlist()%>"><img src="image/<%=board.getBoardImageFile()%>" class="main_img"> </a><br>
       	  <a><%= board.getBoardTitle() %></a>
          </div>
         
     <% } %>
</div>

	
	<script type="text/javascript">
	$('.post-wrapper').slick({
		  slidesToShow: 4,
		  slidesToScroll: 1,
		  autoplay: true,
		  autoplaySpeed: 2000,
		});
	
	
	$(document).ready(function () {
	    $("#today").slick({
	        prevArrow : false,
	        nextArrow: false,
	        infinite: true,
	        slidesToShow: 4,
	        slidesToScroll : 4,
	        autoplay : true,
	        autoplaySpeed: 3000, //�ڵ��ѱ� �ӵ�
	        pauseOnHover: false,
	    });
	});
</script>
</section>

<%@ include file="/views/common/footer.jsp"%>