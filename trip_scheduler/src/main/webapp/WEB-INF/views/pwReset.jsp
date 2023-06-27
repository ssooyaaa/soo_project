<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Pw Reset</title>

	<meta name="viewport" content="width=640, user-scalable=yes">
	
	<script src="//ajax.googleapis.com/ajax/libs/jquery/1.8.2/jquery.min.js"></script>
	<script src="js/pwReset.js"></script>
	
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" 
	rel="stylesheet" 
	integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" 
	crossorigin="anonymous">
	
	<link rel="stylesheet"  href="css/all.min.css"/>
	<link rel="stylesheet" href="css/app.css"/>
	
</head>
<body>

	<div class="pwReset-container">
		<span class="pwReset-title">비밀번호 재설정</span>
		<span class="pwReset-subTitle">회원가입 시 등록한 아이디와 이메일 주소를 입력해 주세요.</span>
		<input type="text" placeholder="아이디"/>
		<input type="text" placeholder="이메일 주소"/>
		
		<button class="pwResetBtn">확인</button>
	</div>

</body>
</html>