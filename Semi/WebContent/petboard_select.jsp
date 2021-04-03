<%@page import="com.dto.BoardDto"%>
<%@page import="com.biz.BoardBiz"%>
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
<title>Pet Board Select</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl"
	crossorigin="anonymous" />
	<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.0/font/bootstrap-icons.css">

<link rel="stylesheet" href="resources/css/index.css" />

</head>
<body>
	<%@ include file="Form/header.jsp"%>
<%
	LoginDto logindto = (LoginDto) session.getAttribute("dto"); //컨트롤러에서 dto 받아와서 형변환 

	int article_no = Integer.parseInt(request.getParameter("article_no"));

	BoardBiz biz = new BoardBiz();
	BoardDto dto = biz.selectOne(article_no);
	
%>
	<table class="table" id="select">
	<col width="90px" />
    	<col width="700px"/>
    	<col width="120px"/>
    	<col width="120px"/>
	<tr>
		<th style="text-align: center">작성자</th>
		<td><%=dto.getMem_name() %></td>
	</tr>
	<tr>
		<th style="text-align: center">제목</th>
		<td><%=dto.getTitle() %></td>
	</tr>
	<tr>
		<th style="text-align: center; height:350px;">내용</th>
		<td><div><%=dto.getContent() %></div></td>
	</tr>
	<tr>
		<td>
			<input type="button" class="btn" value="목록으로" onclick="location.href='notice.do?command=list'" >
	<input type="button" class="btn" value="수정" onclick="location.href='pet.do?command=updateform&article_no=<%=article_no %>'"/>
	<input type="button" class="btn" value="삭제" onclick="location.href='pet.do?command=delete&article_no=<%=article_no %>'"/>
			
		</td>
	</tr>

	
	
	
	
	</table>
	
	
	
    

</body>
</html>