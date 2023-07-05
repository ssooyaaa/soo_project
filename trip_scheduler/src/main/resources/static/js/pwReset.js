$(document).ready(function(){
	
	//확인버튼
	resetCheckPw();
	
	//비밀번호 변경 버튼
	$('.pwResetNewBtn').click(function(){
		location.replace('./login');
	});
	
	
});


//확인버튼
function resetCheckPw(){
	
	var inputId = '';
	var inputEmail = '';
	
	$('#pwReset-id').focusout(function(){
		
		var id = $('#pwReset-id').val();
		
		if(id.length==0){
			$('#none-id').show();
		}else{
			$('#none-id').hide();
			inputId = id;
		}
	});
	
	$('#pwReset-email').focusout(function(){
		
		var email = $('#pwReset-email').val();
		
		if(email.length==0){
			$('#not-correct-email').hide();
			$('#none-email').show();
		}else if(email.match(/^[-!#$%& amp;'*+./0-9=?A-Z^_a-z{|}~]+@[-!#$%&'*+/0-9=?A-Z^_a-z{|}~]+.[-!#$%& amp;'*+./0-9=?A-Z^_a-z{|}~]+$/)){
			$('#not-correct-email').hide();
			$('#none-email').hide();
			
			inputEmail = email;
			
		}else{
			$('#none-email').hide();
			$('#not-correct-email').show();
		}
		
	});
	
	
	$('.pwResetBtn').click(function(){
		console.log(inputId);
		console.log(inputEmail);
		
		if(inputId=='' || inputEmail==''){
			alert('아이디와 이메일을 올바르게 적어주세요.');
		}else{
			location.href='./pwResetNew';
		}
		
	});
	
}