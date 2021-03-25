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
		LoginDto dto =(LoginDto)session.getAttribute("dto"); //컨트롤러에서 dto 받아와서 형변환 
		if(dto==null){
			pageContext.forward("index.html");
		}
%>


    <a href = "login.do?command=updatform&mem_no=<%=dto.getMem_no()%>">내 정보 수정</a>
    
</body>
</html>