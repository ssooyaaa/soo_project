$(document).ready(function(){
	
	//일정클릭-영수증보기
	$('.expenses-item').click(function(){
		location.href='./receipt';
	});
	
	
	//새일정짜기
	$('.move-newTitle').click(function(){
		location.href='./newTitle';
	});
	
	
	//여행경비
	$('.move-allList').click(function(){
		location.href='./allList';
	});
	
});