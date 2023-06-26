<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Header</title>

	<meta name="viewport" content="width=640, user-scalable=yes">
	
	<script src="//ajax.googleapis.com/ajax/libs/jquery/1.8.2/jquery.min.js"></script>
	<script src="js/header.js"></script>
	
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" 
	rel="stylesheet" 
	integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" 
	crossorigin="anonymous">
	
	<link rel="stylesheet"  href="css/all.min.css"/>
	<link rel="stylesheet" href="css/app.css"/>
	
	
	<!-- //페이지네이션 -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/twbs-pagination/1.4.2/jquery.twbsPagination.min.js" 
	integrity="sha512-frFP3ZxLshB4CErXkPVEXnd5ingvYYtYhE5qllGdZmcOlRKNEPbufyupfdSTNmoF5ICaQNO6SenXzOZvoGkiIA==" 
	crossorigin="anonymous" referrerpolicy="no-referrer"></script>
	

</head>
<body>

	
	<header class="header">
		<span class="main-name">J처럼.</span>
		<i class="fa-solid fa-bars login-bar" onclick="showSide()"></i>
	</header>
	
	
	<div class="login-side">
		<div class="login-side-close">
			<i class="fa-solid fa-xmark close-btn" onclick="hideSide()"></i>
		</div>
		<div class="login-side-menu">
			<div class="side-main">
				<div class="side-login-alert">
					로그인 후 사용해주세요
					<i class="fa-regular fa-face-smile-wink"></i>
				</div>
				<div class="side-login-btn">
					로그인>
				</div>
			</div>
			
			<div class="side-menu">
				<div class="home-btn">
					홈
				</div>
				
				<div class="plus-member-btn">
					<span>친구관리</span>
					<i class="fa-solid fa-angle-down" id="member-down"></i>
					<i class="fa-solid fa-angle-up" id="member-up"></i>
				</div>
				<div class="member-menu">
					<div class="member-list">친구리스트</div>
					<div class="member-accept">친구알림</div>
				</div>
				
				<div style="background:#E0DDDD; height:2%;"></div>
				<div class="schedule-list-btn">
					<span>일정리스트</span>
				</div>
				<div class="expense-list-btn">
					<span>여행경비</span>
				</div>
				<div style="background:#E0DDDD; height:74%;"></div>
			</div>
		</div>
	</div>
	
	
</body>
</html>