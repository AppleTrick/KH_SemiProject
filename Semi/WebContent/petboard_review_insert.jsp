<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Pet Board Review Insert 입양후기 글작성페이지</title>
<link rel="stylesheet" href="resources/bootstrap/css/bootstrap.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>

<style>
.btn {
	background-color: #ff9999
}

.btn:hover, .btn:focus {
	background-color: hotpink
}
.btn:focus, .btn:active, .btn:hover, input:active, input:focus {
	box-shadow: none !important;
	outline: none !important;
}

  </style>
  
  	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.0/font/bootstrap-icons.css">
    <link rel="stylesheet" href="resources/css/header.css">  
    

<title>Notice Board Insert</title>
</head>
<body>
	<%@ include file="Form/header.jsp"%>
	<!-- 바디부분 시작 -->
	<div class="mt-4">
		<div class="container d-flex justify-content-center">
			<div class="col-9">
				<jsp:useBean id="dto" class="com.dto.SemiDto" scope="request"></jsp:useBean>

				<form action="board.do" method="post">
					<input type="hidden" name="command" value="insertres" />
					<div class="content-wrapper">

						<!-- Main content -->
						<div class="container justify-content-center">
							<!-- 가로 폭 조절 -->
							<div class="card">
								<!-- 카드 시작 -->
								<div class="card-body">
									<div class="noticeboard">
										<table class="table" id="sub_text">
											<colgroup>
												<col style="width: 100px" />
												<col style="width: *" />
											</colgroup>
											<h5 style="margin-bottom: 20px; text-align: center">공지
												작성</h5>
											<tr>
												<th class="text-center">제목</th>
												<td><input type="text" class="form-control" id="title"
													name="title" placeholder="제목을 입력해 주세요." value=""></td>
											</tr>
											<tr>
												<th class="text-center">내용</th>
												<td><textarea id="summernote" name="content"></textarea>
												</td>
											</tr>
										</table>
									</div>
									<div style="text-align: right; margin-right: 10px;">
										<input type="submit" class="btn" value="저장하기"> <input
											type="button" class="btn"
											onclick="location.href='noticeboard.jsp'" value="목록으로">
									</div>
								</div>
								<!-- card-body-->
							</div>
							<!-- card -->
						</div>
						<!-- container -->
					</div>
					<!-- main content -->
			</div>
		</div>
	</div>


	<!-- include libraries(jQuery, bootstrap) -->
	<!--  <link href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="resouces/bootstrap/js/bootstrap.js"></script>-->

	<!-- include summernote css/js -->
	<link
		href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css"
		rel="stylesheet">
	<script
		src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>

	<!-- 
	<script src="resources/js/summernote/summernote-lite.js"></script>
	 -->
	<script src="resources/js/summernote/lang/summernote-ko-KR.js"></script>
	<link rel="stylesheet" href="/css/summernote/summernote-lite.css">



	<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"
		integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n"
		crossorigin="anonymous"></script>
	<link
		href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css"
		rel="stylesheet">
	<script
		src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>



	<!-- 
<form method="post">
  <textarea id="summernote" name="editordata"></textarea>
</form>
 -->

	<script>
		$('#summernote').summernote(
				{
					height : 700, // 에디터 높이
					minHeight : 500, // 최소 높이
					maxHeight : 700, // 최대 높이
					focus : true, // 에디터 로딩후 포커스를 맞출지 여부
					lang : "ko-KR", // 한글 설정
					placeholder : '글 내용을 입력해 주세요.', //placeholder 설정
					callbacks : { //여기 부분이 이미지를 첨부하는 부분
						onImageUpload : function(files) {
							uploadSummernoteImageFile(files[0], this);
						},
						onPaste : function(e) {
							var clipboardData = e.originalEvent.clipboardData;
							if (clipboardData && clipboardData.items
									&& clipboardData.items.length) {
								var item = clipboardData.items[0];
								if (item.kind === 'file'
										&& item.type.indexOf('image/') !== -1) {
									e.preventDefault();
								}
							}
						}
					}
				});

		//이미지 파일 업로드
		function uploadSummernoteImageFile(file, editor) {
			data = new FormData();
			data.append("file", file);
			$.ajax({
				data : data,
				type : "POST",
				url : "/uploadSummernoteImageFile",
				contentType : false,
				processData : false,
				success : function(data) {
					//항상 업로드된 파일의 url이 있어야 한다.
					$(editor).summernote('insertImage', data.url);
				}
			});
		}
	</script>
	</form>
</body>
</html>