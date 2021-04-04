<%@page import="java.io.PrintWriter"%>
<%@page import="org.apache.commons.collections.bag.SynchronizedSortedBag"%>
<%@page import="com.dto.LoginDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<link rel="stylesheet" href="resources/css/header.css">
	<script	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
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
	<!-- 썸머노트 부트스트랩 파일 CDN -->
	<script src="https://code.jquery.com/jquery-3.5.1.min.js" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>

    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>

    <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.js"></script>
	<title>petBoard Insert</title>
</head>
<body>
<%@ include file="Form/header.jsp"%>

	<%
		LoginDto logindto = (LoginDto) session.getAttribute("dto"); //컨트롤러에서 dto 받아와서 형변환 
			if (logindto == null) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('로그인이 필요한 페이지입니다.')");
			script.println("location.href='login.jsp'");
			script.println("</script>");
			}	
	%>

    <jsp:useBean id="dto" class="com.dto.BoardDto" scope="request"></jsp:useBean>
 
	  <%
	  
	  if (logindto.getMem_name().equals(dto.getMem_name())){
		 
	  %>
		<div class="mt-4">
				<div class="container d-flex justify-content-center">
					<div class="col-9">    
						<form action="notice.do" method="post">
							<input type="hidden" name="command" value="updateres"/>
							 <input type="hidden" name="article_no" value="<%=dto.getArticle_no() %>"/>
							 <input type="hidden" name="mem_no" value="<%=logindto.getMem_name()%>">
							<div class="content-wrapper">
								<div class="container justify-content-center">						
									<div class="card">
										<div class="card-body">
										
											<div class="noticeboard">									
												<table class="table" id="sub_text">
													<colgroup>
														<col style="width: 100px" />
														<col style="width: *" />
													</colgroup>
													<h5 style="margin-bottom: 20px; text-align: center">입양 후기 작성</h5>
													<tr>
														<th class="text-center">제목</th>
														<td>
															<input type="text" class="form-control" id="title" value="<%=dto.getTitle() %>"	name="title" placeholder="제목을 입력해 주세요.">
														</td>
													</tr>
													<tr>
														<th class="text-center">내용</th>
														<!-- 썸머노트 호출 -->
														<td><textarea id="summernote" name="content"> <%=dto.getContent() %>  </textarea></td>
													</tr>
												</table>
											</div>
											<div style="text-align: right; margin-right: 10px;">
												<input type="submit" class="btn" value="저장하기"> 
												<input type="button" class="btn" value="목록으로" onclick="location.href='notice.do?command=list'">
											</div>
										</div>
									</div>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		<%
		  }else{
			  PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('수정권한이 없습니다.')");
				script.println("location.href='notice.do?command=list'");
				script.println("</script>");

		  }
		
		%>
	<script>
	$('#summernote').summernote({
		height : 700, // 에디터 높이
		minHeight : 500, // 최소 높이
		maxHeight : 700, // 최대 높이
		focus : true, // 에디터 로딩후 포커스를 맞출지 여부
		lang : "ko-KR", // 한글 설정
		placeholder : '글 내용을 입력해 주세요.', //placeholder 설정
		callbacks: {
		    onImageUpload: function(files) {
	            sendFile(files[0]);
		    }
		  }
	});

	
	function sendFile(file) {
		var form_data = new FormData();
	       form_data.append('file', file);
	       $.ajax({
	         data: form_data,
	         type: "post",
	         url: './BoardFileInsert.do',
	         cache: false,
	         contentType: false,
	         /* enctype: 'multipart/form-data', */
	         processData: false,
	         success: function(img_name) {
	        	 console.log(img_name.url);
	        	 var image = $('<img>').attr('src', img_name.url);
	        	 console.log(image);
	             $('#summernote').summernote("insertNode", image[0])
	             $('#mainImage').val(img_name.fileName);
	         }
	       });
	    }
	</script>

</body>
</html>