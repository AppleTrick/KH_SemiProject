<%@page import="com.dto.LoginDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%@ include file="Form/header.jsp"%>


<%
		LoginDto dto =(LoginDto)session.getAttribute("dto"); //컨트롤러에서 dto 받아와서 형변환 
		if(dto==null){
			pageContext.forward("index.jsp");
		}
%>


<!-- 바디부분 시작 -->
	<div class="mt-4">
		<div class="container d-flex justify-content-center">
			<div class="col-9">


				<!-- 파일 업로드 양식 페이지 -->

				<!-- 여러개의 파일이 폼태그를 이용해서 전달된다  타입이 꼭 필요함...왜?-->
				<form action="file.do?command=upload&mem_id=<%=dto.getMem_id() %>"
					method="post" enctype="multipart/form-data">
					파일: <input type="file" name="file"><br> <input
						type="submit" value="업로드"><br>



				</form>

			</div>
		</div>
	</div>

</body>
</html>