<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<html>
<head>
	<title>Home</title>
	
	<script src="//ajax.googleapis.com/ajax/libs/jquery/1.8.2/jquery.min.js"></script>
	<script src="./resources/js/header.js"></script>
	
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
			</div>
			<div class="search-card">
				<img src="./resources/image/imjob-icon.png"/>
				<span>#웹기획</span>
			</div>
			<div class="search-card">
				<img src="./resources/image/imjob-icon.png"/>
				<span>#퍼블리싱</span>
			</div>
			<div class="search-card">
				<img src="./resources/image/imjob-icon.png"/>
				<span>#디자인</span>
			</div>
		</div>
		<div class="membership-add-btn">프리랜서 가입</div>
	</div>
	
	
	<div class="main-recent">
	
	</div>
	
</body>
</html>
