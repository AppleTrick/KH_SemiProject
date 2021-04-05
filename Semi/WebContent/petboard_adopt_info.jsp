<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 부트스트랩 -->
    <!-- CSS only -->
    <link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css"
      rel="stylesheet"
      integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl"
      crossorigin="anonymous"
    />

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.0/font/bootstrap-icons.css">

    <link rel="stylesheet" href="resources/css/header.css">
    
<title>Adopt Info</title>
<!-- 펫보드 - 셀렉트 원 - 상세게시물에서 - 입양신청하기 누르면나오는 화면  -->
</head>
<body>
	<%@ include file="Form/header.jsp"%>
	<div class="mt-4">
		<div class="container d-flex justify-content-center">
			<!-- 가로 폭 조절 -->
			<div class=adopt_info>
				<div class="col-99">
					<div class="card">
						<!-- 카드 시작 -->
						<div class="info_image">
							<img src="resources/img/adopt_info.png"
								data-original="adopt_info.png" />
						</div>
							<div class="checklist_image" style="text-align: center;"><!-- checklist 이동하는 부분 -->
								<input type="image" src="resources/img/checklist.png" onclick="location.href='checklist.do?command=checklistform'" >
							</div>
						<div class="mb-4"></div>
					</div>
					<!-- 카드 끝 -->
				</div>
			</div>
		</div>
	</div>
	<div class="mb-4"></div>
</body>
</html>