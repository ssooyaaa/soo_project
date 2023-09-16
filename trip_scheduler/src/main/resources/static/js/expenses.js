$(document).ready(function(){
	
	var loginUserIdx = $('#map-user-idx').val();
	
	//모든 리스트 가져오기
	getAllExpense('');
	
	
	//옵션 선택 리스트 가져오기
	$('.search-icon').click(function(){
		
		var selectOption = $('#date-mode option:selected').val();
		
		$('#pagination-demo').twbsPagination('destroy');
		$('.expenseAllList').empty();
		
		getAllExpense(selectOption);
	});
	
	
	
	
	//일정클릭-영수증보기
	$(document).on('click','.expenses-item',function(){
		var smIdx = $(this).children().eq(2).val();
		
		location.href='./receipt?sm_idx='+smIdx;
	});
	/*$('.expenses-item').click(function(){
		location.href='./receipt';
	});*/
	
	
	//새일정짜기
	$('.move-newTitle').click(function(){
		location.href='./newTitle';
	});
	
	
	//여행경비
	$('.move-allList').click(function(){
		location.href='./allList?user_idx='+loginUserIdx;
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
function getAllExpense(selectOption){
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
				url:'./expense/getAllExpense',
				type:'get',
				data:{},
				success:function(list){
					
					$('.expenseAllList').empty();
					
				
					if(selectOption==''){
						list = sortResults(list, "start_date");
					}else if(selectOption=='old'){
						list = sortResults(list, "start_date","asc");
					}
					
					var start = (page-1)*countInOnePage;
					
					var pageResult = $(list).slice(start, start+countInOnePage);
					
					//오늘 날짜 구하기
					var today = getToday();
					
					
					$.each(list, function(index,item){
						var smIdx = item.sm_idx;
						var end_date = item.end_date;
						
						$('.expenseAllList').append(
								`<div class="expenses-item">
									<div class="expenses-title">
										<span class="item-title" style="width:90%;">${item.name}</span>
										
									</div>
									<div class="expenses-date">
										<span style="font-family:home-name;width:13%;">DATE</span>
										<span>${item.start_date} ~ ${item.end_date}</span>
									</div>
									<input style="display:none" id="smIdx${item.sm_idx}" value=${item.sm_idx} />
											
									<div class="total-expenses">
										<div>총 경비</div>
										<div class="nation-price">
											<i class="fa-solid fa-won-sign"></i>
											<span>10,000</span>
										</div>
									</div>
								</div>`
						);
						
						var statusElement = $('#'+'smIdx'+smIdx).siblings('.expenses-title');
						
						
						if(end_date>=today){
							$(statusElement).append(
									`<span class="item-status">진행중</span>`
							);
						}else{
							$(statusElement).append(
									`<span style="background:#E74C3C" class="item-status">종료</span>`
							);
						}
						
						
					});
				},
				error:function(err){}
			});
			
		}
	})
		
}


//오늘날짜구하기
function getToday(){     
	var now = new Date();     
	var year = now.getFullYear();     
	var month = now.getMonth() + 1;
	var date = now.getDate();     
	month = month >=10 ? month : "0" + month;  
	date = date >= 10 ? date : "0" + date;

	return ""+year+"-"+month+"-"+date; 
}