<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ include file="/views/common/header.jsp" %>


	<section id="content">
		<div class="faqtitle">FAQ</div>
		<div id="faqcontainer">
			<div class="list list01">
				<div class="question">질문1</div>
				<div class="answer answer01">답변~~~~~~~~~~~</div>
			</div>
			<div class="list list02">
				<div class="question">질문2</div>
				<div class="answer answer02">답변~~~~~~~~~~~</div>
			</div>
			<div class="list list03">
				<div class="question">질문3</div>
				<div class="answer answer03">답변~~~~~~~~~~~</div>
			</div>
			<div class="list list04">
				<div class="question">질문4</div>
				<div class="answer answer04">답변~~~~~~~~~~~</div>
			</div>
		</div>
	</section>

	<script>
		$(document).ready(function () {
			$('.list01').click(function () {
				$('.answer01').toggleClass('open');
			});

			$('.list02').click(function () {
				$('.answer02').toggleClass('open');
			});

			$('.list03').click(function () {
				$('.answer03').toggleClass('open');
			});

			$('.list04').click(function () {
				$('.answer04').toggleClass('open');
			});

		});
	</script>
    
    
    
    
    <%@ include file="/views/common/footer.jsp" %>
    
    
    
    
    
    
    
    
    
    
    
    