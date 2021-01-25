<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ include file="/views/common/header.jsp" %>


		<div class="faqtitle">FAQ</div>
		<div id="faqcontainer">
			<div class="list list01">
				<div class="question">레시피 리뷰를 등록하고 싶어요</div>
				<div class="answer answer01">레시피를 보고 만든 요리! 인증샷 바로 찍어서 리뷰로 올리세요.

[앱]

- 레시피 상단의 [카메라]기능으로 찰칵!

- 하단에서 [리뷰]로 등록하세요.

- 운영진의 승인 후 다른 사용자들에게 노출되며, 쉐프님에게 알림이 전송됩니다.

[모바일웹]

- 레시피 하단에서 리뷰를 작성하실 수 있어요.

※ PC웹엔 리뷰 입력란이 없으니 유의해주세요.



편리한 기능이 가득한 앱을 다운받아 이용하세요 :)

감사합니다.</div>
			</div>
			<div class="list list02">
				<div class="question">동영상URL 가져오는 방법!!</div>
				<div class="answer answer02">답변~~~~~~~~~~~</div>
			</div>
			<div class="list list03">
				<div class="question">회원가입은 어떻게 하나요??</div>
				<div class="answer answer03">답변~~~~~~~~~~~</div>
			</div>
			<div class="list list04">
				<div class="question">나의 활동내역을 확인하고 싶어요</div>
				<div class="answer answer04">답변~~~~~~~~~~~</div>
			</div>
		</div>


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
    
    
    
    
    
    
    
    
    
    
    
    