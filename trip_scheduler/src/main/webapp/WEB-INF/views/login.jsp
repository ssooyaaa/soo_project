<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>

	<meta name="viewport" content="width=640, user-scalable=yes">
	
	<script src="//ajax.googleapis.com/ajax/libs/jquery/1.8.2/jquery.min.js"></script>
	<script src="js/login.js"></script>
	
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" 
	rel="stylesheet" 
	integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" 
	crossorigin="anonymous">
	
	<link rel="stylesheet"  href="css/all.min.css"/>
	<link rel="stylesheet" href="css/app.css"/>
	
</head>
<body>
	
	<div class="login-container">
		<div class="home-name">J처럼.</div>
		<div class="container">
			<div class="kakao-login">카카오톡으로 로그인</div>
			<div class="or-login">또는</div>
			<input type="text" class="login-id" placeholder="아이디"/>
			<input type="password" class="login-pw" placeholder="패스워드"/>
			
			<button class="login-btn">로그인</button>
			
			<div class="pw-membership">
				<span id="update-pw-btn" style="border-right:1px solid #707B7C;">비밀번호 재설정</span>
				<span id="membership-btn">회원가입</span>
			</div>
		</div>
		
	</div>

</body>
</html>