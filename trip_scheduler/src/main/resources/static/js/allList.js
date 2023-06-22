$(document).ready(function(){
	
	//일정클릭-일정보기
	$('.allList-item').click(function(){
		location.href='./newList';
	});
	
	
	//새일정짜기
	$('.move-newTitle').click(function(){
		location.href='./newTitle';
	});
	
	
	//여행경비
	$('.move-expense').click(function(){
		location.href='./tripExpenses';
	});
	
});