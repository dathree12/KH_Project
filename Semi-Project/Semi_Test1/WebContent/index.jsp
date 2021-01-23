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
<script src="js/jquery-3.5.1.min.js"></script>
<script src="js/index.js"></script>
<script src="js/slick.js"></script>
    
    
    
<%
List<Board> list = new ArrayList<>();
List<Board> list1 = new ArrayList<>();


%>
<STYLE>
	#aaa{
	display: inline-block;
	}
	
	 #content1{
	float: left;
	text-align: center;
	position: relative;
	left: 8%;
   }
	
	.main_img{
	width: 250px;
	height: 250px;
	}
	
	#main_view{
		text-align: center;
		min-height: 1000px;
	}
</STYLE>

<section id="content">


        
<%
      // 1. JDBC 드라이버 로딩
      Class.forName("oracle.jdbc.driver.OracleDriver");
  	
      Connection conn = null; // DBMS와 Java연결객체
      PreparedStatement pstmt = null; // SQL구문을 실행
      PreparedStatement pstmt1 = null; // SQL구문을 실행
      ResultSet rs = null; // SQL구문의 실행결과를 저장
      ResultSet rs1 = null; // SQL구문의 실행결과를 저장
      String query = null;
      String query1 = null;
      try
      {
            String jdbcDriver = "jdbc:oracle:thin:@localhost:1521:xe";
            String dbUser = "VEF";
            String dbPass = "VEF";
   
            if(loginMember != null){
            	 query = "select * from BOARD WHERE VEGANLIST = ? ";
            }else{
             query = "select * from BOARD ";
            }
   
            query1 = "select * from BOARD ORDER BY RECOMMEND DESC";
            // 2. 데이터베이스 커넥션 생성
            conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
   
            // 3. Statement 생성
            pstmt = conn.prepareStatement(query);
            pstmt1 = conn.prepareStatement(query1);
   
            if(loginMember != null){
           	pstmt.setString(1, loginMember.getVegType());
           }
            // 4. 쿼리 실행
            rs = pstmt.executeQuery();
            rs1 = pstmt1.executeQuery();
   
          
            // 5. 쿼리 실행 결과 출력
            while(rs1.next()){
            	Board board1 = new Board();
            	board1.setBoardNo(rs1.getInt("BOARD_NO"));
            	board1.setBoardTitle(rs1.getString("BOARD_TITLE"));
            	board1.setBoardImageFile(rs1.getString("BOARD_IMAGEF_FILE"));
            	list1.add(board1);
            }
            while(rs.next())
            {
            	Board board = new Board();
            	board.setBoardNo(rs.getInt("BOARD_NO"));
            	board.setBoardTitle(rs.getString("BOARD_TITLE"));
            	board.setBoardImageFile(rs.getString("BOARD_IMAGEF_FILE"));
            	list.add(board);
            }
           
      }catch(SQLException ex){
            ex.printStackTrace();
      }finally{
      
      }
      
     
%>

<div id="today_best">
<h1 id="today_text">Today Best!<h1>
        <div id="today">
        <% int count1 = 0;  for(Board board1 : list1) { count1++; if(count1>6){break;} %>
          <div class="list" >
          <a href="<%=request.getContextPath() %>/board/view?boardNo=<%= board1.getBoardNo() %>"><img src="image/<%=board1.getBoardImageFile()%>" class="main_img"> </a>
          </div>
     <% } %>
       </div>
</div>

<h3 id="today_text">맞춤 레시피!<h3>
<div id="main_view">
 <% int count = 0;  for(Board board : list) { count++; if(count>9){break;} %>
          <div id="content1" class="content" >
          <a href="<%=request.getContextPath() %>/board/view?boardNo=<%= board.getBoardNo() %>"><img src="image/<%=board.getBoardImageFile()%>" class="main_img"> </a><br>
       	  <a><%= board.getBoardTitle() %></a>
          </div>
     <% } %>
</div>
	</div>
	
	<script type="text/javascript">
	$('.post-wrapper').slick({
		  slidesToShow: 3,
		  slidesToScroll: 1,
		  autoplay: true,
		  autoplaySpeed: 2000,
		});
	</script>
	
	</div>
</section>

<%@ include file="/views/common/footer.jsp"%>
