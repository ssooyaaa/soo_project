<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Pw Reset New</title>

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
		<span class="pwReset-title">새비밀번호 설정</span>
		<span class="pwReset-subTitle">새로운 비밀번호를 입력해주세요.</span>
		<input type="text" placeholder="새비밀번호(영문자,숫자포함 최소 8자 이상)"/>
		<input type="text" placeholder="새비밀번호 확인"/>
		
		<button class="pwResetNewBtn">비밀번호 변경</button>
	</div>

</body>
</html>