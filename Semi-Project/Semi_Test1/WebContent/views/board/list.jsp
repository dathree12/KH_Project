<%@page import="com.kh.board.model.vo.PageInfo"%>
<%@page import="com.kh.board.model.vo.Board"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
    
<%@ include file="/views/common/header.jsp" %>
 
  <style>
      
      h2 {
        display: inline-block;
        background-color: yellowgreen;
        color: darkgreen;
        padding: 8px;
        border-radius: 18px;
      }
      table {
 
 
      }
     
      div {
        /* 테두리 보여주기 위한 border. 사이즈 조정후 삭제할 것. */
     
      }
      #board_top {
        display: flex;
        justify-content: flex-end;
      }
      #board_top > * {
        margin: 0 0.5rem;
      }
      #board_main {
       display: inline-block;
        padding: none;
        border: solid 1px;
        float: left;
       
      }
      #board_option {
        flex: 1;
        padding: 1rem 0;
      }
      #board_content {
        flex: 5;
        display: flex;
        flex-wrap: wrap;
        align-content: flex-start;
        justify-content: center;
    
      
       
      }
     
      .content {
        width: 11.7rem;
        
   		
      }
      img {
        width: 185px;
        height: 105px;
      }
      
   #content1{
	float: left;
   }
   
    </style>

    

<%
	List<Board> list = (ArrayList)request.getAttribute("list");
	System.out.println(list);
	PageInfo pageInfo = (PageInfo) request.getAttribute("pageInfo");
%>
<section id="content">
	<h2 align="center">게시판 </h2>
	
	<button type="button" id="btn-add"
			onclick="location.href ='<%=request.getContextPath() %>/board/write'" onfocus="checklogin()">글쓰기</button>
			
	 <form method="GET" action=<%=request.getContextPath()%>/searchrecipe>
	        <select name="search_sort" class="dropdown">
	          <option value="s_title" selected>제목</option>
	          <option value="s_id">글쓴이</option>
	          <option value="s_content">내용</option>
	        </select>
            <input type="search" placeholder="Search" name="searchword" />
            
            <button class="btn btn-primary" type="submit" >검색</button>
        </form>
        
        <button onclick="location.href='<%=request.getContextPath()%>/board/list'">최신순</button>
        <button onclick="location.href='<%=request.getContextPath()%>/boardrecommendlist'">추천순</button>
        
    <div id="board_main">
      <form method="GET" action=<%=request.getContextPath()%>/recipesorting>
        <div id="board_option">
        <div>
          <table>
            <tr>
              <th>채식 타입</th>
            </tr>
            <tr>
              <td>
                전체선택
                <input type="checkbox" name="vgcheckall" checked />
              </td>
             </tr>
             <tr> 
              <td>
                비건
                <input type="checkbox" name="vgsort" value="v1" checked />
              </td>
            </tr>
            <tr>
              <td>
                락토
                <input type="checkbox" name="vgsort" value="v2" checked />
              </td>
            </tr>
            <tr>
              <td>
                오보
                <input type="checkbox" name="vgsort" value="v3" checked/>
              </td>
            </tr>
            <tr>
              <td>
                락토-오보
                <input type="checkbox" name="vgsort" value="v4" checked/>
              </td>
            </tr>
            <tr>
              <td>
                페스코
                <input type="checkbox" name="vgsort" value="v5" checked/>
              </td>
            </tr>
          </table>
          </div>
          <div>
          <table>
            <tr>
              <th>상황별</th>
            </tr>
            <tr>
              <td>
                전체선택
                <input type="checkbox" name="situcheckall" checked />
              </td>
            </tr>
            <tr>
              <td>
                아침,점심
                <input type="checkbox" name="situsort" value="s1" checked/>
              </td>
            </tr>
            <tr>
              <td>
                저녁
                <input type="checkbox" name="situsort" value="s2"  checked/>
              </td>
            </tr>
            <tr>
              <td>
                빠른조리
                <input type="checkbox" name="situsort" value="s3" checked/>
              </td>
            </tr>
            <tr>
              <td>
                간식
                <input type="checkbox" name="situsort" value="s4" checked/>
              </td>
            </tr>
            <tr>
              <td>
                파티
                <input type="checkbox" name="situsort" value="s5" checked/>
              </td>
            </tr>
          </table>
          </div>
        </div>
        <div>
        <button class="btn btn-primary" type="submit" >검색</button>
        </div>
        </form>
        </div>
        
        <script type="text/javascript">
        /* vegan종류 전체선택버튼 */
		    function allCheckFunc1(obj) {
		    		$("[name=vgsort]").prop("checked", $(obj).prop("checked") );
		    }
		
		    /* 체크박스 체크시 전체선택 체크 여부 */
		    function oneCheckFunc1(obj)
		    {
		    	var allObj = $("[name=vgcheckall]");
		    	var objName = $(obj).attr("name");
		
		    	if($(obj).prop("checked"))
		    	{
		    		checkBoxLength = $("[name="+ objName +"]").length;
		    		checkedLength = $("[name="+ objName +"]:checked").length;
		
		    		if(checkBoxLength == checkedLength) {
		    			allObj.prop("checked", true);
		    		} else {
		    			allObj.prop("checked", false);
		    		}
		    	}
		    	else
		    	{
		    		allObj.prop("checked", false);
		    	}
		    }
		
		    $(function(){
		    	$("[name=vgcheckall]").click(function(){
		    		allCheckFunc1(this);
		    	});
		    	$("[name=vgsort]").each(function(){
		    		$(this).click(function(){
		    			oneCheckFunc1($(this));
		    		});
		    	});
		    });
		    </script>
		    
		  <script type="text/javascript">
 		/* situation종류 전체선택버튼 */
		    function allCheckFunc2(obj) {
		    		$("[name=situsort]").prop("checked", $(obj).prop("checked") );
		    }
		
		    /* 체크박스 체크시 전체선택 체크 여부 */
		    function oneCheckFunc2(obj)
		    {
		    	var allObj = $("[name=situcheckall]");
		    	var objName = $(obj).attr("name");
		
		    	if($(obj).prop("checked"))
		    	{
		    		checkBoxLength = $("[name="+ objName +"]").length;
		    		checkedLength = $("[name="+ objName +"]:checked").length;
		
		    		if(checkBoxLength == checkedLength) {
		    			allObj.prop("checked", true);
		    		} else {
		    			allObj.prop("checked", false);
		    		}
		    	}
		    	else
		    	{
		    		allObj.prop("checked", false);
		    	}
		    }
		
		    $(function(){
		    	$("[name=situcheckall]").click(function(){
		    		allCheckFunc2(this);
		    	});
		    	$("[name=situsort]").each(function(){
		    		$(this).click(function(){
		    			oneCheckFunc2($(this));
		    		});
		    	});
		    });
        </script>
     </div>
          
	 <div id="board_content" >
	 <%  for(Board board : list) { %>
          <div id="content1" class="content" >
       		<a href="<%=request.getContextPath()%>/board/view?boardNo=<%=board.getBoardNo() %>&vegan=<%=board.getVeganlist() %>"><img src="<%=request.getContextPath()%>/image/<%=board.getBoardImageFile()%>"> </a>
       		<a><%= board.getBoardTitle() %></a><br>
            <a><%= board.getUserId() %></a><br>
            <a><%= board.getVeganlist()%></a><br>
            <a><%= board.getBoardCreateDate()%></a>
            <a>추천수:<%= board.getRecommned()%></a><br>
          </div>
 		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
     <% } %>
    
     </div>
      <div id="pageBar" align="center">
			<!-- 맨 처음으로 -->
			<button onclick="location.href='<%= request.getContextPath() %>/board/list?page=1'">&lt;&lt;</button>
			
			<!-- 이전 페이지로 -->
			<button onclick="location.href='<%= request.getContextPath() %>/board/list?page=<%= pageInfo.getPrvePage() %>'">&lt;</button>

			<!--  10개 페이지 목록 -->
			<% for(int p = pageInfo.getStartPage(); p <= pageInfo.getEndPage(); p++){ %>
				<% if(p == pageInfo.getCurrentPage()){ %>
					<button disabled><%= p %></button>
				<% } else { %>
					<button onclick="location.href='<%= request.getContextPath() %>/board/list?page=<%= p %>'"><%= p %></button>
				<% } %>
			<% } %>
			
			<!-- 다음 페이지로 -->
			<button onclick="location.href='<%= request.getContextPath() %>/board/list?page=<%= pageInfo.getNextPage() %>'">&gt;</button>
			
			<!-- 맨 끝으로 -->
			<button onclick="location.href='<%= request.getContextPath() %>/board/list?page=<%= pageInfo.getMaxPage() %>'">&gt;&gt;</button>
		</div>
		
		<script type="text/javascript">
		function checklogin() {
			if(<%= loginMember == null %>){
				alert("로그인 후 이용해주세요!");
				$("#userId").focus();
			}
		}
		
		function recommend() {
				location.replace('<%=request.getContextPath()%>/boardrecommendlist');
		}
		</script>
		
		
</section>
<%@ include file="/views/common/footer.jsp" %>