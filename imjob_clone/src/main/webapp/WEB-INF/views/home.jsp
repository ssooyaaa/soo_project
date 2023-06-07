<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<html>
<head>
	<title>Home</title>
	
	<script src="//ajax.googleapis.com/ajax/libs/jquery/1.8.2/jquery.min.js"></script>
	<script src="./resources/js/home.js"></script>
	
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" 
	rel="stylesheet" 
	integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" 
	crossorigin="anonymous">
		
	
	<link rel="stylesheet"  href="./resources/css/all.min.css"/>
	<link rel="stylesheet" href="./resources/css/app.css"/>
	
</head>
<body>

	<%@ include file="/WEB-INF/views/include/header.jsp" %>
	
	<div class="main-banner">
		<img src="https://t1.daumcdn.net/news/201908/08/ked/20190808070902855uguz.jpg"/>
		<div class="main-container">
			<span style="font-size:70px;font-weight:700;margin-bottom:20px;">IT프리랜서 매칭 플랫폼</span>
			<span style="font-size:40px;font-weight:600;color:#2CBDE5;margin-bottom:40px;">개발자/퍼블리셔/디자이너/기획자 프로젝트 연결</span>
			<span style="font-size:25px;margin-bottom:20px;">다양한 카테고리의 IT 프로젝트를 등록하고 맞춤 전문가를 만나보세요!</span>
			<span class="banner-btn">IT프로젝트 등록하기</span>
		</div>
	</div>
	
	
	<div class="main-search">
		<span style="font-size:40px;font-weight:700;">나에게 딱 맞는 프로젝트를 찾으세요</span>
		<span style="margin-top:30px; width:90px; border-bottom:7px solid #112579;"></span>
		<div class="col-4" style="width:100%;margin-top:50px; display:flex; flex-direction:row; justify-content:center;">
			<div class="search-card">
				<img src="./resources/image/imjob-icon.png"/>
				<span>#프로그래밍</span>
				
				<div class="programming-btn">
					<span style="font-size:30px;font-weight:700;margin-bottom:30px;">프로그래밍</span>
					<span style="font-size:20px;padding:5px 20px;border:1px solid #fff;border-radius:20px;">바로가기</span>
				</div>
			</div>
			
			
			<div class="search-card">
				<img src="./resources/image/imjob-icon.png"/>
				<span>#웹기획</span>
				
				<div class="programming-btn">
					<span style="font-size:30px;font-weight:700;margin-bottom:30px;">웹기획</span>
					<span style="font-size:20px;padding:5px 20px;border:1px solid #fff;border-radius:20px;">바로가기</span>
				</div>
			</div>
			
			<div class="search-card">
				<img src="./resources/image/imjob-icon.png"/>
				<span>#퍼블리싱</span>
				
				<div class="programming-btn">
					<span style="font-size:30px;font-weight:700;margin-bottom:30px;">퍼블리싱</span>
					<span style="font-size:20px;padding:5px 20px;border:1px solid #fff;border-radius:20px;">바로가기</span>
				</div>
			</div>
			
			<div class="search-card">
				<img src="./resources/image/imjob-icon.png"/>
				<span>#디자인</span>
				
				<div class="programming-btn">
					<span style="font-size:30px;font-weight:700;margin-bottom:30px;">디자인</span>
					<span style="font-size:20px;padding:5px 20px;border:1px solid #fff;border-radius:20px;">바로가기</span>
				</div>
			</div>
		</div>
		<div class="membership-add-btn">프리랜서 가입</div>
	</div>
	
	
	<div class="main-recent">
		<div class="main-recent-title" style="display:flex;flex-direction:row;align-items:center;margin-bottom:20px;">
			<span style="background:#112579;width:20px;height:20px;margin-right:10px;"></span>
			<span style="font-size:23px;font-weight:700;">최근프로젝트 정보</span>
		</div>
		
		<div class="recent-projects">
			<div class="col-6">
				<div class="recent-project">
					<div class="project-type">
						<span class="type">개발</span>
						<span class="type">JAVA/JSP</span>
					</div>
					<div class="project-name">
						[초급/백엔드/정규직/수원(광교)] AI 솔루션 개발
					</div>
					<div class="project-deadline">
						<span style="margin-right:5px;">기간</span>
						<span>2023-06-12 ~ 2024-12-31</span>
					</div>
					<div class="project-info">
						<div class="info">
							<span class="info-type">근무형태</span>
							<span class="info-more">정규</span>
							<span style="margin-right:3px;">|</span>
						</div>
						<div class="info">
							<span class="info-type">근무지</span>
							<span class="info-more">경기 수원시 영통구</span>
							<span style="margin-right:3px;">|</span>
						</div>
						<div class="info">
							<span class="info-type">단가</span>
							<span class="info-more">3,400~5,000만원</span>
						</div>
					</div>
				</div>
				
			</div>
			
			<div class="col-6">
				<div class="recent-project">
					<div class="project-type">
						<span class="type">개발</span>
						<span class="type">JAVA/JSP</span>
					</div>
					<div class="project-name">
						[초급/백엔드/정규직/수원(광교)] AI 솔루션 개발
					</div>
					<div class="project-deadline">
						<span style="margin-right:5px;">기간</span>
						<span>2023-06-12 ~ 2024-12-31</span>
					</div>
					<div class="project-info">
						<div class="info">
							<span class="info-type">근무형태</span>
							<span class="info-more">정규</span>
							<span style="margin-right:3px;">|</span>
						</div>
						<div class="info">
							<span class="info-type">근무지</span>
							<span class="info-more">경기 수원시 영통구</span>
							<span style="margin-right:3px;">|</span>
						</div>
						<div class="info">
							<span class="info-type">단가</span>
							<span class="info-more">3,400~5,000만원</span>
						</div>
					</div>
				</div>
				
			</div>
			
			<div class="col-6">
				<div class="recent-project">
					<div class="project-type">
						<span class="type">개발</span>
						<span class="type">JAVA/JSP</span>
					</div>
					<div class="project-name">
						[초급/백엔드/정규직/수원(광교)] AI 솔루션 개발
					</div>
					<div class="project-deadline">
						<span style="margin-right:5px;">기간</span>
						<span>2023-06-12 ~ 2024-12-31</span>
					</div>
					<div class="project-info">
						<div class="info">
							<span class="info-type">근무형태</span>
							<span class="info-more">정규</span>
							<span style="margin-right:3px;">|</span>
						</div>
						<div class="info">
							<span class="info-type">근무지</span>
							<span class="info-more">경기 수원시 영통구</span>
							<span style="margin-right:3px;">|</span>
						</div>
						<div class="info">
							<span class="info-type">단가</span>
							<span class="info-more">3,400~5,000만원</span>
						</div>
					</div>
				</div>
				
			</div>
			
			
			
		
		</div>
		
		<div class="more-projects-btn">+ 더보기</div>
		
		
	</div>
	
	<%@ include file="/WEB-INF/views/include/footer.jsp" %>
	
</body>
</html>
