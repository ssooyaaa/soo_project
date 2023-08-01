$(document).ready(function(){
	
	//친구추가버튼-친구리스트 보여줌
	plusFriends();
	
	
	//친구리스트 완료버튼
	completeFriends();
	
	
	
	//친구제외
	$(document).on('click','.friend-del',function(){
		this.parentElement.remove();
	});
	
	
	//작성완료
	$('.complete-btn').click(function(){
		var name = $('.title-typing').val();
		var start_date = $('.date-start').val();
		var end_date = $('.date-end').val();
		
		
		if(name=='' || start_date=='' || end_date==''){
			alert('이름과 일정을 입력해주세요.');
		}else{
			$.ajax({
				url:'./schedule/addSummary',
				type:'post',
				data:{'name':name,
					'start_date':start_date,
					'end_date':end_date},
					success:function(res){
						if(res=='ok'){
							console.log('summary 저장');
						}else{
							console.log('실패');
						}
					},
					error:function(err){}
			});
			
			
		}
		//location.href='./newList';
	});
});


//친구추가버튼-친구리스트 보여줌
function plusFriends(){
	$('.friends-plus').click(function(){
		
		$('.all-friends').empty();
		
		$.ajax({
			url:'./follow/getFollow',
			type:'get',
			data:{},
			success:function(list){
				$.each(list, function(index,item){
					
					if(list.length==0){
						$('.all-friends').append(
							`<div class="all-friend">
								<span class="all-name">등록된 친구가 없습니다.</span>
							</div>`	
						);
					}else{
						$('.all-friends').append(
							`<div class="all-friend">
								<span class="all-name">${item.id}</span>
								<span class="all-user-idx" style="display:none;">${item.user_idx}</span>
								<input class="friend-cb" name="friend-cb" type="checkbox"/>
							</div>`
						);
					}
				});
			}
		});
		$('.all-friends-list').show();
	});
}


//친구리스트 완료버튼
function completeFriends(){
	$('.friends-sel-btn').click(function(){
		$('.all-friends-list').hide();
		
		var friendsList = [];
		var checkList = $("input[name='friend-cb']");
		
		for(var i=0;i<checkList.length;i++){
			if(checkList[i].checked){
				
				var friend = checkList[i].closest('div');
				
				var user_idx = $(friend).children().eq(1).text();
				friendsList.push(user_idx);
			}
		}
		
		$.ajax({
			url:'./schedule/getUserByIdx',
			type:'post',
			contentType: 'application/json;charset=UTF-8',
	       	data : JSON.stringify(friendsList),
	       	success:function(list){
	       		
	       		$.each(list,function(index,item){
	       			$('.friends').append(
	       				`<span class="friend">
							<span class="friend-name">${item.id}</span>
							<span style="display:none">${item.user_idx}</span>
							<i class="fa-solid fa-xmark friend-del"></i>
						</span>`
	       			);
	       		});
	       	}
		});
		
	});
}