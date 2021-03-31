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


	<%
		LoginDto dto = (LoginDto) session.getAttribute("dto"); //컨트롤러에서 dto 받아와서 형변환 
			if (dto == null) {
			pageContext.forward("index.jsp");
			}
		
	%>


	<img src="./upload/<%=dto.getMem_image()%>" width="50" height="50">

	<a href="profile.jsp">프로필 사진 변경하기</a><br>


	<a href="login.do?command=updatform&mem_no=<%=dto.getMem_no()%>">개인정보 수정</a><br>
	<a href="login.do?command=deleteuser&mem_no=<%=dto.getMem_no()%>">회원탈퇴</a><br>

</body>
</html>