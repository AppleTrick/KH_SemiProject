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

    <title>Notice Board Update</title>
</head>
<body>
<!-- header 시작 -->  
    <div>
      <!-- 네비게이션바 -->
      <nav class="navbar navbar-expend-lg navbar-light bg-light">
        <div class="container justify-content-center">
          <div class="d-flex flex-row justify-content-between align-items-center col-12">
            <!-- 로고 -->
            <a class="navbar-brand" href="#">
              <img src="resources/img/logo.png" alt="" width="200px">
            </a>
            <!-- 서칭박스 -->
            <div>
              <form class="d-flex">
                <input class="form-control me-2" type="search" placeholder="검색" aria-label="Search" size="45" >
              </form>
            </div>
            <!-- 아이콘 리스트 -->
            <div>
              <ul class="list-inline m-0">
                <li class="list-inline-item ms-2">
                  <a href="#" class="link-menu">
                    <svg xmlns="http://www.w3.org/2000/svg" width="32" height="32" fill="currentColor" class="bi bi-house-door-fill" viewBox="0 0 16 16">
                      <path d="M6.5 14.5v-3.505c0-.245.25-.495.5-.495h2c.25 0 .5.25.5.5v3.5a.5.5 0 0 0 .5.5h4a.5.5 0 0 0 .5-.5v-7a.5.5 0 0 0-.146-.354L13 5.793V2.5a.5.5 0 0 0-.5-.5h-1a.5.5 0 0 0-.5.5v1.293L8.354 1.146a.5.5 0 0 0-.708 0l-6 6A.5.5 0 0 0 1.5 7.5v7a.5.5 0 0 0 .5.5h4a.5.5 0 0 0 .5-.5z"/>
                    </svg>
                  </a>
                </li>
                <li class="list-inline-item ms-2">
                  <a href="#" class="link-menu">
                    <svg xmlns="http://www.w3.org/2000/svg" width="32" height="32" fill="currentColor" class="bi bi-bookmarks" viewBox="0 0 16 16">
                      <path d="M2 4a2 2 0 0 1 2-2h6a2 2 0 0 1 2 2v11.5a.5.5 0 0 1-.777.416L7 13.101l-4.223 2.815A.5.5 0 0 1 2 15.5V4zm2-1a1 1 0 0 0-1 1v10.566l3.723-2.482a.5.5 0 0 1 .554 0L11 14.566V4a1 1 0 0 0-1-1H4z"/>
                      <path d="M4.268 1H12a1 1 0 0 1 1 1v11.768l.223.148A.5.5 0 0 0 14 13.5V2a2 2 0 0 0-2-2H6a2 2 0 0 0-1.732 1z"/>
                    </svg>
                  </a>
                </li>
                <li class="list-inline-item ms-2">
                  <a href="#" class="link-menu">
                    <svg xmlns="http://www.w3.org/2000/svg" width="32" height="32" fill="currentColor" class="bi bi-compass" viewBox="0 0 16 16">
                      <path d="M8 16.016a7.5 7.5 0 0 0 1.962-14.74A1 1 0 0 0 9 0H7a1 1 0 0 0-.962 1.276A7.5 7.5 0 0 0 8 16.016zm6.5-7.5a6.5 6.5 0 1 1-13 0 6.5 6.5 0 0 1 13 0z"/>
                      <path d="M6.94 7.44l4.95-2.83-2.83 4.95-4.949 2.83 2.828-4.95z"/>
                    </svg>
                  </a>
                </li>
                <li class="list-inline-item ms-2">
                  <a href="#" class="link-menu">
                    <svg xmlns="http://www.w3.org/2000/svg" width="32" height="32" fill="currentColor" class="bi bi-heart" viewBox="0 0 16 16">
                      <path d="M8 2.748l-.717-.737C5.6.281 2.514.878 1.4 3.053c-.523 1.023-.641 2.5.314 4.385.92 1.815 2.834 3.989 6.286 6.357 3.452-2.368 5.365-4.542 6.286-6.357.955-1.886.838-3.362.314-4.385C13.486.878 10.4.28 8.717 2.01L8 2.748zM8 15C-7.333 4.868 3.279-3.04 7.824 1.143c.06.055.119.112.176.171a3.12 3.12 0 0 1 .176-.17C12.72-3.042 23.333 4.867 8 15z"/>
                    </svg>
                  </a>
                </li>
                <li class="list-inline-item align-middle ms-2">
                  <a href="#">
                    <div class="rounded-circle overflow-hidden d-flex justify-content-center align-items-center topbar-profile-photo" >
                      <img src="resources/img/profile.jpg" alt="" style="transform: scale(1.5); width: 100%; position: absolute; left: 0;">
                    </div>
                  </a>
                </li>
              </ul>
            </div>
          </div>
        </div>
      </nav>
    </div>
<!-- header 끝 -->    

    <jsp:useBean id="dto" class="com.dto.SemiDto" scope="request"></jsp:useBean>
    
<form action="board.do" method="post">
 <input type="hidden" name="command" value="updateres"/>
 <input type="hidden" name="seq" value="<%=dto.getArticle_no() %>"/>
  <div class="content-wrapper">

    <!-- Main content -->
    	<div class="container"> <!-- 가로 폭 조절 -->
    	<div class="card"> <!-- 카드 시작 -->
    		<div class="card-body">
                <div class="noticeboard">
				      <table class="table" id="sub_text">
						<colgroup>			
						<col style="width:100px" />
						<col style="width:*" />						
						</colgroup>
						<h5 style="margin-bottom: 20px; text-align: center">공지 수정</h5>
						<tr>						
							<th class="text-center">제목</th>
							<td><input type="text" class="form-control" id="title" name="title" 
							value="<%=dto.getTitle()%>"></td>
						</tr>
						<tr>
							<th class="text-center">내용</th>
							<td>
								<textarea id="summernote" name="content">
								<%=dto.getContent() %>
								</textarea>
							</td>
						</tr>
					</table>			      
			    </div>
			    <div style="text-align: right; margin-right: 10px;">
			    	<input type="submit" class="btn" value="수정완료"/>
					<input type="button" class="btn" onclick="location.href='board.do?command=list'" value="목록으로">
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