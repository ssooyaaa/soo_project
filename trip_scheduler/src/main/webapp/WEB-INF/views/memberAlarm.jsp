<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Member Alarm</title>

	<meta name="viewport" content="width=640, user-scalable=yes">
	
	<script src="//ajax.googleapis.com/ajax/libs/jquery/1.8.2/jquery.min.js"></script>
	<script src="js/member.js"></script>
	
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" 
	rel="stylesheet" 
	integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" 
	crossorigin="anonymous">
	
	<link rel="stylesheet"  href="css/all.min.css"/>
	<link rel="stylesheet" href="css/app.css"/>
	<link rel="stylesheet" href="css/member.css"/>

</head>
<body>

	<div class="memberAlarm-container">
		<span class="go-home">J처럼.</span>
		<span class="member-title">친구요청</span>
	
		<div class="alarm-list">
			<div class="alarm-item">
				<span id="alarm-id">ssooyaa</span>
				<button id="accept-member" style="background:#3BEA3E;">수락</button>
				<button id="reject-member" style="background:#FA5945;">거절</button>
			</div>
			
			<div class="alarm-item">
				<span>ssooyaaa</span>
				<button style="background:#3BEA3E;">수락</button>
				<button style="background:#FA5945;">거절</button>
			</div>
		
		</div>
	</div>

</body>
</html>