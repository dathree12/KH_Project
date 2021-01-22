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
<link rel="stylesheet" href="resources/css/index.css">
    <link rel="stylesheet" href="resources/css/slick.css">
    <link rel="stylesheet" href="resources/css/slick-theme.css">
    <script src="resources/js/jquery-3.5.1.min.js"></script>
    <script src="resources/js/index.js"></script>
    <script src="resources/js/slick.js"></script>

<%
List<Board> list = (ArrayList)request.getAttribute("list");
System.out.println(list);

%>
<section id="content">
	<h4>깃테스트</h4>

	
      
 
<%
      // 1. JDBC 드라이버 로딩
      Class.forName("oracle.jdbc.driver.OracleDriver");
  
      Connection conn = null; // DBMS와 Java연결객체
      PreparedStatement pstmt = null; // SQL구문을 실행
      ResultSet rs = null; // SQL구문의 실행결과를 저장
  
      try
      { 
    	 
            String jdbcDriver = "jdbc:oracle:thin:@localhost:1521:xe";
            String dbUser =  "VEF";
            String dbPass = "VEF";
   
            String query = 
  				("SELECT * FROM BOARD WHERE STATUS = 'Y' AND VEGANLIST=?");
   
            // 2. 데이터베이스 커넥션 생성
            conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
   
            // 3. Statement 생성
            pstmt = conn.prepareStatement(query);
   
            pstmt.setString(1, loginMember.getVegType());
            // 4. 쿼리 실행
            rs = pstmt.executeQuery(query);
   
            // 5. 쿼리 실행 결과 출력
           int count = 0;
            while(rs.next())
            { count++; if(count >9){break; }
%>
      <div>
      <img src="<%=request.getContextPath()%>/image/<%=rs.getString("BOARD_IMAGEF_FILE")%>">
      <a><%=rs.getString("BOARD_TITLE") %></a>
      </div>
<%
            }
      }catch(SQLException ex){
            out.println(ex.getMessage());
            ex.printStackTrace();
      }finally{
          
      }
      
     
%>
<%  System.out.println(loginMember.getVegType()); %>
      </table>

	
</section>

<%@ include file="/views/common/footer.jsp"%>
