$(document).ready(function(){
	
	//로그인버튼
	$('.login-btn').click(function(){
		location.href='./login';
	});
	
	
	//회원가입버튼
	$('.membership-btn').click(function(){
		location.href='./membership';
	});
	
	
	//홈로고
	$('.home-logo').click(function(){
		location.href='./';
	});
	
	
	//프로젝트 등록
	$('.add-project').click(function(){
		location.href='./newWork';
	});
	
	
	//프로젝트검색
	$('.search-project').click(function(){
		location.href='./projectList'
	});
	
	//프리랜서 등록
	$('.add-member').click(function(){
		alert('죄송합니다. 프리랜서회원만 이용할 수 있는 서비스입니다.');
	});
	
	//정규직 의뢰
	$('.commissioned').click(function(){
		location.href='./commission'
	});
});