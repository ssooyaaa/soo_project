$(document).ready(function(){
	
	//메인 이름 -> 홈화면으로 이동
	$('.main-name').click(function(){
		location.href='./';
	});
	
	
	//홈
	$('.home-btn').click(function(){
		location.href='./';
	});

	
	//친구관리-메뉴 보이기
	$('#member-down').click(function(){
		$('.member-menu').show();
		$('#member-down').hide();
		$('#member-up').show();
	});
	
	
	//친구관리-메뉴접기
	$('#member-up').click(function(){
		$('.member-menu').hide();
		$('#member-up').hide();
		$('#member-down').show();
	});
	
});


//사이드메뉴-보이기
function showSide(){
	$('.login-side').css("visibility","visible");
}


//사이드메뉴-사라지기
function hideSide(){
	$('.login-side').css("visibility","hidden");
}