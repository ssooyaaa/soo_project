$(document).ready(function(){
	
	var sm_idx = $('#map-sm-idx').val();
	
	//영수증 보이기
	getReceipt(sm_idx);
	
	
	//환율 저장 창보이기
	$('.add-rate-btn').click(function(){
		$('.add-r-content').show();
		
		$('.rate-add-price').val('');
	});
	
	
	//환율 저장
	$(document).on('click','.save-rate-btn',function(){
		var selectOption = $('#price-mode option:selected').val();
		
		var price = $('.rate-add-price').val();
		var formatter = new Intl.NumberFormat('ko-KR');//숫자형식화(,)
		var formatted = formatter.format(price);
		
		
		if(price==null || price==''){
			
			alert('금액을 입력해주세요.');
			
		}else{
			$('.rate-list').append(
					`<div class="rate-items">
						<i class="fa-solid fa-circle-minus del-rate-btn"></i>
						<span class="rate-type">${selectOption}</span>
						<div class="change-won">
							<i class="fa-solid fa-won-sign"></i>
	 						<span>${formatted}</span>
						</div>
					</div>`
			);
			
			$('.add-r-content').hide();
			
		}
		
	});
	
	//환율 취소
	$(document).on('click','.cancel-rate-btn',function(){
		$('.add-r-content').hide();
	});
	
	
	//환율 저장-삭제
	$(document).on('click','.del-rate-btn',function(){
		var parent = this.parentElement;
		$(parent).remove();
	});
	
});


//영수증 보이기
function getReceipt(sm_idx){
	console.log('all')
}