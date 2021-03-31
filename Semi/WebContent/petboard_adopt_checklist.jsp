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
<title>Checklist</title>
</head>
<body>
		<%@ include file="Form/header.jsp"%>
	<div class="mt-4">
		<div class="container d-flex justify-content-center">
			<div class="col-9">
				<div class="card">
    	<h2 style="margin-bottom: 20px; margin-top: 20px; text-align: center">입양 신청 전 CHECK LIST!!</h2>
    				<div class="check_start" style="margin-left: 100px;"><!-- 체크 항목 시작 -->
  					<p>*결혼 여부 </p>
  					<p>
  						<input type="radio" name="marriage" />&nbsp;기혼&nbsp;&nbsp;
   						<input type="radio" name="marriage"/>&nbsp;미혼</p>
   					<p>*반려동물 유무</p>
   					<p>
  						<input type="radio" name="pet" />&nbsp;Y&nbsp;&nbsp;
   						<input type="radio" name="pet"/>&nbsp;N</p>
   					<p>*일 평균 부재 시간 </p>
   					<p>
   						<input type="radio" name="go_out" />&nbsp;10시간 미만 &nbsp;&nbsp;
   						<input type="radio" name="go_out"/>&nbsp;10시간 ~ 12시간&nbsp;&nbsp;
   						<input type="radio" name="go_out"/>&nbsp;12시간 ~ 15 시간&nbsp;&nbsp;
   						<input type="radio" name="go_out"/>&nbsp;15 시간 이상</p>
   					</div><!-- 체크 항목 끝 -->
   					
   					
    			</div>
    			<input type="button" value="제출하기">
    		</div>
    	</div>
    </div>

</body>
</html>