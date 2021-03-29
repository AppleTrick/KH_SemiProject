<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/css/petboard.css" />
</head>
<body>

	<%@ include file="Form/header.jsp"%>
	<!-- 바디부분 시작 -->
	<div class="mt-4">
		<div class="container d-flex justify-content-center">
			<div class="col-9">

				<input type="radio" name="Gallery" id="check1" checked /> 
				<input type="radio" name="Gallery" id="check2" /> 
				<input type="radio"	name="Gallery" id="check3" />

				<div class="container">
					<div class="top-content">
						<label for="check1">전체보기</label> 
						<label for="check2">입양대기</label> 
						<label for="check3">입양후기</label>
					</div>
		
					<div class="photo-gallery">
					
						<!-- 글게시물  -->
						<!--  아래 같은 형식으로 계속 출력 시킬것!
						<div class="pic wait">
							<img src="resources/TestImage/img01.jpg" />
						</div>
						-->
						<div class="pic wait">
							<img src="resources/TestImage/img01.jpg" />
						</div>
						<div class="pic wait">
							<img src="resources/TestImage/img02.jpg" />
						</div>
						<div class="pic wait">
							<img src="resources/TestImage/img03.jpg" />
						</div>
						<div class="pic after">
							<img src="resources/TestImage/img04.jpg" />
						</div>
						<div class="pic after">
							<img src="resources/TestImage/img05.jpg" />
						</div>
						<div class="pic after">
							<img src="resources/TestImage/img06.jpg" />
						</div>
					</div>
				</div>


			</div>
		</div>
	</div>


   
</body>
</html>