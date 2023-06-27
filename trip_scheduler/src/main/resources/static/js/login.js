$(document).ready(function(){
	
	//홈화면이동
	$('.home-name').click(function(){
		location.href='./';
	});
	
	//비밀번호 재설정 버튼
	$('#update-pw-btn').click(function(){
		location.href='./pwReset';
	});
	
	//회원가입버튼
	$('#membership-btn').click(function(){
		location.href='./join';
	});
	
	//로그인하기
	$('.login-btn').click(function(){
		alert('로그인');
	});
	
});