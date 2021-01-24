<%@page import="com.kh.board.model.vo.PageSearch"%>
<%@page import="com.kh.board.model.vo.PageInfo"%>
<%@page import="com.kh.board.model.vo.Board"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
    
<%@ include file="/views/common/header.jsp" %>

<%
	List<Board> list = (ArrayList)request.getAttribute("list");
	System.out.println(list);
	PageInfo pageInfo = (PageInfo) request.getAttribute("pageInfo");
	PageSearch pageSearch  = (PageSearch) request.getAttribute("pageSearch");
	String vg = null;
	
%>
<head>
 	<link rel="stylesheet" href="<%=request.getContextPath() %>/css/liststyle.css" type="text/css">
</head>


<section id="content">
     <nav class="navbar navbar-expand-md navbar-light bg-light">
		<a href="<%=request.getContextPath() %>/board/list" class="navbar-brand">레시피게시판</a>
		<button type="button" class="navbar-toggler" data-toggle="collapse" data-target="#navbarCollapse">
			<span class="navbar-toggler-icon"></span>
		</button>

		<div class="collapse navbar-collapse justify-content-between" id="navbarCollapse">
			<div class="navbar-nav">
			<a type="button" id="btn-add" class="nav-item nav-link"
					onclick="location.href ='<%=request.getContextPath() %>/board/write'" onfocus="checklogin()">글쓰기</a>	
			<a onclick="location.href='<%=request.getContextPath()%>/board/list'" class="nav-item nav-link">최신순</a>
			<a onclick="location.href='<%=request.getContextPath()%>/boardrecommendlist'" class="nav-item nav-link">추천순</a>		
			
			<div id="searchbox">
			<form method="GET" class="form-inline" action=<%=request.getContextPath()%>/searchrecipe>
					<select name="search_sort" class="dropdown">
					<option value="s_title" selected>제목</option>
					<option value="s_id">글쓴이</option>
					</select>
					<div class="input-group">
						<input type="search" class="form-control" placeholder="Search" name="searchword" />
					</div>
					<div class="input-group-append">
						<button class="btn btn-secondary" type="submit"><i class="fa fa-search"></i></butto>
					</div>
				</div>
			</div>	
			</div>	
	</nav>   
        
    <div id="board_main" class="float_sidebar">
      <form method="GET" action=<%=request.getContextPath()%>/recipesorting>
        <div id="board_option">
        <div>
          <table>
            <tr>
              <th id="vgtype"><img src="<%=request.getContextPath() %>/css/images/corn.png" id="typeimage">채식 타입<img src="<%=request.getContextPath() %>/css/images/corn.png" id="typeimage"></th>
            </tr>
            <tr>
              <td id="typefactor"><img src="<%=request.getContextPath() %>/css/images/carrot.png" id="typeimage">
                전체선택
                <input type="checkbox" name="vgcheckall" checked />
              </td>
             </tr>
             <tr> 
              <td id="typefactor"><img src="<%=request.getContextPath() %>/css/images/1.png" id="typeimage">
                비건
                <input type="checkbox" name="vgsort" value="v1" checked />
              </td>
            </tr>
            <tr>
              <td id="typefactor"><img src="<%=request.getContextPath() %>/css/images/2.png" id="typeimage">
                락토
                <input type="checkbox" name="vgsort" value="v2" checked />
              </td>
            </tr>
            <tr>
              <td id="typefactor"><img src="<%=request.getContextPath() %>/css/images/3.png" id="typeimage">
                오보
                <input type="checkbox" name="vgsort" value="v3" checked/>
              </td>
            </tr>
            <tr>
              <td id="typefactor"><img src="<%=request.getContextPath() %>/css/images/4.png" id="typeimage">
                락토-오보
                <input type="checkbox" name="vgsort" value="v4" checked/>
              </td>
            </tr>
            <tr>
              <td id="typefactor"><img src="<%=request.getContextPath() %>/css/images/5.png" id="typeimage">
                페스코
                <input type="checkbox" name="vgsort" value="v5" checked/>
              </td>
            </tr>
          </table>
          </div>
          <div>
          <table>
            <tr>
              <th id="vgtype"><img src="<%=request.getContextPath() %>/css/images/corn.png" id="typeimage">상황별<img src="<%=request.getContextPath() %>/css/images/corn.png" id="typeimage"></th>
            </tr>
            <tr>
              <td id="typefactor"><img src="<%=request.getContextPath() %>/css/images/carrot.png" id="typeimage">
                전체선택
                <input type="checkbox" name="situcheckall" checked />
              </td>
            </tr>
            <tr>
              <td id="typefactor"><img src="<%=request.getContextPath() %>/css/images/6.png" id="typeimage">
                아침,점심
                <input type="checkbox" name="situsort" value="s1" checked/>
              </td>
            </tr>
            <tr>
              <td id="typefactor"><img src="<%=request.getContextPath() %>/css/images/7.png" id="typeimage">
                저녁
                <input type="checkbox" name="situsort" value="s2"  checked/>
              </td>
            </tr>
            <tr>
              <td id="typefactor"><img src="<%=request.getContextPath() %>/css/images/8.png" id="typeimage">
                빠른조리
                <input type="checkbox" name="situsort" value="s3" checked/>
              </td>
            </tr>
            <tr>
              <td id="typefactor"><img src="<%=request.getContextPath() %>/css/images/9.png" id="typeimage">
                간식
                <input type="checkbox" name="situsort" value="s4" checked/>
              </td>
            </tr>
            <tr>
              <td id="typefactor"><img src="<%=request.getContextPath() %>/css/images/10.png" id="typeimage">
                파티
                <input type="checkbox" name="situsort" value="s5" checked/>
              </td>
            </tr>
          </table>
          </div>
        </div>
        <div>
        <button class="btn btn-light" type="submit" >검색</button>
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
         <div class="bs-example">
	    <div class="container-fluid">
	        <div class="row">
	            <div class="card-columns">
	            <%  for(Board board : list) { %>
	                <div class="card">
	                	<a href="<%=request.getContextPath() %>/board/view?boardNo=<%= board.getBoardNo() %>&vegan=<%=board.getVeganlist() %>">
	                    <img src="<%=request.getContextPath()%>/image/<%=board.getBoardImageFile()%>" class="card-img-top" alt="..." id="cardimg"></a>
	                    <div class="card-body">
	                        <h5 class="card-title"><%= board.getBoardTitle() %></h5>
	                        <h6 class="card-subtitle mb-2 text-muted"><%= board.getUserId() %></h6>
	                        <h6 class="card-subtitle mb-2 text-muted">
	                        <% if(board.getVeganlist().equals("v1")){
									vg ="비건";
	                        	}
	                        else if(board.getVeganlist().equals("v2")){
								vg ="락토";
                        	}
	                        else if(board.getVeganlist().equals("v3")){
								vg ="오보";
                        	}
	                        else if(board.getVeganlist().equals("v4")){
								vg ="락토-오보";
                        	}
	                        else if(board.getVeganlist().equals("v5")){
								vg ="페스코";
                        	}
	                        %><%=vg %></h6>

							<h7 class="card-subtitle mb-2 text-muted"><%= board.getBoardCreateDate()%></h7><br>
	                        <small class="text-muted"><img src="<%=request.getContextPath() %>/css/images/heart2.png" id="recoimage"> <%= board.getRecommned()%></small>
	                    </div>
	                </div>
	                <% } %>
	            </div>
	        </div>
	    </div>
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