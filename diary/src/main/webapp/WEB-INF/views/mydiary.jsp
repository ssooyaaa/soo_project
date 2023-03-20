
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
		
<html>

<head>
	
	<title>MyDiary</title>
	
	<meta name="viewport" content="width=1190, user-scalable=yes">
	<script src="//ajax.googleapis.com/ajax/libs/jquery/1.8.2/jquery.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/header.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/mydiary.js"></script>
	
	
	
	<!-- //페이지네이션 -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/twbs-pagination/1.4.2/jquery.twbsPagination.min.js" 
	integrity="sha512-frFP3ZxLshB4CErXkPVEXnd5ingvYYtYhE5qllGdZmcOlRKNEPbufyupfdSTNmoF5ICaQNO6SenXzOZvoGkiIA==" 
	crossorigin="anonymous" referrerpolicy="no-referrer"></script>
	
	<!-- firebase이미지 -->
	<script src="https://www.gstatic.com/firebasejs/3.2.0/firebase.js"></script>
	<script src="https://www.gstatic.com/firebasejs/7.3.0/firebase-app.js"></script>
	<script src="https://www.gstatic.com/firebasejs/6.2.0/firebase-storage.js"></script>	
	<script src="./resources/js/config.js"></script>
	
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" 
	rel="stylesheet" 
	integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" 
	crossorigin="anonymous">
		
	
	<link rel="stylesheet"  href="./resources/css/all.min.css"/>
	<link rel="stylesheet" href="./resources/css/app.css"/>
	<link rel="stylesheet" href="./resources/css/mydiary.css"/>
	
	
	
</head>
<body>
	
		<%@ include file="/WEB-INF/views/include/header.jsp" %>
		
	
	<div class="mydiary-body">
		<img class="mydiary-img" src="./resources/image/diary-body.jpg"/>
			<div class="mydiary-container">
				<div class="mydiary-name"> MY DIARY
				</div>
				<div class="mydiary-write"> 다이어리 작성하기
					<i class="fa-solid fa-pencil"></i>
				</div>
			</div>
		<div class="mydiary-search">
			<i class="fa-solid fa-location-dot"></i>
			<input class="search" id="search" type="search" placeholder="검색 (나라이름)"/>
			<i class="fa-solid fa-magnifying-glass glass" id="search-glass"></i>
		</div>
		
		
		<!--<div class="mydiary-content" id="mydiary-content">
			<img class="mydiary-content-main-img" src="./resources/image/abroad/bridge.jpg"/>
			<div class="mydiary-content-main-content">
				<div class="mydiary-content-main-text">파리에서의 1일차
				</div>
				<div class="mydiary-content-sub-text">정확한 위치는 기억이 나지 않지만 에펠탑~루브르 가는길에 한컷
				</div>
				<i class="fa-solid fa-location-dot mydiary-content-location">
					<span style="font-family:hip; font-weight:500;">프랑스/파리</span>
				</i>
				<i class="fa-regular fa-calendar mydiary-content-calendar">
					<span style="font-family:hip;">2019.4.27</span>
				</i>
				<i class="fa-solid fa-cloud-sun mydiary-content-weather">
					<span style="font-family:hip; font-weight:500;">맑음</span>
				</i>
			</div>
			<div class="mydiary-content-more">다이어리 더보기
				<i class="fa-solid fa-circle-right more-button"></i>
			</div>
		</div>
		
		<div class="mydiary-content">
			<img class="mydiary-content-main-img" src="./resources/image/abroad/chermatt.jpg"/>
			<div class="mydiary-content-main-content">
				<div class="mydiary-content-main-text">스위스-체르마트
				</div>
				<div class="mydiary-content-sub-text">스냅사진찍으로 기차타고 올라가는길
				</div>
				<i class="fa-solid fa-location-dot mydiary-content-location">
					<span style="font-family:hip; font-weight:500;">스위스/체르마트</span>
				</i>
				<i class="fa-regular fa-calendar mydiary-content-calendar">
					<span style="font-family:hip;">2019.8.12</span>
				</i>
				<i class="fa-solid fa-cloud-sun mydiary-content-weather">
					<span style="font-family:hip; font-weight:500;">맑지만 구름낌</span>
				</i>
			</div>
			<div class="mydiary-content-more">다이어리 더보기
				<i class="fa-solid fa-circle-right more-button"></i>
			</div>
		</div>
		
		<div class="mydiary-content">
			<img class="mydiary-content-main-img" src="./resources/image/abroad/disney.jpg"/>
			<div class="mydiary-content-main-content">
				<div class="mydiary-content-main-text">파리에서의 3일차
				</div>
				<div class="mydiary-content-sub-text">마지막 불꽃놀이 끝나고 성앞에서
				</div>
				<i class="fa-solid fa-location-dot mydiary-content-location">
					<span style="font-family:godik; font-weight:500;"> 프랑스/파리</span>
				</i>
				<i class="fa-regular fa-calendar mydiary-content-calendar">
					<span style="font-family:godik; font-weight:500;"> 2019.4.9</span>
				</i>
				<i class="fa-solid fa-cloud-sun mydiary-content-weather">
					<span style="font-family:godik; font-weight:500;">맑았지만 너무 추웠음</span>
				</i>
			</div>
			<div class="mydiary-content-more">다이어리 더보기
				<i class="fa-solid fa-circle-right more-button"></i>
			</div>
		</div>
		
		<div class="mydiary-content">
			<img class="mydiary-content-main-img" src="./resources/image/abroad/engunder.jpg"/>
			<div class="mydiary-content-main-content">
				<div class="mydiary-content-main-text">런던떠나기 일보직전
				</div>
				<div class="mydiary-content-sub-text">영국 떠나기전 지하철역 안에서
				</div>
				<i class="fa-solid fa-location-dot mydiary-content-location">
					<span style="font-family:hip; font-weight:500;">영국/런던</span>
				</i>
				<i class="fa-regular fa-calendar mydiary-content-calendar">
					<span style="font-family:hip;">2019.8.16</span>
				</i>
				<i class="fa-solid fa-cloud-sun mydiary-content-weather">
					<span style="font-family:hip; font-weight:500;">기억이 안남</span>
				</i>
			</div>
			<div class="mydiary-content-more">다이어리 더보기
				<i class="fa-solid fa-circle-right more-button"></i>
			</div>
		</div>
		
		<div class="mydiary-content">
			<img class="mydiary-content-main-img" src="./resources/image/abroad/scotland.jpg"/>
			<div class="mydiary-content-main-content">
				<div class="mydiary-content-main-text">해리포터 작가가 될 수 있었을까...?
				</div>
				<div class="mydiary-content-sub-text">빅토리아 스트릿에서
				</div>
				<i class="fa-solid fa-location-dot mydiary-content-location">
					<span style="font-family:hip; font-weight:500;">스코틀랜드/에딘버러</span>
				</i>
				<i class="fa-regular fa-calendar mydiary-content-calendar">
					<span style="font-family:hip;">2019.4.27</span>
				</i>
				<i class="fa-solid fa-cloud-sun mydiary-content-weather">
					<span style="font-family:hip; font-weight:500;">흐림</span>
				</i>
			</div>
			<div class="mydiary-content-more">다이어리 더보기
				<i class="fa-solid fa-circle-right more-button"></i>
			</div>
		</div>
		
		<div class="mydiary-content">
			<img class="mydiary-content-main-img" src="./resources/image/abroad/bridge.jpg"/>
			<div class="mydiary-content-main-content">
				<div class="mydiary-content-main-text">파리에서의 1일차
				</div>
				<div class="mydiary-content-sub-text">정확한 위치는 기억이 나지 않지만 에펠탑~루브르 가는길에 한컷
				</div>
				<i class="fa-solid fa-location-dot mydiary-content-location">
					<span style="font-family:hip; font-weight:500;">프랑스 / 파리</span>
				</i>
				<i class="fa-regular fa-calendar mydiary-content-calendar">
					<span style="font-family:hip;">2019.4.27</span>
				</i>
				<i class="fa-solid fa-cloud-sun mydiary-content-weather">
					<span style="font-family:hip; font-weight:500;">맑음</span>
				</i>
			</div>
			<div class="mydiary-content-more">다이어리 더보기
				<i class="fa-solid fa-circle-right more-button"></i>
			</div>
		</div>
	</div> -->
	
	
	<div id="mydiary-container">
	</div>	
	
	<ul id="pagination-demo" class="pagination-sm"></ul>
	
	<!-- <div class="pagenumber">
		<nav aria-label="Page navigation example">
		  <ul class="pagination">
		    <li class="page-item">
		      <a class="page-link" href="#" aria-label="Previous">
		        <span aria-hidden="true">&laquo;</span>
		      </a>
		    </li>
		    <li class="page-item"><a class="page-link" href="#">1</a></li>
		    <li class="page-item"><a class="page-link" href="#">2</a></li>
		    <li class="page-item"><a class="page-link" href="#">3</a></li>
		    <li class="page-item">
		      <a class="page-link" href="#" aria-label="Next">
		        <span aria-hidden="true">&raquo;</span>
		      </a>
		    </li>
		  </ul>
		</nav>
	</div> -->
	
	
	
	<footer>
		<%@ include file="/WEB-INF/views/footer.jsp" %>
	</footer>

</body>

</html>
