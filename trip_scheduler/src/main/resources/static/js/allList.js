$(document).ready(function(){
	
	//모든리스트 가져오기
	$.ajax({
		url:'./allList/getAllList',
		type:'get',
		data:{},
		success:function(map){
			console.log(map.allList);
			console.log(map.userIdMap);
			
			var values = $(map.userIdMap);                          
			
			
			$.each(map.allList, function(index,item){
				
				var smIdx = item.sm_idx;
				console.log(smIdx);
				
				var myArray = $.map(values, function(element) {
				    element=smIdx;   
					return element.value;
				});
				console.log(myArray);
				
				
				$('.allList').append(
						`<div class="allList-item">
							<div class="allList-title">${item.name}</div>
							<div class="allList-date">
								<span style="font-family:home-name;width:13%;">DATE</span>
								<span> ${item.start_date}-${item.end_date}</span>
							</div>
							<input id="sm_idx_value" value=${item.sm_idx} />
							<div class="allList-friends">
								<div style="font-family:home-name;width:20%;">WITH</div>
								<div class="friends">
									<span>최쑤 /</span>
									<span>sooyaa /</span>
									<span>chiossoo /</span>
									<span>최쑤 /</span>
									<span>sooyaa /</span>
									<span>chiossoo /</span>
									<span>최쑤 /</span>
									<span>sooyaa /</span>
									<span>chiossoo /</span>
								</div>
							</div>
						</div>`
				);
				
			});
		},
		error:function(err){}
	})
	
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