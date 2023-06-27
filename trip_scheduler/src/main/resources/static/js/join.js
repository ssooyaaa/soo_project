$(document).ready(function(){

	//다음버튼
	$('.join-next').click(function(){
		
		var must1 = $('#must1').is(':checked');
		var must2 = $('#must2').is(':checked');
		
		if(must1==true && must2==true){
			$('.join-container').hide();
			$('.next-join-container').show();
		}else{
			alert('이용약관을 확인해주세요.');
		}
		
	});
	
	
	//홈화면이동
	$('.home-name-next').click(function(){
		location.replace('./');
	});
	
	//가입하기 버튼
	joinMember();
	
});


//필수확인-다음버튼 색상 변경
function nextColor(){
	var must1 = $('#must1').is(':checked');
	var must2 = $('#must2').is(':checked');
	
	if(must1==true && must2==true){
		$('.join-next').css('background','var(--color-main)');
	}
}

//전체동의/해체
function allCheck(){
	var allCheck = $('#allCheck').is(':checked');
	
	if(allCheck==true){
		$('input:checkbox[name=join-check]').prop('checked',true);
		nextColor();
	}else{
		$('input:checkbox[name=join-check]').prop('checked',false);
		$('.join-next').css('background','#E0DDDD');
	}
}


//가입하기버튼
function joinMember(){
	
	var id = $('#join-id').val();
	
	//아이디체크
	if(id.length==1){
		$('#none-id').show();
	}
	
}
