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
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
<link rel="stylesheet" href="resources/css/index.css">
    <link rel="stylesheet" href="resources/css/slick.css">
    <link rel="stylesheet" href="resources/css/slick-theme.css">
    <script src="resources/js/jquery-3.5.1.min.js"></script>
    <script src="resources/js/index.js"></script>
    <script src="resources/js/slick.js"></script>
<%
List<Board> list = new ArrayList<>();


%>
<STYLE>
	#aaa{
	display: inline-block;
	}
	 #content1{
	float: left;
   }
	
</STYLE>

<section id="content">
<div>
	<h4>깃테스트</h4>

<%
      // 1. JDBC 드라이버 로딩
      Class.forName("oracle.jdbc.driver.OracleDriver");
  	
      Connection conn = null; // DBMS와 Java연결객체
      PreparedStatement pstmt = null; // SQL구문을 실행
      ResultSet rs = null; // SQL구문의 실행결과를 저장
      String query = null;
  
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
   
            // 2. 데이터베이스 커넥션 생성
            conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
   
            // 3. Statement 생성
            pstmt = conn.prepareStatement(query);
   
            if(loginMember != null){
           	pstmt.setString(1, loginMember.getVegType());
           }
            // 4. 쿼리 실행
            rs = pstmt.executeQuery();
   
            // 5. 쿼리 실행 결과 출력
            while(rs.next())
            {
            	Board board = new Board();
            	board.setBoardNo(rs.getInt("BOARD_NO"));
            	board.setBoardTitle(rs.getString("BOARD_TITLE"));
            	board.setBoardImageFile(rs.getString("BOARD_IMAGEF_FILE"));
            	list.add(board);
            }
      }catch(SQLException ex){
            out.println(ex.getMessage());
            ex.printStackTrace();
      }finally{
      
      }
%>
	
 <% int count = 0;  for(Board board : list) { count++; if(count>9){break;} %>
          <div id="content1" class="content" >
          <a href="<%=request.getContextPath() %>/board/view?boardNo=<%= board.getBoardNo() %>"><img src="image/<%=board.getBoardImageFile()%>" width="300" height="300"> </a><br>
       	  <a><%= board.getBoardTitle() %></a>
          </div>
     <% } %>

	</div>
</section>

<%@ include file="/views/common/footer.jsp"%>
