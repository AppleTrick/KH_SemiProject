<%@page import="com.dto.LoginDto"%>
<%@page import="com.biz.LoginBiz"%>
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
		LoginDto dto = (LoginDto) session.getAttribute("dto"); //컨트롤러에서 dto 받아와서 형변환 
			if (dto == null) {
			pageContext.forward("index.jsp");
			}
		
	%>
	<div class="mt-4">
		<div class="container d-flex justify-content-center">
			<div class="col-9">


				<a href="login.do?command=updatform&mem_no=<%=dto.getMem_no()%>">개인정보수정</a><br>



			</div>
		</div>
	</div>

</body>
</html>