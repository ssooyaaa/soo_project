<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Receipt</title>

	<meta name="viewport" content="width=640, user-scalable=yes">
	
	<script src="//ajax.googleapis.com/ajax/libs/jquery/1.8.2/jquery.min.js"></script>
	<script src="js/receipt.js"></script>
	
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" 
	rel="stylesheet" 
	integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" 
	crossorigin="anonymous">
	
	<link rel="stylesheet"  href="css/all.min.css"/>
	<link rel="stylesheet" href="css/app.css"/>
	<link rel="stylesheet"  href="css/receipt.css"/>
	
	
</head>
<body>

	<%@ include file="/WEB-INF/views/include/header.jsp" %>
	
	<input type="text" style="display:none" id="map-sm-idx" value="${sm_idx}"/>
	
	
	<div class="receipt-main">
	
		<div class="title">
			
			
		</div>
		
		<div class="date">
			<span style="font-family:home-name;margin-right:20px;">DATE</span>
			
			
		</div>
		
		
		<div class="days">
			<div class="exchange-rate">
				<div style="font-weight:800;font-size:22px;">
					<span>환율입력</span>
					<i class="fa-solid fa-circle-plus add-rate-btn"></i>
				</div>
				
				
				<div class="add-r-content">
					<div class="add-rate">
						
						<div class="price-list">
							<select name="price-mode" id="price-mode">
									<option value="USD">USD</option>
									<option value="JPY">JPY</option>
							</select>
						</div>
						<input class="rate-add-price" type="number" />
						<button class="save-rate-btn">저장</button>
						<span style="font-weight:900;margin-left:5px;">/</span>
						<button class="cancel-rate-btn">취소</button>
					</div>
				</div>
				
				
				<div class="rate-list">
					
					
					
				</div>
			</div>
			
			
			
		
			<div class="adv-price">
				<div style="font-weight:800;font-size:22px;">사전경비</div>
				<div class="adv-list">
					<!-- <div class="adv-items">
						<span>비행기값</span>
						<div class="price">
							<i class="fa-solid fa-won-sign"></i>
	 						<span>5,000</span>
						</div>
					</div>
					
					<div class="adv-items">
						<span>비행기값</span>
						<div class="price">
							<i class="fa-solid fa-won-sign"></i>
	 						<span>5,000</span>
						</div>
					</div> -->
					
				</div>
			</div>
			
			<!-- 
			<div class="day">
				<div style="font-weight:800;font-size:22px;">DAY1</div>
				<div class="receipt-list">
					<div class="receipt-items">
 						<span>부산역-라이즈커피에서</span>
 						<div class="price">
 							<i class="fa-solid fa-won-sign"></i>
 							<span>5,000</span>
 						</div>
					</div>
					
					<div class="receipt-items">
 						<span>부산역-서울기차</span>
 						<div class="price">
 							<i class="fa-solid fa-won-sign"></i>
 							<span>1,000,000</span>
 						</div>
					</div>
				</div>
			</div>
			
			
			<div class="day">
				<div style="font-weight:800;font-size:22px;">DAY2</div>
				<div class="receipt-list">
					<div class="receipt-items">
 						<span>부산역-라이즈커피에서</span>
 						<div class="price">
 							<i class="fa-solid fa-won-sign"></i>
 							<span>5,000</span>
 						</div>
					</div>
					
					<div class="receipt-items">
 						<span>부산역-서울기차</span>
 						<div class="price">
 							<i class="fa-solid fa-won-sign"></i>
 							<span>1,000,000</span>
 						</div>
 						
					</div>
				</div>
			</div>
			
			
			
			<div class="total-price">
				<span>TOTAL</span>
				<div class="total">
					<i class="fa-solid fa-won-sign"></i>
 					<span>1,000,000</span>
				</div>
			</div>
			 -->
			
			
			
		</div>
		
		
	</div>

</body>
</html>