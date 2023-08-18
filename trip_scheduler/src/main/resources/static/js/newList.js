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
		
		var price = '';		
		if($('#price-mode option:selected').val()==''){
			price = '';
		}else if($('#price-mode option:selected').val()=='usd'){
			price = 'usd'
		}
		
		var num = $('#advance-add-price').val();
		var formatter = new Intl.NumberFormat('ko-KR');//숫자형식화(,)
		var formatted = formatter.format(num);
		
		if(adItem=='' || num==''){
			alert('항목과 금액을 정확하게 입력해주세요.');
		}else if(price==''){
			$('.advance-list').append(
					`<div class="advance-item">
						<span class="advance-items">${adItem}</span>
						<span style="">:</span>
						<div class="advance-item-price">
							<i class="fa-solid fa-won-sign"></i>
	 						<span>${formatted}</span>
						</div>
						<i class="fa-solid fa-circle-minus del-advance"></i>
					</div>`
			);
		}else if(price=='usd'){
			$('.advance-list').append(
					`<div class="advance-item">
						<span class="advance-items">${adItem}</span>
						<span style="">:</span>
						<div class="advance-item-price">
							<i class="fa-solid fa-dollar-sign"></i>
	 						<span>${formatted}</span>
						</div>
						<i class="fa-solid fa-circle-minus del-advance"></i>
					</div>`
			);
		}
		
	});
	
	
	//사전경비-취소
	$('.cancel-advance-btn').click(function(){
		$('.add-ad-content').hide();
	});
	
	
	//사전경비-작성삭제
	$(document).on('click','.del-advance',function(){
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
			
			var days = map.summary.days;
			for(var i=1;i<=days;i++){
				$('.newList-day').append(
						`<div class="day" id="day${i}">DAY${i}
				
							<div class="schedule-list">
								<div class="add-schedule">
									<span class=start-end-time>
										<span class=start-time>08:00</span>
										<span>~</span>
										<span class=end-time>09:00</span>
									</span>
									<div class="schedule-info">
										<div class="info-location">공항도착</div>
										<div class="info-money">사용금액 :</div>
									</div>
									<div class="edit-remove">
										<i class="fa-solid fa-angles-left"></i>
									</div>
								</div>
							</div>
							
							
							<div class="write-schedule">
								<div class="time">
									<input class="write-start-time" placeholder="시작시간"/>
									<span style="margin-right:5px">~</span>
									<input class="write-end-time" placeholder="종료시간"/>
								</div>
								<div class="location">
									<span style="font-weight:900;">장소 :</span>
									<input class="write-location"/>
								</div>
								<div class="money">
									<span style="font-weight:900;">금액 :</span>
									<input class="write-money"/>
								</div>
								
								<div class="write-btn">
									<span class="write-save">저장</span>
									<span class="write-cancel">취소</span>
								</div>
							</div>
							
							
							
							<div class="update-schedule">
								<div class="time">
									<input class="write-start-time" value="08:00"/>
									<span style="margin-right:5px">~</span>
									<input class="write-end-time" value="09:00"/>
								</div>
								<div class="location">
									<span style="font-weight:900;">장소 :</span>
									<input class="write-location" value="공항에서"/>
								</div>
								<div class="money">
									<span style="font-weight:900;">금액 :</span>
									<input class="write-money"/>
								</div>
								
								<div class="update-btn">
									<span class="update-save">수정하기</span>
									<span class="update-cancel">일정삭제</span>
								</div>
							</div>
							
							
							
							<div class="day-memo">
								<div class="memo-days-close">
									<span class="memo-days">DAY 1</span>
									<i class="fa-solid fa-xmark memo-close"></i>
								</div>
								
								<div class="write-memo">
									<input type="text" placeholder="메모를 적어주세요."/>
									<i class="fa-solid fa-pen-to-square memo-btn"></i>
								</div>
								
								
								<div class="memo-list">
									<div class="memo">
										<input type="checkbox"/>
										<span class="nickname">ssooyaaa</span>
										<span class="memo-des">이ㅑㅓ리;마ㅓsdfsdsdfsafsfafdsfdsfsdfsasgㅇㄹ;ㅣㅁ나어;ㅣ마넝ㄹ;ㅣ</span>
										<i class="fa-solid fa-xmark memo-del"></i>
									</div>
									<div class="memo">
										<input type="checkbox"/>
										<span class="nickname">ssooyaaa</span>
										<span class="memo-des">이ㅑㅓ리;마ㅓsdfsdfsfsdfdfsdfsasgㅇㄹ;ㅣㅁ나어;ㅣ마넝ㄹ;ㅣ</span>
										
									</div>
									<div class="memo">
										<input type="checkbox"/>
										<span class="nickname">ssooyaaa</span>
										<span class="memo-des">이ㅑㅓ리;마ㅓsdfsdfsfsdfdfsdfsasgㅇㄹ;ㅣㅁ나어;ㅣ마넝ㄹ;ㅣ</span>
										
									</div>
									<div class="memo">
										<input type="checkbox"/>
										<span class="nickname">ssooyaaa</span>
										<span class="memo-des">이ㅑㅓ리;마ㅓsdfsdfsfsdfdfsdfsasgㅇㄹ;ㅣㅁ나어;ㅣ마넝ㄹ;ㅣ</span>
										
									</div>
									<div class="memo">
										<input type="checkbox"/>
										<span class="nickname">ssooyaaa</span>
										<span class="memo-des">이ㅑㅓ리;마ㅓsdfsdfsfsdfdfsdfsasgㅇㄹ;ㅣㅁ나어;ㅣ마넝ㄹ;ㅣ</span>
										
									</div>
									
									<div class="memo">
										<input type="checkbox"/>
										<span class="nickname">ssooyaaa</span>
										<span class="memo-des">이ㅑㅓ리;마ㅓsdfsdfsfsdfdfsdfsasgㅇㄹ;ㅣㅁ나어;ㅣ마넝ㄹ;ㅣ</span>
										
									</div>
									<div class="memo">
										<input type="checkbox"/>
										<span class="nickname">ssooyaaa</span>
										<span class="memo-des">이ㅑㅓ리;마ㅓsdfsdfsfsdfdfsdfsasgㅇㄹ;ㅣㅁ나어;ㅣ마넝ㄹ;ㅣ</span>
										
									</div>
									<div class="memo">
										<input type="checkbox"/>
										<span class="nickname">ssooyaaa</span>
										<span class="memo-des">이ㅑㅓ리;마ㅓsdfsdfsfsdfdfsdfsasgㅇㄹ;ㅣㅁ나어;ㅣ마넝ㄹ;ㅣ</span>
										
									</div>
									<div class="memo">
										<input type="checkbox"/>
										<span class="nickname">ssooyaaa</span>
										<span class="memo-des">이ㅑㅓ리;마ㅓsdfsdfsfsdfdfsdfsasgㅇㄹ;ㅣㅁ나어;ㅣ마넝ㄹ;ㅣ</span>
										
									</div>
									<div class="memo">
										<input type="checkbox"/>
										<span class="nickname">ssooyaaa</span>
										<span class="memo-des">이ㅑㅓ리;마ㅓsdfsdfsfsdfdfsdfsasgㅇㄹ;ㅣㅁ나어;ㅣ마넝ㄹ;ㅣ</span>
										
									</div>
									<div class="memo">
										<input type="checkbox"/>
										<span class="nickname">ssooyaaa</span>
										<span class="memo-des">이ㅑㅓ리;마ㅓsdfsdfsfsdfdfsdfsasgㅇㄹ;ㅣㅁ나어;ㅣ마넝ㄹ;ㅣ</span>
										
									</div>
									<div class="memo">
										<input type="checkbox"/>
										<span class="nickname">ssooyaaa</span>
										<span class="memo-des">이ㅑㅓ리;마ㅓsdfsdfsfsdfdfsdfsasgㅇㄹ;ㅣㅁ나어;ㅣ마넝ㄹ;ㅣ</span>
										
									</div>
									<div class="memo">
										<input type="checkbox"/>
										<span class="nickname">ssooyaaa</span>
										<span class="memo-des">이ㅑㅓ리;마ㅓsdfsdfsfsdfdfsdfsasgㅇㄹ;ㅣㅁ나어;ㅣ마넝ㄹ;ㅣ</span>
										
									</div>
									<div class="memo">
										<input type="checkbox"/>
										<span class="nickname">ssooyaaa</span>
										<span class="memo-des">이ㅑㅓ리;마ㅓsdfsdfsfsdfdfsdfsasgㅇㄹ;ㅣㅁ나어;ㅣ마넝ㄹ;ㅣ</span>
										
									</div>
									
								</div>
								
							</div>
							
							
							<div class="day-btn">
								<span class="add-schedule-btn">일정추가</span>
								<span class="add-memo-btn">메모추가</span>
							</div>
							
							
						</div>`
				);
			} 
		},
		error:function(err){}
	});
};