<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>New Title</title>

	<meta name="viewport" content="width=640, user-scalable=yes">
	
	<script src="//ajax.googleapis.com/ajax/libs/jquery/1.8.2/jquery.min.js"></script>
	<script src="js/newTitle.js"></script>
	
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
	
	<div class="newTitle-container">
		<div class="newTitle-title">
			<span class="title">여행 이름</span>
			<input class="title-typing" placeholder="여행 스타일을 적어주세요."/>
		</div>
		<div class="newTitle-date">
			<span class="date">여행 일정</span>
			<div class="date-start-end">
				<input type="date" class="date-start"/>
				<span>  ~  </span>
				<input type="date" class="date-end"/>
			</div>
		</div>
		<div class="newTitle-with">
			<span class="with">누구와</span>
			<span class="friends-plus">친구추가</span>
			<div class="friends-list">
				<div class="friends">
					<span class="friend">
						<span class="friend-name">ssooyaaa</span>
						<i class="fa-solid fa-xmark friend-del"></i>
					</span>
					<span class="friend">
						<span class="friend-name">ssooyaaa</span>
						<i class="fa-solid fa-xmark friend-del"></i>
					</span>
					<span class="friend">
						<span class="friend-name">최쑤</span>
						<i class="fa-solid fa-xmark friend-del"></i>
					</span>
					<span class="friend">
						<span class="friend-name">최쑤</span>
						<i class="fa-solid fa-xmark friend-del"></i>
					</span>
					<span class="friend">
						<span class="friend-name">최쑤</span>
						<i class="fa-solid fa-xmark friend-del"></i>
					</span>			
				</div>
				
				<div class="friends">
					<span class="friend">
						<span class="friend-name">ssooyaaa</span>
						<i class="fa-solid fa-xmark friend-del"></i>
					</span>
					<span class="friend">
						<span class="friend-name">ssooyaaa</span>
						<i class="fa-solid fa-xmark friend-del"></i>
					</span>
					<span class="friend">
						<span class="friend-name">최쑤</span>
						<i class="fa-solid fa-xmark friend-del"></i>
					</span>
					<span class="friend">
						<span class="friend-name">최쑤</span>
						<i class="fa-solid fa-xmark friend-del"></i>
					</span>
					<span class="friend">
						<span class="friend-name">최쑤</span>
						<i class="fa-solid fa-xmark friend-del"></i>
					</span>
					
				</div>
			</div>
			
			
		</div>
		
		<div class="all-friends-list">
			<div class="list-title">
				친구목록
			</div>
			<div class="all-friends">
				<div class="all-friend">
					<span class="all-name">최쑤</span>
					<input class="friend-cb" type="checkbox"/>
				</div>
				<div class="all-friend">
					<span class="all-name">최쑤</span>
					<input class="friend-cb" type="checkbox"/>
				</div>
				<div class="all-friend">
					<span class="all-name">최쑤</span>
					<input class="friend-cb" type="checkbox"/>
				</div>
				<div class="all-friend">
					<span class="all-name">최쑤</span>
					<input class="friend-cb" type="checkbox"/>
				</div>
				<div class="all-friend">
					<span class="all-name">최쑤</span>
					<input class="friend-cb" type="checkbox"/>
				</div>
				<div class="all-friend">
					<span class="all-name">최쑤</span>
					<input class="friend-cb" type="checkbox"/>
				</div>
				<div class="all-friend">
					<span class="all-name">최쑤</span>
					<input class="friend-cb" type="checkbox"/>
				</div>
				<div class="all-friend">
					<span class="all-name">최쑤</span>
					<input class="friend-cb" type="checkbox"/>
				</div>
				<div class="all-friend">
					<span class="all-name">최쑤</span>
					<input class="friend-cb" type="checkbox"/>
				</div>
				<div class="all-friend">
					<span class="all-name">최쑤</span>
					<input class="friend-cb" type="checkbox"/>
				</div>
				
				
			</div>
			<div class="friends-sel-btn">완료</div>
		</div>
		
		<div class="complete-btn">완료</div>
		
	</div>
	
</body>
</html>