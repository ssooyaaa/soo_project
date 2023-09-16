<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Trip Expenses</title>

	<meta name="viewport" content="width=640, user-scalable=yes">
	
	<script src="//ajax.googleapis.com/ajax/libs/jquery/1.8.2/jquery.min.js"></script>
	<script src="js/expenses.js"></script>
	
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" 
	rel="stylesheet" 
	integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" 
	crossorigin="anonymous">
	
	<link rel="stylesheet"  href="css/all.min.css"/>
	<link rel="stylesheet" href="css/app.css"/>
	<link rel="stylesheet"  href="css/expenses.css"/>
	
</head>
<body>

	<%@ include file="/WEB-INF/views/include/header.jsp" %>
	
	<input style="display:none" id="map-user-idx" type="text" value="${loginUser.user_idx}"/>
	
	
	<div class="expenses-main">
	
		
		<div class="move-page-btn">
			<div>
				<i class="fa-regular fa-hand-point-left"></i>
				<button class="move-newTitle">새일정짜기</button>
			</div>
			<div>
				<button class="move-allList">일정리스트</button>
				<i class="fa-regular fa-hand-point-right"></i>
			</div>
			
		</div>
		
		
		<div class="expensesTitle">
			<span>여행경비</span>
			
		</div>
		
		<div class="select-list">
			<select name="date-mode" id="date-mode">
					<option value="">최신날짜순</option>
					<option value="old">오래된날짜순</option>
			</select>
			<i class="fa-solid fa-magnifying-glass search-icon"></i>
		</div>
		
		
		<div class="expenseAllList">
		
			<div class="expenses-item">
				<div class="expenses-title">태국여행 with Family</div>
				<div class="expenses-date">
					<span style="font-family:home-name;width:13%;">DATE</span>
					<span>2023.06.05-2023.06.06</span>
				</div>
				<div class="total-expenses">
					<div>총 경비</div>
					<div class="nation-price">
						<i class="fa-solid fa-won-sign"></i>
						<span>10,000</span>
					</div>
				</div>
			</div>
		
		
		</div>
		
		<ul id="pagination-demo" class="pagination-expenseList"></ul>
	
	</div>

</body>
</html>