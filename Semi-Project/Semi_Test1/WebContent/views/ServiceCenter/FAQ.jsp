<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ include file="/views/common/header.jsp" %>
    
    <!--사이드바 옆 div-->
		<div id="rightdiv">
		<!--검색창, 필터, 등등 도구섹션 -->
			<div id="board-name">
				<h3>FAQ</h3>
			</div>
			<div id="qna-toolbar"> 
				<!--검색창-->
				<div id="qna-search">
					<span>
						<input type='text' class='' />
					</span>
					<button type='submit' class=''>검색</button>
				</div>
				<div id="writing">
					<button type='submit' class=''>글쓰기</button>
				</div>	
			</div>
			<div>
				<table id="board-table">
					<thead>
						<tr>
							<th>번호</th>
							<th>제목</th>
							<th>글쓴이</th>
							<th>조회수</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>1</td>
							<td>title_1</td>
							<td>WonderDevelopers</td>
							<td>20</td>
						</tr>
					</tbody>
					<tbody>
						<tr>
							<td>1</td>
							<td>title_1</td>
							<td>WonderDevelopers</td>
							<td>20</td>
						</tr>
					</tbody>
					<tbody>
						<tr>
							<td>1</td>
							<td>title_1</td>
							<td>WonderDevelopers</td>
							<td>20</td>
						</tr>
					</tbody>
				</table>
			</div>
			<div class="page">
				<button><</button>
				<button>1</button>
				<button>2</button>
				<button>3</button>
				<button>4</button>
				<button>5</button>
				<button>6</button>
				<button>7</button>
				<button>8</button>
				<button>9</button>
				<button>10</button>
				<button>></button>
			</div>
		</div>
    
    
    
    
    
    <%@ include file="/views/common/footer.jsp" %>
    
    
    
    
    
    
    
    
    
    
    
    