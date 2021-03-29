<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Notice Board Insert</title>
<link rel="stylesheet" href="resources/bootstrap/css/bootstrap.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
  
  <style>
  .btn{
  background-color: #ff9999}
  .btn:hover, .btn:focus{
  background-color: hotpink}
.btn:focus, .btn:active, .btn:hover, input:active, input:focus{
    box-shadow: none!important;
    outline: none!important;
}
  </style>
  
  	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.0/font/bootstrap-icons.css">
    <link rel="stylesheet" href="resources/css/header.css">  
    
        <link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css"
      rel="stylesheet"
      integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl"
      crossorigin="anonymous"
    />

    <title>Notice Board Insert</title>
</head>
<body>
	<%@ include file="Form/header.jsp" %>

 <form action="board.do" method="post">
 <input type="hidden" name="command" value="insertres"/>
  <div class="content-wrapper">

    <!-- Main content -->
    	<div class="container justify-content-center"> <!-- 가로 폭 조절 -->
    	<div class="card"> <!-- 카드 시작 -->
    		<div class="card-body">
                <div class="noticeboard">
				      <table class="table" id="sub_text">
						<colgroup>			
						<col style="width:100px" />
						<col style="width:*" />						
						</colgroup>
						<h5 style="margin-bottom: 20px; text-align: center">공지 작성</h5>
						<tr>						
							<th class="text-center">제목</th>
							<td><input type="text" class="form-control" id="title" name="title" placeholder="제목을 입력해 주세요." value=""></td>
						</tr>
						<tr>
							<th class="text-center">내용</th>
							<td>
								<textarea id="summernote" name="content"></textarea>
							</td>
						</tr>
					</table>			      
			    </div>
			    <div style="text-align: right; margin-right: 10px;">
			    	<input type="submit" class="btn" value="저장하기">
					<input type="button" class="btn" onclick="location.href='noticeboard.jsp'" value="목록으로">
				</div>
				</div><!-- card-body-->
              </div> <!-- card -->
              </div> <!-- container -->
</div><!-- main content -->
<br/>
<br/>

  
   <!-- include libraries(jQuery, bootstrap) -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="resouces/bootstrap/js/bootstrap.js"></script>

    <!-- include summernote css/js -->
    <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
  
	<!-- 
	<script src="resources/js/summernote/summernote-lite.js"></script>
	 -->
	<script src="resources/js/summernote/lang/summernote-ko-KR.js"></script>
	<link rel="stylesheet" href="/css/summernote/summernote-lite.css">
  

<!-- 
<form method="post">
  <textarea id="summernote" name="editordata"></textarea>
</form>
 -->

<script>

$(document).ready(function() {
	$('#summernote').summernote({
		  height: 500,                 // 에디터 높이
		  minHeight: 500,             // 최소 높이
		  maxHeight: 500,             // 최대 높이
		  focus: true,                  // 에디터 로딩후 포커스를 맞출지 여부
		  lang: "ko-KR",					// 한글 설정
		  placeholder: '내용을 작성해 주세요.'	//placeholder 설정
          
	});
});

</script>
</form>
</body>
</html>