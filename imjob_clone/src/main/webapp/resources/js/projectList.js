$(document).ready(function(){
	
	//전체 프로젝트 리스트
	projectList();
	
});


//전체 프로젝트 리스트
function projectList(){
	var totalPages=0;
	var countInOnePage=8;
	
	$.ajax({
		url:'./project/getCount',
		type:'get',
		data:{},
		async:false,
		success:function(count){
			totalPages=Math.ceil(count/countInOnePage);
		},
		error:function(err){}
	});
	
	
	$('#pagination-project').twbsPagination({
		totalPages:totalPages,
		visiblePages:10,
		first:'<<',
		prev:'<',
		next:'>',
		last:'>>',
		onPageClick:function(event, page){
			
			$.ajax({
				url:'./project/getProjectAll',
				type:'get',
				data:{
					start:(page-1)*countInOnePage,
					cnt:countInOnePage
				},
				success:function(list){
					console.log(list);
					
					$('#projectList').empty();
					
					$.each(list, function(index,item){
						
						$('#projectList').append(
							`<div class="col-6" style="display:flex;">
								<div class="recent-project">
									<div class="project-type">
										<span class="type">${item.field}</span>
										<span class="type">${item.detail_field}</span>
									</div>
									<div class="project-name">
										${item.title}
									</div>
									<div class="project-deadline">
										<span style="margin-right:5px;">기간</span>
										<span>${item.duration}</span>
									</div>
									<div class="project-info">
										<div class="info">
											<span class="info-type">근무형태</span>
											<span class="info-more">${item.type}</span>
											<span style="margin-right:3px;">|</span>
										</div>
										<div class="info">
											<span class="info-type">근무지</span>
											<span class="info-more">${item.location}</span>
											<span style="margin-right:3px;">|</span>
										</div>
										<div class="info">
											<span class="info-type">단가</span>
											<span class="info-more">${item.price}</span>
										</div>
									</div>
								</div>
								
							</div>`
						);
					});
				}
			})
		}
	});
}