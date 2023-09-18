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
	
	<!-- //페이지네이션 -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/twbs-pagination/1.4.2/jquery.twbsPagination.min.js" 
	integrity="sha512-frFP3ZxLshB4CErXkPVEXnd5ingvYYtYhE5qllGdZmcOlRKNEPbufyupfdSTNmoF5ICaQNO6SenXzOZvoGkiIA==" 
	crossorigin="anonymous" referrerpolicy="no-referrer"></script>
	
	<link rel="stylesheet"  href="css/all.min.css"/>
	<link rel="stylesheet" href="css/app.css"/>
	<link rel="stylesheet"  href="css/allList.css"/>
	
</head>
<body>

	<%@ include file="/WEB-INF/views/include/header.jsp" %>
	
	<input style="display:none" id="map-user-idx" type="text" value="${loginUser.user_idx}"/>
	<input style="display:none" id="map-kakao-idx" type="text" value="${kakaoUser.user_idx}"/>
	

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
					<option value="">최신날짜순</option>
					<option value="old">오래된날짜순</option>
			</select>
			<i class="fa-solid fa-magnifying-glass search-icon"></i>
		</div>
	
		<div class="allList">
			
			
			

			
		</div>
		
		<ul id="pagination-demo" class="pagination-allList"></ul>
		
	</div>


</body>
</html>