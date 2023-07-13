$(document).ready(function(){
	
	//메인 이름 -> 홈화면으로 이동
	$('.main-name').click(function(){
		location.href='./';
	});
	
	
	//홈
	$('.home-btn').click(function(){
		location.href='./';
	});
	
	
	//로그인X-친구관리-로그인 후 사용가능 알림
	$('#plus-member-btn').click(function(){
		alert('로그인 후 사용가능합니다.');
		location.href='./login';
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
	
	
	//친구리스트
	$('.member-list').click(function(){
		location.href='./memberList';
	});
	
	
	//친구알림
	$('.member-accept').click(function(){
		location.href='./memberAlarm';
	});
	
	
	
	//로그인X-일정리스트
	$('#schedule-list-btn').click(function(){
		alert('로그인 후 사용가능합니다.');
		location.href='./login';
	});
	
	//로그인O-일정리스트
	$('#go-schedule-list-btn').click(function(){
		location.href="./allList";
	});
	
	
	
	//로그인X-여행경비
	$('#expense-list-btn').click(function(){
		alert('로그인 후 사용가능합니다.');
		location.href='./login';
	});
	
	//로그인O-여행경비
	$('#go-expense-list-btn').click(function(){
		location.href="./tripExpenses";
	});
	
	
	
	
	//로그인
	$('.side-login-btn').click(function(){
		location.href='./login';
	});
	
	
	//로그아웃
	$('#logout-btn').click(function(){
		
		$.ajax({
			url:'./user/logout',
			type:'post',
			data:{},
			success:function(res){
				if(res=='ok'){
					location.replace('./');
				}
			},
			error:function(){}
		});
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