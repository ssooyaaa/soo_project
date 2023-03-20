
/*$(document).ready(function(){
	
	$('#mydiary124124124').click(function(){
		//mydiary 확인
		$.ajax({
			url:serverUrl+'/checkMydiary',
			type:'get',
			data:{},
			success:function(res){
				if(res=='fail'){
					alert('로그인 후 사용 가능합니다.');
					location.replace(serverUrl+'/login');
				}else if(res=='ok'){
					location.href=serverUrl+"/mydiary";
				}
				
			},
			error:function(){}
		});
	});
});*/


$(document).ready(function(){
	
	$('.menu-item').on('click',function() {
		
		var page = $(this).data('menu');
		
		if(page=='home'){
			location.href='./';
		}else if(page=='mydiary'){
			location.href='./mydiary';
		}else if(page=='tips'){
			
			location.href='./tips';
		}else{
			location.href='./photo';
		};
	});
	
	$('.user-icon').on('click',function() {
		//로그인 창 이동
		location.href='./login';
		
	});
	
});

