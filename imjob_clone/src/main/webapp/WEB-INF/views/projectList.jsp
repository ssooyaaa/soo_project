<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page session="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ProjectList</title>

	<script src="//ajax.googleapis.com/ajax/libs/jquery/1.8.2/jquery.min.js"></script>
	<script src="./resources/js/projectList.js"></script>
	
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" 
	rel="stylesheet" 
	integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" 
	crossorigin="anonymous">
	
	<!-- //페이지네이션 -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/twbs-pagination/1.4.2/jquery.twbsPagination.min.js" 
	integrity="sha512-frFP3ZxLshB4CErXkPVEXnd5ingvYYtYhE5qllGdZmcOlRKNEPbufyupfdSTNmoF5ICaQNO6SenXzOZvoGkiIA==" 
	crossorigin="anonymous" referrerpolicy="no-referrer"></script>
			
	
	<link rel="stylesheet"  href="./resources/css/all.min.css"/>
	<link rel="stylesheet" href="./resources/css/app.css"/>
	<link rel="stylesheet" href="./resources/css/membership.css"/>
	<link rel="stylesheet" href="./resources/css/projectList.css"/>
	
</head>
<body>

	<%@ include file="/WEB-INF/views/include/header.jsp" %>
	
	<%@ include file="/WEB-INF/views/include/banner.jsp" %>

	<div class="projectList-container">
		<div class="membership-title" style="display:flex;align-items:center;margin-bottom:20px;">
			<span style="background:#112579;width:20px;height:20px;margin-right:10px;"></span>
			<span style="font-size:23px;font-weight:700;">프로젝트 검색</span>
		</div>
		
		
		<div class="project-search-condition">
			<div class="search-type">
				<input type="checkbox"/>
				<span>기획</span>
				<input type="checkbox"/>
				<span>디자인</span>
				<input type="checkbox"/>
				<span>퍼블리셔</span>
				<input type="checkbox"/>
				<span>개발</span>
			</div>
			<div class="keyword-box">
				<select name="keyword-mode">
					<option >선택</option>
					<option value="subject">프로젝트 제목</option>
					<option value="content">프로젝트 내용</option>
				</select>
				<input type="text"/>
				<button>검색</button>
			</div>
		</div>
		
		<div class="projects" style="margin-top:30px;display:flex;justify-content:space-between">
			<div class="row">
			
				<div class="col-6" style="display:flex;">
					<div class="recent-project">
						<div class="project-type">
							<span class="type">개발</span>
							<span class="type">JAVA/JSP</span>
						</div>
						<div class="project-name">
							[초급/백엔드/정규직/수원(광교)] AI 솔루션 개발
						</div>
						<div class="project-deadline">
							<span style="margin-right:5px;">기간</span>
							<span>2023-06-12 ~ 2024-12-31</span>
						</div>
						<div class="project-info">
							<div class="info">
								<span class="info-type">근무형태</span>
								<span class="info-more">정규</span>
								<span style="margin-right:3px;">|</span>
							</div>
							<div class="info">
								<span class="info-type">근무지</span>
								<span class="info-more">경기 수원시 영통구</span>
								<span style="margin-right:3px;">|</span>
							</div>
							<div class="info">
								<span class="info-type">단가</span>
								<span class="info-more">3,400~5,000만원</span>
							</div>
						</div>
					</div>
					
				</div>
				
				<div class="col-6">
					<div class="recent-project">
						<div class="project-type">
							<span class="type">개발</span>
							<span class="type">JAVA/JSP</span>
						</div>
						<div class="project-name">
							[초급/백엔드/정규직/수원(광교)] AI 솔루션 개발
						</div>
						<div class="project-deadline">
							<span style="margin-right:5px;">기간</span>
							<span>2023-06-12 ~ 2024-12-31</span>
						</div>
						<div class="project-info">
							<div class="info">
								<span class="info-type">근무형태</span>
								<span class="info-more">정규</span>
								<span style="margin-right:3px;">|</span>
							</div>
							<div class="info">
								<span class="info-type">근무지</span>
								<span class="info-more">경기 수원시 영통구</span>
								<span style="margin-right:3px;">|</span>
							</div>
							<div class="info">
								<span class="info-type">단가</span>
								<span class="info-more">3,400~5,000만원</span>
							</div>
						</div>
					</div>
					
				</div>
				
				<div class="col-6">
					<div class="recent-project">
						<div class="project-type">
							<span class="type">개발</span>
							<span class="type">JAVA/JSP</span>
						</div>
						<div class="project-name">
							[초급/백엔드/정규직/수원(광교)] AI 솔루션 개발
						</div>
						<div class="project-deadline">
							<span style="margin-right:5px;">기간</span>
							<span>2023-06-12 ~ 2024-12-31</span>
						</div>
						<div class="project-info">
							<div class="info">
								<span class="info-type">근무형태</span>
								<span class="info-more">정규</span>
								<span style="margin-right:3px;">|</span>
							</div>
							<div class="info">
								<span class="info-type">근무지</span>
								<span class="info-more">경기 수원시 영통구</span>
								<span style="margin-right:3px;">|</span>
							</div>
							<div class="info">
								<span class="info-type">단가</span>
								<span class="info-more">3,400~5,000만원</span>
							</div>
						</div>
					</div>
					
				</div>
				
				
			
			</div>
	
		</div>
		
		
		
		
	</div>
	
	<ul id="pagination-demo" class="pagination-sm"></ul>
	
	<%@ include file="/WEB-INF/views/include/footer.jsp" %>
	

</body>
</html>