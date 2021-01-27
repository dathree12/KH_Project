<%@page import="com.kh.member.model.vo.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="/views/common/header.jsp"%>

    <link rel="stylesheet" href="<%= request.getContextPath() %>/css/introAboutUsStyles.css" />
    <div class="how-section1">
  <div class="row">
    <div class="col-md-6 how-img">
      <img
        src="<%= request.getContextPath() %>/image/int1.jpg"
        class="rounded-circle img-fluid"
        alt=""
      />
    </div>
    <div class="col-md-6">
      <h4>채식주의 트랜드</h4>
      <h4 class="subheading">
        2018년 전세계 채식주의 산업 시장규모는 약 14조원으로 집계되었으며 꾸주한
        성장세를 보이고 있습니다.
      </h4>
      <p class="text-muted">
        우리나라 채식주의자는 국민의 약 2%로 미국의 5%와 비교하여 작은
        규모이지만, 채식선호인구는 국민의 25%이며 채식주의 수요는 지속적인
        성장을 거듭하고 있습니다. 채식주의는 이제 전세계적 트렌드로 확산되는
        추세입니다. 고급 레스토랑의 셰프들이 자신의 레스토랑에서 육식 메뉴를
        제외시키고, 독일에는 '비건 로드'가 등장했습니다. 북미에서는 패스트
        푸드점에서도 채식주의 버거 메뉴를 속속 도입하고 있습니다. 이 건강한
        유행에 동참하고 싶다면, 오늘 한번 베프에서 채식주의 레시피를 검색해
        보세요!
      </p>
    </div>
  </div>
  <div class="row">
    <div class="col-md-6">
      <h4>일석삼조</h4>
      <h4 class="subheading">환경, 건강, 동물복지</h4>
      <p class="text-muted">
        나 자신보다는 환경을 먼저 생각해 채식을 시작하는 사람이 많다. 동물 권리
        옹호론자, 평화운동가, 비폭력주의자 등에 경우 도축이나 도살에 대한
        거부감이 있어 육식을 하지 않는다. 게다가 채식을 함으로 인해 구제역과
        같은 축산 동물들에 의해 발생한 병도 피할 수 있게 된다. 지구온난화 유발
        요인 중 육식의 비중이 높으니, 동물 복지나 지구 환경을 생각하는
        사람이라면 채식을 고려해볼 수 있겠다. 개인적인 이유로도 채식을 한다.
        균형 잡힌 채식 식단으로 심신이 안정되었다는 후기가 그 증거. 처음에는
        간헐적으로 고기를 먹다가 점차적으로 어류, 유제품군 등을 줄여가는 방식을
        택하면 어렵지 않게 채식을 할 수 있다. 또 체질적으로 단백질이나 유당을
        분해하지 못하는 사람들도 채식으로 건강을 지킬 수 있게 되는 셈.
      </p>
    </div>
    <div class="col-md-6 how-img">
      <img
        src="<%= request.getContextPath() %>/image/int2.jpg"
        class="rounded-circle img-fluid"
        alt=""
      />
    </div>
  </div>
  <div class="row">
</div>
	      <img
        src="<%= request.getContextPath() %>/image/contents1_1.gif"
                alt="" class="vtable"
      />
  </div>

<%@ include file="/views/common/footer.jsp"%>