<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>New List</title>

	<meta name="viewport" content="width=640, user-scalable=yes">
	
	<script src="//ajax.googleapis.com/ajax/libs/jquery/1.8.2/jquery.min.js"></script>
	<script src="js/newList.js"></script>
	
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" 
	rel="stylesheet" 
	integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" 
	crossorigin="anonymous">
	
	<link rel="stylesheet"  href="css/all.min.css"/>
	<link rel="stylesheet" href="css/app.css"/>
	<link rel="stylesheet"  href="css/newList.css"/>
	
</head>
<body>

	<%@ include file="/WEB-INF/views/include/header.jsp" %>

	<input type="text" id="map-sm-idx" value="${sm_idx}"/>

	<div class="newList-main">
		
		
		
		<div class="newList-friends">
			
			
			
		</div>
	</div>
	
	
	<div class="newList-schedule">
	
		<div class="advance-price">
			<div class="advance-title">
				<span>사전경비</span>
				<i class="fa-solid fa-circle-plus" id="add-ad"></i>
			</div>
			<div class="advance-list">
				
				
				
				
			</div>
		</div>
		
		<div class="add-ad-content">
			<div class="add-advance">
				<div class="add-advance-content">
					<input type="text" id="ad-item" placeholder="항목"/>
					<span style="font-weight:900;margin-left:5px;">:</span>
				</div>
				<div class="price-list">
					<select name="price-mode" id="price-mode">
							<option value="">KRW</option>
							<option value="usd">USD</option>
					</select>
				</div>
				<input class="advance-add-price" id="advance-add-price" type="number" />
				<button class="add-advance-btn">저장</button>
				<span style="font-weight:900;margin-left:5px;">/</span>
				<button class="cancel-advance-btn">취소</button>
			</div>
		</div>
		
		
		
	
		<div class="newList-day">
			<!-- <div class="day">DAY1
				
				 <div class="schedule-list">
					<div class="add-schedule">
						<span class=start-end-time>
							<span class=start-time>08:00</span>
							<span>~</span>
							<span class=end-time>09:00</span>
						</span>
						<div class="schedule-info">
							<div class="info-location">공항도착</div>
							<div class="info-money">
								<span style="margin-right:10px;">사용금액 :</span>
								<div class="money-item">
									<i class="fa-solid fa-won-sign"></i>
			 						<span>10,0000</span>
								</div>
							</div>
							
						</div>
						<div class="edit-remove">
							<i class="fa-solid fa-angles-left"></i>
						</div>
					</div>
				</div> 
				
			</div> -->
			
			 
			<!-- <div class="write-schedule">
				<div class="time">
					<input class="write-start-time" placeholder="시작시간"/>
					<span style="margin-right:5px">~</span>
					<input class="write-end-time" placeholder="종료시간"/>
				</div>
				<div class="location">
					<span style="font-weight:900;">장소 :</span>
					<input class="write-location"/>
				</div>
				<div class="money">
					<span style="font-weight:900;">금액 :</span>
					<input class="write-money"/>
				</div>
				
				<div class="write-btn">
					<span class="write-save">저장</span>
					<span class="write-cancel">취소</span>
				</div>
			</div> -->
			
			
			<!-- <div class="update-schedule">
				<div class="time">
					<input class="write-start-time" value="08:00"/>
					<span style="margin-right:5px">~</span>
					<input class="write-end-time" value="09:00"/>
				</div>
				<div class="location">
					<span style="font-weight:900;">장소 :</span>
					<input class="write-location" value="공항에서"/>
				</div>
				<div class="money">
					<span style="font-weight:900;">금액 :</span>
					<span class="price-list">
						<select name="price-mode-day" id="price-mode-day">
								<option value="">KRW</option>
								<option value="usd">USD</option>
						</select>
					</span>
					<input type="number" class="write-money" id="up-money" value="${num}"/>
				
				</div>
				
				<div class="update-btn">
					<span class="update-save">수정하기</span>
					<span class="update-cancel">일정삭제</span>
				</div>
			</div> 
			 -->
			
			<div class="day-memo">
				<div class="memo-days-close">
					<span class="memo-days">DAY 1</span>
					<i class="fa-solid fa-xmark memo-close"></i>
				</div>
				
				<div class="write-memo">
					<input type="text" placeholder="메모를 적어주세요."/>
					<i class="fa-solid fa-pen-to-square memo-btn"></i>
				</div>
				
				
				<div class="memo-list">
					<div class="memo">
						<input type="checkbox"/>
						<span class="nickname">ssooyaaa</span>
						<span class="memo-des">이ㅑㅓ리;마ㅓsdfsdsdfsafsfafdsfdsfsdfsasgㅇㄹ;ㅣㅁ나어;ㅣ마넝ㄹ;ㅣ</span>
						<i class="fa-solid fa-xmark memo-del"></i>
					</div>
					
					
				</div>
				
			</div>
			
			
		</div>
		
		<button class="save-btn">저장</button>
	</div>
	
	
</body>
</html>