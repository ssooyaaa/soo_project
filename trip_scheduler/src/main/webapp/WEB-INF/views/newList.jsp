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

	<input type="text" style="display:none" id="map-sm-idx" value="${sm_idx}"/>
	<%-- <input type="text" id="map-id" value="${userId}"/> --%>

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
			
			
			
		</div>
		
		<button class="del-btn">일정 전체 삭제</button>
	</div>
	
	
</body>
</html>