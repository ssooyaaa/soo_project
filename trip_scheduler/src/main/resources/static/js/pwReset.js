$(document).ready(function(){
	
	//비밀번호 재설정 확인버튼
	$('.pwResetBtn').click(function(){
		
		location.href='./pwResetNew';
		
	});
	
	
	//비밀번호 변경 버튼
	$('.pwResetNewBtn').click(function(){
		location.replace('./login');
	});
	
});