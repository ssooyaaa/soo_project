<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<html>
<head>
	<title>Detail</title>
	<meta name="viewport" content="width=1190, user-scalable=yes">
	
	<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
	
	<script src="//ajax.googleapis.com/ajax/libs/jquery/1.8.2/jquery.min.js"></script>
	<script src="./resources/js/header.js"></script>
	<script src="./resources/js/detail.js"></script>
		
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" 
	rel="stylesheet" 
	integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" 
	crossorigin="anonymous">
	
	
	<link rel="stylesheet"  href="./resources/css/all.min.css"/>
	<link rel="stylesheet" href="./resources/css/app.css"/>
	<link rel="stylesheet" href="./resources/css/detail.css"/>
	
	
	
</head>
<body>

	
	<%@ include file="/WEB-INF/views/include/header.jsp" %>
	
	
	<div class="detail-body" id="detail-body">
	
	<!-- 해당 리스트 idx가져오기 위해 -->
	<input type="hidden" id="k-mydiary-idx" value="${mydiary_idx}"/>
	
	<!-- <div class="detail-header">
			<div class="detail-header-content">
				<i class="fa-regular fa-calendar detail-calendar"></i>
				<span class="detail-date">${mydiary.date}</span>
				<i class="fa-solid fa-cloud-sun detail-weather-icon"></i>
				<span class="detail-weather">${mydiary.weather}</span>
				<i class="fa-solid fa-location-dot detail-location-icon"></i>
				<span class="detail-location">${mydiary.nation}</span>
			</div>
			<div class="detail-edit-delete">
				<div class="detail-edit">수정하기
					<i class="fa-solid fa-pencil"></i>
				</div>
				<div class="detail-delete">삭제하기
					<i class="fa-solid fa-trash"></i>
				</div>
				
				
			</div>
			
		</div>
		
		<div class="detail-title">
			<span class="detail-title-name">TITLE</span>
			<span class="detail-title-content">${mydiary.title}</span>
		</div>
		
		
		<div class="detail-container">
			<img class="detail-main-img" src="${mydiary.main_img}"/>
			<div class="detail-body-sub">
				<div class="detail-sub-radiobox">
					<div class="radio">
						<input type="radio" id="domestic" name="nation" value="domestic" checked>
							국내
						<input type="radio" id="abroad" name="nation" value="abroad" style="margin-left:20px;">
							해외
					</div>
					<span class="more-photo" onclick="openS()">
						<i class="fa-solid fa-square-caret-down"></i>
						사진더보기
						
					</span>
					
					<div id="mySide" class="side">
						<a href="javascript:void(0)" class="close" onclick="closeS()">&times;</a>
						<div class="side-wrapper-name">
							<i class="fa-solid fa-camera"></i>
						MORE PHOTOS</div>
						<div class="side-wrapper">
							<img class="side-img" src="./resources/image/abroad/disney.jpg"/>
							<img class="side-img" src="./resources/image/abroad/disney.jpg"/>
							<img class="side-img" src="./resources/image/abroad/disney.jpg"/>
							
						</div>
					</div>
					
					<script>
						function openS(){
							document.getElementById("mySide").style.width="380px";
							document.getElementById("body").style.marginLeft="380px";
						}
						
						function closeS(){
							document.getElementById("mySide").style.width="0";
							document.getElementById("body").style.marginLeft="0";
						}
					</script>
					
				</div>	
				
				<div class="detail-sub-location">
					<span class="detail-sub-location-name">WHERE?</span>
					<span class="detail-exact-location">${mydiary.location}</span>
				</div>
				
				<div class="detail-more">
					<div class="detail-diary-name">DIARY...
					</div>
					<a class="detail-diary">${mydiary.text}
					</a>
				</div>
			</div>		
		</div>    -->	
		
		
		<div class="detail-tips">
			<div class="detail-tips-title">
				<i class="fa-solid fa-lightbulb" style="margin-right:5px; font-size:30px;"></i>
				TIPS
			</div>
			
			<div class="detail-tips-sub">
				<span class="detail-tips-subname">
					<i class="fa-solid fa-square-check"></i>
				교통</span>
				<ul class="detail-tips-content" id="detail-tips-content-trans">
					<!-- 
					<li>누가 대신 표를 끊어준다고하면, 거절할것!(돈 더내야함)</li>
					<li>미키마우스 표지 따라가면됨 </li>
					-->
				</ul>
				
			</div>
			
			<div class="detail-tips-sub">
				<span class="detail-tips-subname">
					<i class="fa-solid fa-square-check"></i>
				숙소</span>
				<ul class="detail-tips-content" id="detail-tips-content-accom">
					
				</ul>
				
			</div>
			
			<div class="detail-tips-sub">
				<span class="detail-tips-subname">
					<i class="fa-solid fa-square-check"></i>
				식당/카페</span>
				<ul class="detail-tips-content" id="detail-tips-content-eat">
					
				</ul>
				
			</div>
			
			<div class="detail-tips-sub">
				<span class="detail-tips-subname">
					<i class="fa-solid fa-square-check"></i>
				숨은 명소</span>
				<div class="detail-tips-content" id="detail-tips-sight">
			<!--		<div class="detail-sight-desc">휴대폰으로 불꽃놀이 영상 다 찍을 생각하지말것(20분가량 함)</div>
					<div class="detail-tips-map-pin" id="mappin-icon" onclick="openMapPop()">
					<i class="fa-solid fa-location-dot"></i>
					사진보기
					</div>
					<div class="popup" id="mappin-popup">
					<button type="button" onclick="closeMapPop()">
						<i class="fa-solid fa-xmark"></i>
					</button>
					<img src="./resources/image/abroad/disney.jpg"/>
					</div> -->
				</div>
				
				
				<script>
				
				function openMapPop(){
					document.getElementById("mappin-popup").style.visibility="visible";
				}
				
				function closeMapPop(){
					document.getElementById("mappin-popup").style.visibility="hidden";
				}
				</script>
				
				
			</div>
			
			<div class="detail-tips-sub" style="margin-bottom:50px;">
				<span class="detail-tips-subname">
					<i class="fa-solid fa-square-check"></i>
				기타</span>
				<ul class="detail-tips-content" id="detail-tips-content-etc">
					
				</ul>
				
			</div>
			
		</div>
	</div>
		

	

</body>
</html>
