<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Home</title>	

	<meta name="viewport" content="width=640, user-scalable=yes">
	
	<script src="//ajax.googleapis.com/ajax/libs/jquery/1.8.2/jquery.min.js"></script>
	<script src="js/home.js"></script>
	
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" 
	rel="stylesheet" 
	integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" 
	crossorigin="anonymous">
	
	<link rel="stylesheet"  href="css/all.min.css"/>
	<link rel="stylesheet" href="css/app.css"/>
	

</head>
<body>

	<%@ include file="/WEB-INF/views/include/header.jsp" %>
	
	
	<div class="home-body">
		<img class="home-img" src="image/home-img.png" />
	</div>
	
	<div class="home-main">
		<div class="menu" style="margin-left:70px;">
			<i class="fa-solid fa-calendar-plus plus" id="newList"></i>
			<div class="menu-name">새일정짜기</div>
		</div>
		<div class="menu">
			<i class="fa-solid fa-list list"></i>
			<div class="menu-name">일정리스트</div>
		</div>
		<div class="menu" style="margin-right:70px;">
			<i class="fa-solid fa-wallet wallet"></i>
			<div class="menu-name">여행경비</div>
		</div>
		
	</div>
	
</body>
</html>