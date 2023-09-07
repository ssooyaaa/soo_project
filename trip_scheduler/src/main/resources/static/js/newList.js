$(document).ready(function(){
	
	
	var sm_idx = $('#map-sm-idx').val();
	//var userId = $('#map-id').val();
	
	//summary내용 가져오기+저장된 내용 가져오기
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
		
		var number = parseInt(num);//strign->int로 변경
		
		
		if(adItem=='' || num==''){
			alert('항목과 금액을 정확하게 입력해주세요.');
		}else{
			$('.advance-list').append(
					`<div class="advance-item">
						<span class="advance-items">${adItem}</span>
						<span style="">:</span>
						<div class="advance-item-price">
							<i class="fa-solid fa-won-sign price-type"></i>
	 						<span>${formatted}</span>
						</div>
						<i class="fa-solid fa-circle-minus del-advance"></i>
					</div>`
			);
		
			var type = $('.price-type').last();
			
			//금액표기 변경
			if(price=='usd'){
				type.replaceWith(function() {
					  return '<i class="fa-solid fa-dollar-sign"></i>';
				});
			}
			
			$.ajax({
				url:'./schedule/addAdvance',
				type:'post',
				data:{
					'sm_idx':sm_idx,
					'item':adItem,
					'price_type':price,
					'price':number
				},
				success:function(idx){
					if(idx!=''||idx!=null){
						var plusIdx = $('.advance-item').last();
						$(plusIdx).prepend(
								`<input style="display:none" id="map-ad-idx" value="${idx}"/>`
						);
					}else{
						alert('등록에 실패했습니다.');
					}
				},
				error:function(err){}
			});
			
		}
		
	});
	
	
	//사전경비-취소
	$('.cancel-advance-btn').click(function(){
		$('.add-ad-content').hide();
	});
	
	
	//사전경비-작성삭제
	$(document).on('click','.del-advance',function(){
		var parent = this.parentElement;
		parent.remove();
		
		var idx = $(parent).children().eq(0).val();
		
		$.ajax({
			url:'./schedule/delAd',
			type:'post',
			data:{'ad_idx':idx},
			success:function(res){
				if(res=='ok'){
				}else{
					alert('삭제에 실패했습니다.');
				}
			},
			error:function(err){}
		});
	});
	
	
	//일정 순서 정렬
	$(document).on('click','.sort-by-time',function(){
		//새로고침 느낌으로 할 것!
		var parent = this.parentElement;
		console.log(parent);
		
		
	});
	
	
	//일정추가버튼
	$(document).on('click','.add-schedule-btn',function(){
		var parent = this.parentElement.parentElement;
		var children = $(parent).children().eq(1);
		
		//input초기화
		$(children).find('input[type=time]').each(function(){
			$(this).val('');
		});
		$(children).find('input[type=text]').each(function(){
			$(this).val('');
		});
		$(children).find('input[type=number]').each(function(){
			$(this).val('');
		});
		
		children.show();
	});
	
	
	//일정추가-저장버튼
	addToDoList();
	
	
	//일정추가-취소버튼
	$(document).on('click','.write-cancel',function(){
		var parent = this.parentElement.parentElement;
		parent.remove();
		
	});
	
	
	//일정클릭-삭제/수정가능
	$(document).on('click','.edit-remove',function(){
		
		var parent = this.parentElement.parentElement;
		var child = $(parent).children().eq(0);
		$(child).show();
		
	});
	
	
	
	//일정클릭-수정하기
	updateSchedule();
	
	
	//일정클릭-일정삭제
	$(document).on('click','.update-cancel',function(){
		var forRemove = this.parentElement.parentElement.parentElement;
		
		$(forRemove).remove();
	});
	
	
	//메모추가클릭
	$(document).on('click','.add-memo-btn',function(){
		var parent = this.parentElement.parentElement;
		var memo = $(parent).children().eq(3);
		
		$(memo).show();
	});
	
	
	//메모 작성
	$(document).on('click','.memo-btn',function(){
		var parent = this.parentElement.parentElement;
		var memoList = $(parent).children().eq(2);
		
		var memo = $(this).siblings().val();

		if(memo==''){
			alert('메모를 적어주세요.');
		}else{
			$(memoList).append(
					`<div class="memo">
						<span class="nickname">userId</span>
						<span class="memo-des">${memo}</span>
						<i class="fa-solid fa-xmark memo-del"></i>
					</div>`
			);
		}
		
	});
	
	
	//작성메모 삭제
	$(document).on('click','.memo-del',function(){
		var memo = this.parentElement;
		$(memo).remove();
	});
	
	
	//메모닫기-저장-닫기
	$(document).on('click','.memo-close',function(){
		var memo = this.parentElement.parentElement;
		
		$(memo).hide();
	});
});


//summary내용 가져오기+저장된 내용 가져오기
function getSummary(sm_idx){
	$.ajax({
		url:'./schedule/getSummary',
		type:'get',
		data:{'sm_idx':sm_idx},
		success:function(map){
			
			//사전경비리스트
			$.each(map.adList, function(index, item){
				
				var price = item.price;
				var formatter = new Intl.NumberFormat('ko-KR');//숫자형식화(,)
				var formatted = formatter.format(price);
				
				$('.advance-list').append(
						`<div class="advance-item">
							<input style="display:none" class="map-ad-idx" value="${item.ad_idx}"/>
							<span class="advance-items">${item.item}</span>
							<span style="">:</span>
							<div class="advance-item-price">
								<i class="fa-solid fa-won-sign price-type"></i>
		 						<span>${formatted}</span>
							</div>
							<i class="fa-solid fa-circle-minus del-advance"></i>
						</div>`
				);
				
				var type = $('.price-type').last();
				
				//금액표기 변경
				if(item.price_type=='usd'){
					type.replaceWith(function() {
						  return '<i class="fa-solid fa-dollar-sign"></i>';
					});
				}
				
			});
			
			
			//summary
			$('.newList-main').prepend(
					`<div class="newList-title">${map.summary.name}</div>
					<div class="newList-date">${map.summary.start_date} ~ ${map.summary.end_date}</div>`
			);
			
			
			//등록된 친구
			$.each(map.userIdList, function(index,item){
				$('.newList-friends').append(
						`<div class="newList-friend">
							<i class="fa-solid fa-circle-minus del-friend"></i>
							<span>${item}</span>
						</div>`
				);			
			});
			
			
			//총 일 수별로 days셋팅
			var days = map.summary.days;
						
			for(var i=1;i<=days;i++){
				$('.newList-day').append(
						`<div class="day" id="day${i}">DAY${i}
							
							<i class="fa-solid fa-arrow-down-1-9 sort-by-time"></i>					
							<div class="write-schedule" id="write-schedule${i}">
								<div class="time">
									<input type="time" class="write-start-time" placeholder="시작시간"/>
									<span style="margin-right:5px">~</span>
									<input type="time" class="write-end-time" placeholder="종료시간"/>
								</div>
								<div class="location">
									<span style="font-weight:900;">장소 :</span>
									<input type="text" class="write-location" id="write-location"/>
								</div>
								<div class="money">
									<span style="font-weight:900;">금액 :</span>
									<span class="price-list">
										<select name="price-mode-day" id="price-mode-day">
												<option value="">KRW</option>
												<option value="usd">USD</option>
										</select>
									</span>
									<input type="number" class="write-money"/>
								</div>
								
								<div class="write-btn">
									<span class="write-save">저장</span>
									<span class="write-cancel">취소</span>
								</div>
							</div>
							
							
							
							
							<div class="day-btn">
								<span class="add-schedule-btn">일정추가</span>
								<span class="add-memo-btn">메모추가</span>
							</div>
							
							
							<div class="day-memo">
								<div class="memo-days-close">
									<span class="memo-days">DAY${i}</span>
									<i class="fa-solid fa-xmark memo-close"></i>
								</div>
								
								<div class="write-memo">
									<input type="text" id="memo-text" placeholder="메모를 적어주세요."/>
									<i class="fa-solid fa-pen-to-square memo-btn"></i>
								</div>
								
								
								<div class="memo-list">
									
									
								</div>
				
							</div>
														
						</div>`
				);
			} 
		},
		error:function(err){}
	});
};


//일정추가-저장버튼
function addToDoList(){
		
		$(document).on('click','.write-save',function(){
			
			var a = this.parentElement.parentElement;
			var start = $(a).children().eq(0).children().eq(0).val();
			var end = $(a).children().eq(0).children().eq(2).val();
			var location = $(a).children().eq(1).children().eq(1).val();
			
			var price = '';		
			if($(a).children().eq(2).children().eq(1).children().eq(0).val()==''){
				price = '';
			}else if($(a).children().eq(2).children().eq(1).children().eq(0).val()=='usd'){
				price = 'usd'
			}
			
			var num = $(a).children().eq(2).children().eq(2).val();
			var formatter = new Intl.NumberFormat('ko-KR');//숫자형식화(,)
			var formatted = formatter.format(num);
			
			var parent = this.parentElement.parentElement.parentElement;
			
			if(start<end){
				/*if(start=='' || end=='' || location=='' || num==''){
					alert('모든 항목에 기입해주세요.');
				}else */if(price==''){
					$(parent).append(
							`<div class="schedule-list">
								
								<div class="update-schedule">
									<div class="time">
										<input type="time" class="write-start-time" id="up-start-time" value="${start}"/>
										<span style="margin-right:5px">~</span>
										<input type="time" class="write-end-time" id="up-end-time" value="${end}"/>
									</div>
									<div class="location">
										<span style="font-weight:900;">장소 :</span>
										<input class="write-location" id="up-location" value="${location}"/>
									</div>
									<div class="money">
										<span style="font-weight:900;">금액 :</span>
										<span class="price-list">
											<select name="price-mode-day" id="price-mode-day">
													<option value="">KRW</option>
													<option value="usd">USD</option>
											</select>
										</span>
										<input type="number" class="write-money" id="up-money" value="${num}"/>
									</div>
									
									<div class="update-btn">
										<span class="update-save">수정하기</span>
										<span class="update-cancel">일정삭제</span>
									</div>
								</div> 
							
							
								<div class="add-schedule">
									<span class="start-end-time">
										<span class="start-time">${start}</span>
										<span>~</span>
										<span class="end-time">${end}</span>
									</span>
									<div class="schedule-info">
										<div class="info-location">${location}</div>
										<div class="info-money">
											<span style="margin-right:10px;">사용금액 :</span>
											<div class="money-item">
												<i class="fa-solid fa-won-sign"></i>
						 						<span>${formatted}</span>
											</div>
										</div>
									</div>
									<div class="edit-remove">
										<i class="fa-solid fa-angles-left"></i>
									</div>
								</div>
							</div>`
					);
					$('.write-schedule').hide();
				}else if(price=='usd'){
					$(parent).append(
							`<div class="schedule-list">
								
								<div class="update-schedule">
									<div class="time">
										<input type="time" class="write-start-time" id="up-start-time" value="${start}"/>
										<span style="margin-right:5px">~</span>
										<input type="time" class="write-end-time" id="up-end-time" value="${end}"/>
									</div>
									<div class="location">
										<span style="font-weight:900;">장소 :</span>
										<input class="write-location" id="up-location" value="${location}"/>
									</div>
									<div class="money">
										<span style="font-weight:900;">금액 :</span>
										<span class="price-list">
											<select name="price-mode-day" id="price-mode-day">
													<option value="">KRW</option>
													<option value="usd">USD</option>
											</select>
										</span>
										<input type="number" class="write-money" id="up-money" value="${num}"/>
									</div>
									
									<div class="update-btn">
										<span class="update-save">수정하기</span>
										<span class="update-cancel">일정삭제</span>
									</div>
								</div>
							
							
							
								<div class="add-schedule">
									<span class="start-end-time">
										<span class="start-time">${start}</span>
										<span>~</span>
										<span class="end-time">${end}</span>
									</span>
									<div class="schedule-info">
										<div class="info-location">${location}</div>
										<div class="info-money">
											<span style="margin-right:10px;">사용금액 :</span>
											<div class="money-item">
												<i class="fa-solid fa-dollar-sign"></i>
						 						<span>${formatted}</span>
											</div>
										</div>
									</div>
									<div class="edit-remove">
										<i class="fa-solid fa-angles-left"></i>
									</div>
								</div>
							</div>`
					);
					$('.write-schedule').hide();
				}
			}else{
				alert('시간을 올바르게 입력해주세요.');
			}
			
		});
		

};


//일정클릭-수정하기
function updateSchedule(){
	
	$(document).on('click','.update-save',function(){
		
		var a = this.parentElement.parentElement;
		
		var start = $(a).children().eq(0).children().eq(0).val();
		var end = $(a).children().eq(0).children().eq(2).val();
		var location = $(a).children().eq(1).children().eq(1).val();
		
		var price = '';		
		if($(a).children().eq(2).children().eq(1).children().eq(0).val()==''){
			price = '';
		}else if($(a).children().eq(2).children().eq(1).children().eq(0).val()=='usd'){
			price = 'usd'
		}
		
		var num = $(a).children().eq(2).children().eq(2).val();
		var formatter = new Intl.NumberFormat('ko-KR');//숫자형식화(,)
		var formatted = formatter.format(num);
		
		
		var parent = this.parentElement.parentElement.parentElement;
		var addParent = parent.parentElement;
		
		$(parent).remove();
		
		if(start<end){
			/*if(start=='' || end=='' || location=='' || num==''){
				alert('모든 항목에 기입해주세요.');
			}else */if(price==''){
				$(addParent).append(
						`<div class="schedule-list">
							
							<div class="update-schedule">
								<div class="time">
									<input type="time" class="write-start-time" id="up-start-time" value="${start}"/>
									<span style="margin-right:5px">~</span>
									<input type="time" class="write-end-time" id="up-end-time" value="${end}"/>
								</div>
								<div class="location">
									<span style="font-weight:900;">장소 :</span>
									<input class="write-location" id="up-location" value="${location}"/>
								</div>
								<div class="money">
									<span style="font-weight:900;">금액 :</span>
									<span class="price-list">
										<select name="price-mode-day" id="price-mode-day">
												<option value="">KRW</option>
												<option value="usd">USD</option>
										</select>
									</span>
									<input type="number" class="write-money" id="up-money" value="${num}"/>
								</div>
								
								<div class="update-btn">
									<span class="update-save">수정하기</span>
									<span class="update-cancel">일정삭제</span>
								</div>
							</div> 
						
						
							<div class="add-schedule">
								<span class="start-end-time">
									<span class="start-time">${start}</span>
									<span>~</span>
									<span class="end-time">${end}</span>
								</span>
								<div class="schedule-info">
									<div class="info-location">${location}</div>
									<div class="info-money">
										<span style="margin-right:10px;">사용금액 :</span>
										<div class="money-item">
											<i class="fa-solid fa-won-sign"></i>
					 						<span>${formatted}</span>
										</div>
									</div>
								</div>
								<div class="edit-remove">
									<i class="fa-solid fa-angles-left"></i>
								</div>
							</div>
						</div>`
				);
				$('.update-schedule').hide();
			}else if(price=='usd'){
				$(parent).append(
						`<div class="schedule-list">
							
							<div class="update-schedule">
								<div class="time">
									<input type="time" class="write-start-time" id="up-start-time" value="${start}"/>
									<span style="margin-right:5px">~</span>
									<input type="time" class="write-end-time" id="up-end-time" value="${end}"/>
								</div>
								<div class="location">
									<span style="font-weight:900;">장소 :</span>
									<input class="write-location" id="up-location" value="${location}"/>
								</div>
								<div class="money">
									<span style="font-weight:900;">금액 :</span>
									<span class="price-list">
										<select name="price-mode-day" id="price-mode-day">
												<option value="">KRW</option>
												<option value="usd">USD</option>
										</select>
									</span>
									<input type="number" class="write-money" id="up-money" value="${num}"/>
								</div>
								
								<div class="update-btn">
									<span class="update-save">수정하기</span>
									<span class="update-cancel">일정삭제</span>
								</div>
							</div>
						
						
						
							<div class="add-schedule">
								<span class="start-end-time">
									<span class="start-time">${start}</span>
									<span>~</span>
									<span class="end-time">${end}</span>
								</span>
								<div class="schedule-info">
									<div class="info-location">${location}</div>
									<div class="info-money">
										<span style="margin-right:10px;">사용금액 :</span>
										<div class="money-item">
											<i class="fa-solid fa-dollar-sign"></i>
					 						<span>${formatted}</span>
										</div>
									</div>
								</div>
								<div class="edit-remove">
									<i class="fa-solid fa-angles-left"></i>
								</div>
							</div>
						</div>`
				);
				$('.update-schedule').hide();
			}
		}else{
			alert('시간을 올바르게 입력해주세요.');
		}
		
		
		
	});
};