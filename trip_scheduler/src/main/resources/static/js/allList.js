$(document).ready(function(){
	
	var loginUserIdx = $('#map-user-idx').val();
	var selectOption = $('#date-mode option:selected').val();
	
	//모든 리스트 가져오기
	getAllList(selectOption);
	
	
	//옵션 선택 리스트 가져오기
	$('.search-icon').click(function(){
		var selectOption = $('#date-mode option:selected').val();
		
		$('.allList').empty();
		
		getAllList(selectOption);
	});
	
	
	
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


//정렬하기
function sortResults(result, prop, asc) {
    SortedResult = result.sort(function(a, b) {
    	if (asc) { 
    		return (a[prop] > b[prop]) ? 1 : ((a[prop] < b[prop]) ? -1 : 0);
    	} else {
    		return (b[prop] > a[prop]) ? 1 : ((b[prop] < a[prop]) ? -1 : 0);
    	}
    });
    return SortedResult;
}



//모든리스트 가져오기
function getAllList(selectOption){
	
	var totalPages=0;
	var countInOnePage=5;
	
	$.ajax({
		url:'./allList/getCountAllList',
		type:'get',
		data:{},
		async:false,
		success:function(count){
			totalPages=Math.ceil(count/countInOnePage);
		},
		error:function(err){}
	})
	
	
	$('#pagination-demo').twbsPagination({
		totalPages:totalPages,
		visiblePages:3,
		first:'<<',
		prev:'<',
		next:'>',
		last:'>>',
		onPageClick:function(event, page){
			
			$.ajax({
				url:'./allList/getAllList',
				type:'get',
				data:{},
				success:function(map){
					
					$('.allList').empty();
					
					var userMap = map.userIdMap;
					
					var result = map.allList;
					
					if(selectOption==''){
						result = sortResults(result, "start_date");
					}else if(selectOption=='old'){
						result = sortResults(result, "start_date","asc");
					}
					
					var start = (page-1)*countInOnePage;
					
					var pageResult = $(result).slice(start, start+countInOnePage);
					console.log(pageResult);
					
					$.each(pageResult, function(index,item){
						var smIdx = item.sm_idx;
				
						$('.allList').append(
								`<div class="allList-item">
									<div class="allList-title">${item.name}</div>
									<div class="allList-date">
										<span style="font-family:home-name;width:13%;">DATE</span>
										<span>${item.start_date} ~ ${item.end_date}</span>
									</div>
									<input id="smIdx${item.sm_idx}" value=${item.sm_idx} />
									<div class="allList-friends">
										<div style="font-family:home-name;width:13%;">WITH</div>
										<div class="friends">
											
											
										</div>
									</div>
								</div>`
						);
						
						$.each(userMap, function (key, val) {
							if(key==smIdx){
								var smIdxElement = $('#'+'smIdx'+key).siblings('.allList-friends');
								var child = $(smIdxElement).children().eq(1);
								
								$.each(val, function(index,item){
									$(child).append(
											`<span style="margin-right:15px">${item}</span>`
									);
								});
								
							}
						});
						
						
					});
				},
				error:function(err){}
			})
			
			
		}
	});
	
	
}