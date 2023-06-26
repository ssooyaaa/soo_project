$(document).ready(function(){

	
	
	
});


//필수확인-다음버튼 색상 변경
function nextColor(){
	var must1 = $('#must1').is(':checked');
	var must2 = $('#must2').is(':checked');
	
	if(must1==true && must2==true){
		$('.join-next').css('background','var(--color-main)');
	}
}

//전체동의
function allCheck(){
	var allCheck = $('#allCheck').is(':checked');
	
	if(allCheck==true){
		$('input:checkbox[name=join-check]').prop('checked',true);
		nextColor();
	}
}
