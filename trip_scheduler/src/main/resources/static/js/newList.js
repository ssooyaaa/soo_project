$(document).ready(function(){
	
	//사전경비추가
	$('#add-ad').click(function(){
		$('.add-ad-content').show();
	});
	
	//사전경비-저장
	$('.add-advance-btn').click(function(){
		$('.add-ad-content').hide();
	});
	
	
	//사전경비-취소
	$('.cancel-advance-btn').click(function(){
		$('.add-ad-content').hide();
	});
	
	
	//사정경비-작성삭제
	$('.del-advance').click(function(){
		this.parentElement.remove();
	});
	
	
	//일정추가버튼
	$('.add-schedule-btn').click(function(){
		$('.write-schedule').show();
	});
	
	//일정추가-저장버튼
	$('.write-save').click(function(){
		$('.write-schedule').hide();
	});
	
	//일정추가-취소버튼
	$('.write-cancel').click(function(){
		$('.write-schedule').hide();
	});
	
	//일정클릭-삭제/수정가능
	$('.edit-remove').click(function(){
		$('.update-schedule').show();
	});
	
	//일정클릭-금액등록
	$('.update-save').click(function(){
		$('.update-schedule').hide();
	});
	
	//일정클릭-일정삭제
	$('.update-cancel').click(function(){
		$('.update-schedule').hide();
	});
	
	//메모추가클릭
	$('.add-memo-btn').click(function(){
		$('.day-memo').show();
	});
	
	//메모닫기-저장-닫기
	$('.memo-close').click(function(){
		$('.day-memo').hide();
	});
});