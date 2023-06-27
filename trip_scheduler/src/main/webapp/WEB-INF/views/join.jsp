<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Join</title>

	<meta name="viewport" content="width=640, user-scalable=yes">
	
	<script src="//ajax.googleapis.com/ajax/libs/jquery/1.8.2/jquery.min.js"></script>
	<script src="js/join.js"></script>
	
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" 
	rel="stylesheet" 
	integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" 
	crossorigin="anonymous">
	
	<link rel="stylesheet"  href="css/all.min.css"/>
	<link rel="stylesheet" href="css/app.css"/>

</head>
<body>

	<div class="join-container" style="display:none">
		<span class="join-title">이용약관</span>
		<div class="check">
			<input id="allCheck" name="join-check" type="checkbox" onclick="allCheck()"/>
			<span style="font-weight:900;">전체 동의</span>
		</div>
		<div class="check">
			<input id="must1" name="join-check" type="checkbox" onclick="nextColor()"/>
			<span style="text-decoration:underline;">이용약관 동의</span>
			<span style="margin-left:5px;color:var(--color-main);">(필수)</span>
		</div>
		<div class="check">
			<input id="must2" name="join-check" type="checkbox" onclick="nextColor()"/>
			<span style="text-decoration:underline;">만 14세 이상 확인</span>
			<span style="margin-left:5px;color:var(--color-main);">(필수)</span>
		</div>
		<div class="check">
			<input name="join-check" type="checkbox"/>
			<span style="text-decoration:underline;">개인정보 수집 및 이용 동의</span>
			<span style="margin-left:5px;">(선택)</span>
		</div>
		<div class="check">
			<input name="join-check" type="checkbox"/>
			<span style="text-decoration:underline;">마케팅 알림 수신동의</span>
			<span style="margin-left:5px;">(선택)</span>
		</div>
		<div class="check">
			<input name="join-check" type="checkbox"/>
			<span style="text-decoration:underline;">위치기반 서비스 이용약관 동의</span>
			<span style="margin-left:5px;">(선택)</span>
		</div>
		
		
		<button class="join-next">다음</button>
		
	</div>
	
	
	<div class="next-join-container">
		<div class="home-name-next">J처럼.</div>
		<span class="next-join-title">회원가입</span>
		<div class="join-items">
			<span class="join-item">아이디</span>
			<input id="join-id" type="text" placeholder="아이디를 입력해주세요."/>
			<span id="none-id" class="red">아이디를 입력해주세요.</span>
			<span class="red">사용불가 : 최소 8자 이상 입력해주세요.</span>
			<span class="red">사용불가 : 동일한 아이디가 존재합니다.</span>
		</div>
		<div class="join-items">
			<span class="join-item">비밀번호</span>
			<input type="text" placeholder="비밀번호를 입력해주세요."/>
			<span class="red">비밀번호를 입력해주세요.</span>
			<span class="red">사용불가 : 최소 8자 이상 입력해주세요.</span>
			<span class="red">사용불가 : 영문,숫자을 조합해주세요.</span>
		</div>
		<div class="join-items">
			<span class="join-item">비밀번호 확인</span>
			<input type="text" placeholder="비밀번호를 입력해주세요."/>
			<span class="red">비밀번호가 일치하지 않습니다.</span>
		</div>
		<div class="join-items">
			<span class="join-item">닉네임</span>
			<input type="text" placeholder="닉네임을 입력해주세요."/>
			<span class="red">닉네임을 입력해주세요.</span>
		</div>
		
		<button class="join-btn">가입하기</button>
	</div>	
	
	
	
</body>
</html>