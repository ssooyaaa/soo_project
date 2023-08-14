$(document).ready(function(){
	
	
	var sm_idx = $('#map-sm-idx').val();
	
	//summary내용 가져오기
	getSummary(sm_idx);
	
	//summary내용-친구삭제
	$(document).on('click','.del-friend',function(){
		var parent = $(this).parent();
		parent.remove();
	});
	
	
	//사전경비추가
	$('#add-ad').click(function(){
		$('.add-ad-content').show();
	});
	
	//사전경비-저장
	$('.add-advance-btn').click(function(){
		var adItem = $('#ad-item').val();
		
		var num = $('#advance-add-price').val();
		var formatter = new Intl.NumberFormat('ko-KR');//숫자형식화(,)
		var formatted = formatter.format(num);
		
		if(adItem=='' || num==''){
			alert('항목과 금액을 정확하게 입력해주세요.');
		}else{
			$('.advance-list').append(
					`<div class="advance-item">
						<span>${adItem} :</span>
						<div class="advance-item-price">
							<i class="fa-solid fa-won-sign"></i>
	 						<span>${formatted}</span>
						</div>
						<i class="fa-solid fa-circle-minus del-advance"></i>
					</div>`
			);
		}
		
		
		//$('.add-ad-content').hide();
	});
	
	
	//사전경비-취소
	$('.cancel-advance-btn').click(function(){
		$('.add-ad-content').hide();
	});
	
	
	//사전경비-작성삭제
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


//summary내용 가져오기
function getSummary(sm_idx){
	$.ajax({
		url:'./schedule/getSummary',
		type:'get',
		data:{'sm_idx':sm_idx},
		success:function(map){
			
			$('.newList-main').prepend(
					`<div class="newList-title">${map.summary.name}</div>
					<div class="newList-date">${map.summary.start_date} ~ ${map.summary.end_date}</div>`
			);
			
			$.each(map.userIdList, function(index,item){
				$('.newList-friends').append(
						`<div class="newList-friend">
							<i class="fa-solid fa-circle-minus del-friend"></i>
							<span>${item}</span>
						</div>`
				);			
			});
			
		},
		error:function(err){}
	});
};