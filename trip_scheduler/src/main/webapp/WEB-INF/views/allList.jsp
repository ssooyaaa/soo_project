<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>All List</title>

	<meta name="viewport" content="width=640, user-scalable=yes">
	
	<script src="//ajax.googleapis.com/ajax/libs/jquery/1.8.2/jquery.min.js"></script>
	<script src="js/allList.js"></script>
	
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" 
	rel="stylesheet" 
	integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" 
	crossorigin="anonymous">
	
	<link rel="stylesheet"  href="css/all.min.css"/>
	<link rel="stylesheet" href="css/app.css"/>
	<link rel="stylesheet"  href="css/allList.css"/>
	
</head>
<body>

	<%@ include file="/WEB-INF/views/include/header.jsp" %>

	<div class="allList-main">
	
		<div class="move-page-btn">
			<div>
				<i class="fa-regular fa-hand-point-left"></i>
				<button class="move-newTitle">새일정짜기</button>
			</div>
			<div>
				<button class="move-expense">여행경비</button>
				<i class="fa-regular fa-hand-point-right"></i>
			</div>
			
		</div>
		
		
		<div class="allListTitle">
			<span>여행리스트</span>
			
		</div>
		
		<div class="select-list">
			<select name="date-mode" id="date-mode">
					<option value="">최신등록순</option>
					<option value="old">오래된등록순</option>
			</select>
		</div>
	
		<div class="allList">
			<div class="allList-item">
			<div class="allList-title">태국여행 with Family</div>
			<div class="allList-date">
				<span style="font-family:home-name;width:13%;">DATE</span>
				<span>2023.06.05-2023.06.06</span>
			</div>
			<div class="allList-friends">
				<div style="font-family:home-name;width:20%;">WITH</div>
				<div class="friends">
					<span>최쑤 /</span>
					<span>sooyaa /</span>
					<span>chiossoo /</span>
					<span>최쑤 /</span>
					<span>sooyaa /</span>
					<span>chiossoo /</span>
					<span>최쑤 /</span>
					<span>sooyaa /</span>
					<span>chiossoo /</span>
				</div>
			</div>
		</div>
		</div>
		
	</div>


</body>
</html>