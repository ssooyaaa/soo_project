$(document).ready(function(){
	
	//홈으로 이동
	$('.go-home').click(function(){
		location.href='./';
	});
	
	
	//친구요청-수락
	acceptMember();
	
	//친구요청-거절
	rejectMember();
	
});

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