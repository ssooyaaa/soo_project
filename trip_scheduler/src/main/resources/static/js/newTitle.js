$(document).ready(function(){
	
	//친구추가버튼-친구리스트 보여줌
	$('.friends-plus').click(function(){
		$('.all-friends-list').show();
	});
	
	
	//친구리스트 완료버튼
	$('.friends-sel-btn').click(function(){
		$('.all-friends-list').hide();
	});
	
	
	//친구제외
	$('.friend-del').click(function(){
		this.parentElement.remove();
	});
	
	
	//작성완료
	$('.complete-btn').click(function(){
		location.href='./newList';
	});
});