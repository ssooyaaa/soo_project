$(document).ready(function(){
	
	var user_idx = $('#map-user-idx').val();
	
	$('#newList').click(function(){
		location.href='./newTitle';
	});
	
	$('#allList').click(function(){
		location.href='./allList?user_idx='+user_idx;
	});
	
	$('#tripExpenses').click(function(){
		location.href='./tripExpenses?user_idx='+user_idx;
	});
	
});
