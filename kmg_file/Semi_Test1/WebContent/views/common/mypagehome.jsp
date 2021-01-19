<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="/views/common/mymenu.jsp"%>

		<!--검색창, 필터, 등등 도구섹션 -->
		<div id="mypage-toolbar"> 
			<!--검색창-->
			<div class="mypage-search">
				<span>
					<input type='text' class='' />
				</span>
				<button type='submit' class=''>검색</button>
			</div>
			<!--정렬 필터창-->
			<div class="mypage-sorting">
				<button class="dropdown-button">정렬</button>
				<div class="dropdown-content">
					<a href="#">최신순</a>
					<a href="#">별점순</a>
					<a href="#">담은순</a>
				</div>
			</div>
		</div>
</section>

<%@ include file="/views/common/footer.jsp"%>
