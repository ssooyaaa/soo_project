$(document).ready(function(){
	
	//홈으로 이동
	$('.go-home').click(function(){
		location.href='./';
	});
	
	
	//친구리스트-승인O
	getFollow();
	
	//친구요청-수락
	acceptMember();
	
	//친구요청-거절
	rejectMember();
	
});

//친구리스트-승인O
function getFollow(){
	
	$.ajax({
		url:'./follow/getFollow',
		type:'get',
		data:{},
		success:function(list){
			
			if(list.length==0){
				$('.member-list').append(
					`<div class="member-item">
						<span style="text-align:center;margin-left:20px;">아직 등록된 친구가 없습니다.</span>
					</div>`
				);
			}else{
				$.each(list,function(index,item){
					
					$('.member-list').append(
						`<div class="member-item">
							<span>${item.nickname}</span>
							<button class="del-member">삭제</button>
						</div>`
					);
					
				});
			}
			
			
		}
	});
}


//친구요청-수락
function acceptMember(){
	
	$(document).on('click','#accept-member',function(){
		
		var parent = $(this).parent();
		var children = parent.children();
		
		var id = children.eq(0).text();
		
		console.log(id);
		
		alert('수락');
		
		this.parentElement.remove();
	});
	
}

//친구요청-거절
function rejectMember(){
	
$(document).on('click','#reject-member',function(){
		
		var parent = $(this).parent();
		var children = parent.children();
		
		var id = children.eq(0).text();
		
		console.log(id);
		
		alert('거절');
		
		this.parentElement.remove();
	});
	
}