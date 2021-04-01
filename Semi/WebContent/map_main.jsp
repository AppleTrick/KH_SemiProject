<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>지도페이지</title>
<link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css"
      rel="stylesheet"
      integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl"
      crossorigin="anonymous"
    />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.0/font/bootstrap-icons.css">
    <link rel="stylesheet" href="resources/css/header.css">
</head>
<body>
	<!-- 헤더부분 추가 -->
	<%@ include file="Form/header.jsp"%>
	<!-- 바디부분 시작 -->
	<div class="mt-4">
		<div class="container d-flex justify-content-center">
			<div class="col-9">
				<div class="mb-4">
					<div id="map" style="width: 100%; height: 50vh">
					</div>
				</div>
				<p>
					<button class="btn btn-primary" onclick="showMarkers()">병원 보이기</button>
					<button class="btn btn-primary" onclick="showMarkers1()">보호소 보이기</button>
					<button class="btn btn-primary" onclick="hideMarkers()">병원 마커 감추기</button>
					<button class="btn btn-primary" onclick="hideMarkers1()">보호소 마커 감추기</button>
					
				</p>
				<script type="text/javascript" src="https://dapi.kakao.com/v2/maps/sdk.js?appkey=dc1a9444cf387fa306e61aaf8a1eb0b9"></script>
				<script src="resources/js/map.js"></script>
			</div>
		</div>
	</div>


</body>
</html>