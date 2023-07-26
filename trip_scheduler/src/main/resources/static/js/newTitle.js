$(document).ready(function(){
	
	//친구추가버튼-친구리스트 보여줌
	plusFriends();
	
	
	//친구리스트 완료버튼
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
		
		
		
	});
	
	
	//친구제외
	$('.friend-del').click(function(){
		this.parentElement.remove();
	});
	
	
	//작성완료
	$('.complete-btn').click(function(){
		var title = $('.title-typing').val();
		var start = $('.date-start').val();
		var end = $('.date-end').val();
		console.log(title);
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