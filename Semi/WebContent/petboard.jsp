<%@page import="com.dto.PetDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/css/petboard.css" />
<script src="resources/js/petboard.js"></script>  
</head>
<body>
	

	<%@ include file="Form/header.jsp"%>
	

	<!-- 바디부분 시작 -->
	<div class="mt-4">
		<div class="container d-flex justify-content-center">
			<div class="col-9">
				<!-- 선택한 값만 모여주게 할 수 있는 라디오 버튼 -->
				<input type="radio" name="Gallery" id="check1" checked /> 
				<input type="radio" name="Gallery" id="check2" /> 
				<input type="radio"	name="Gallery" id="check3" />
				
				
				<!-- 최상위 박스-->
				<div class="contentBox">
					<!-- 선택하는 곳 -->
					<div class="top-content">
						<label for="check1">전체보기</label> 
						<label for="check2">입양대기</label> 
						<label for="check3">입양후기</label>
						<input type="button" class="btn" value="글작성" onclick="location.href='pet.do?command=insertform'"/>
					</div>
					
					
					<!-- 글게시물  -->
					<div class="photo-gallery">
					
						
						<!--  아래 같은 형식으로 계속 출력 시킬것!-->

						<div class="pic wait">
							<img src="resources/TestImage/dog1.jpg" data-original="dog1.jpg"/>
						</div>
						<div class="pic wait">
							<img src="resources/TestImage/dog2.jpg" data-original="dog2.jpg"/>
						</div>
						<div class="pic wait">
							<img src="resources/TestImage/dog3.jpg" data-original="dog3.jpg"/>
						</div>
						<div class="pic after">
							<img src="resources/TestImage/dog4.jpg" data-original="dog4.jpg"/>
						</div>
						<div class="pic after">
							<img src="resources/TestImage/cat1.jpg" data-original="cat1.jpg"/>
						</div>
						<div class="pic after">
							<img src="resources/TestImage/cat2.jpg" data-original="cat2.jpg"/>
						</div>
						<div class="pic after">
							<img src="resources/TestImage/cat3.jpg" data-original="cat3.jpg"/>
						</div>
						<div class="pic wait">
							<img src="resources/TestImage/dog1.jpg" data-original="dog1.jpg"/>
						</div>
						<div class="pic wait">
							<img src="resources/TestImage/dog2.jpg" data-original="dog2.jpg"/>
						</div>
						<div class="pic after">
							<img src="resources/TestImage/dog4.jpg" data-original="dog4.jpg"/>
						</div>
						<div class="pic after">
							<img src="resources/TestImage/cat1.jpg" data-original="cat1.jpg"/>
						</div>
						<div class="pic after">
							<img src="resources/TestImage/cat2.jpg" data-original="cat2.jpg"/>
						</div>
						<div class="pic after">
							<img src="resources/TestImage/cat3.jpg" data-original="cat3.jpg"/>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="modal1">
		<img src="resources/TestImage/cat3.jpg" alt="" class="full-img">
	</div>	 
</body>
</html>