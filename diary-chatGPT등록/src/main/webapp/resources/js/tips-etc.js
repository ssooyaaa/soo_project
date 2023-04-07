$(document).ready(function(){
	
	//전체 리스트
	etcList();
	
	//검색 리스트
	schEtc();
	
	//신고하기
	addReport();
	
	//댓글창
	Comment();
	
	//댓글등록
	addComment();
	
	//댓글삭제
	delComment();
	
});


//전체 리스트
function etcList(){

	var totalPages=0;
	var countInOnePage=7;
	
	$.ajax({
		url:'./tips/getEtcCount',
		type:'get',
		data:{},
		async:false,
		success:function(count){
			totalPages=Math.ceil(count/countInOnePage);
		},
		error:function(err){}
	});
	
	$('#pagination-etc').twbsPagination({
		totalPages:totalPages,
		visiblePages:5,
		first:'처음',
		prev:'<<',
		next:'>>',
		last:'마지막',
		onPageClick:function(event,page){
			
			$.ajax({
				url:'./tips/getEtcAll',
				type:'get',
				data:{
					start:(page-1)*countInOnePage,
					cnt:countInOnePage
				},
				success:function(list){
					console.log(list);
					
					$('#tips-content-more').empty();
					
					$.each(list,function(index,item){
						$('#tips-content-more').append(
								`<ul class="tips-contents">
									<li class="tips-nation">[${item.nation}]</li>
									<span class="tips-contents-more">${item.tips_etc}</span>
								  	<span class="tips-comment"><i class="fa-regular fa-comment-dots"> 댓글</i></span>
									<span style="display:none" class="tips-user-idx">${item.user_idx}</span>
								  	<span class="tips-btn">신고</span>
								  	<span style="display:none;">${item.etc_idx}</span>
								 </ul>`
						)
					});
				},
				error:function(err){}
			});
		}
	});
	
}


//검색리스트
function schEtc(){
	$('#search-glass').on('click',function(){
		$('#pagination-etc').twbsPagination('destroy');
		$('#tips-content-more').empty();
				
		var nation = $('#search').val();
		var countInOnePage=7;
		var totalPages=0;
		
		$.ajax({
			url:'./tips/getEtcCountAfterSch',
			type:'get',
			data:{nation:nation},
			async:false,//비동기 여부
			success:function(count){
				totalPages=Math.ceil(count/countInOnePage);
			},
			error:function(err){}
		});
		
		$('#pagination-etc').twbsPagination({
			totalPages:totalPages,
			visiblePages:5,
			first:'처음',
			prev:'<<',
			next:'>>',
			last:'마지막',
			onPageClick: function(event, page){
				
				$.ajax({
					url:'./tips/getEtcChunkAfterSch',
					type:'get',
					data:{
						nation:nation,
						start:(page-1)*countInOnePage,
						cnt:countInOnePage
					},
					success:function(list){
						console.log(list);	
						
						$('#tips-content-more').empty();
						
						$.each(list,function(index,item){
							
							$('#tips-content-more').append(
									`<ul class="tips-contents">
										<li class="tips-nation">[${item.nation}]</li>
										<span class="tips-contents-more">${item.tips_etc}</span>
									  	<span class="tips-comment"><i class="fa-regular fa-comment-dots"> 댓글</i></span>
										<span style="display:none" class="tips-user-idx">${item.user_idx}</span>
									  	<span class="tips-btn">신고</span>
									  	<span style="display:none;">${item.etc_idx}</span>
									  </ul>`
							)
						});
					},
					error:function(err){}
				});
			}
		});
	});
}


//신고하기
function addReport(){
$(document).on('click','.tips-btn',function(){
		
		var report_desc = prompt("변경/신고 사유를 적어주세요.");
		
		var parent = $(this).parent();
		var children = parent.children();
		
		var user_idx = children.eq(3).text();
		var tips_transport = '';
		var tips_accomodation = '';
		var tips_etc = '';
		var tips_etc = children.eq(1).text();
		

		if(report_desc==null||report_desc==undefined){
			
			alert('접수 취소되었습니다.');
			location.href='./tips-etc';
			
		}else{
			
			$.ajax({
				url:'./report/addReport',
				type:'post',
				data:{
					user_idx:user_idx,
					report_desc:report_desc,
					tips_transport:tips_transport,
					tips_accomodation:tips_accomodation,
					tips_etc:tips_etc,
					tips_etc:tips_etc
				},
				success:function(res){
					if(res="ok"){
						alert('접수되었습니다.')
						location.href='./tips-etc'
					}else{
						location.href="./tips-etc"
					}
				},
				error:function(err){}
			});
			
		}
		
		
	});
	

}


//댓글창
function Comment(){
	$(document).on('click','.tips-comment',function(){
			
			var parent = $(this).parent();
			
			var children = parent.children();
			var etc_idx = children.eq(5).text();
			
			$('#tips-content-more').empty();
			$('#pagination-etc').empty();
			
			$.ajax({
				url:'./tips/getEtcForCom',
				type:'get',
				async:false,
				data:{etc_idx:etc_idx},
				success:function(etc){
					$('#tips-content-more').append(
							`<ul class="tips-contents">
								<li class="tips-nation">[${etc.nation}]</li>
								<span class="tips-contents-more">${etc.tips_etc}</span>
								<span class="tips-comment-back"><i class="fa-solid fa-rotate-left">돌아가기</i></span>
							  </ul>
							  <div class="tips-comments">
							  	<div class="comment-write">
							  		<span style="display:none;">${etc.etc_idx}</span>
							  		<i class="fa-regular fa-comment"></i>
						  			<input type="text" class="comment" placeholder=" 댓글 입력해주세요"/>
						  			<i class="fa-solid fa-paper-plane upload-comment"></i>
							  	</div>
							  </div>`
					)
				},
				error:function(err){}
			});
			
			var nickname = $('#login-nickname').val();
			
			$.ajax({
				url:'./tips/getEtcCom',
				type:'get',
				data:{etc_idx:etc_idx},
				success:function(list){
					
					$.each(list,function(index,item){
						
						if(item.nickname==nickname){
							$('.tips-comments').append(
									`<div class="comments">
											<span class="comment-idx" style="display:none">${item.etc_comment_idx}</span>
									  		<span class="comments-user">${item.nickname}</span>
									  		<span class="comments-desc">${item.etc_comment}</span>
									  		<span class="comments-btn">삭제</span>
									  	</div>`
								)
						}else{
							$('.tips-comments').append(
									`<div class="comments">
									  		<span class="comments-user">${item.nickname}</span>
									  		<span class="comments-desc">${item.etc_comment}</span>
									  	</div>`
								)
						}
						
						
						
					});
					
				},
				error:function(err){}
			});
			
			$(document).on('click','.tips-comment-back',function(){
				location.href="./tips-etc";
			});
			
		})
		
}


//댓글등록
function addComment(){
	$(document).on('click','.upload-comment',function(){
			
			var parent = $(this).parent();
			var children = parent.children();
			var etc_idx = children.eq(0).text();
	
			var etc_comment = $('.comment').val();
			
			$.ajax({
				url:'./tips/addEtcCom',
				type:'post',
				data:{
					etc_idx:etc_idx,
					etc_comment:etc_comment
				},
				success:function(res){
					if(res=="ok"){
						alert('댓글이 등록되었습니다.');
						location.replace('./tips-etc');
					}else{
						alert('댓글 등록에 실패했습니다.');
					}
				},
				error:function(err){}
			});
		})
}


//댓글삭제
function delComment(){
	$(document).on('click','.comments-btn',function(){
		
		var parent = $(this).parent();
		var etc_comment_idx = parent.children().eq(0).text();
		
		$.ajax({
			url:'./tips/delEtcCom',
			type:'post',
			data:{
				etc_comment_idx:etc_comment_idx
			},
			success:function(res){
				if(res=='ok'){
					alert('삭제되었습니다.');
					location.replace('./tips-etc');
				}else{
					alert('삭제 실패했습니다.');
				}
			},
			error:function(err){}
		});
		
	});
}