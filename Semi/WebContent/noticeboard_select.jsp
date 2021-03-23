<%@page import="com.dto.SemiDto"%>
<%@page import="com.dao.SemiDao"%>
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
	int seq = Integer.parseInt(request.getParameter("seq"));

	SemiDao dao = new SemiDao();
	SemiDto dto = dao.selectOne(seq);

%>
	<table border="1">
	<tr>
		<th>작성자</th>
		<td><%=dto.getWriter() %></td>
	</tr>
	<tr>
		<th>제목</th>
		<td><%=dto.getTitle() %></td>
	</tr>
	<tr>
		<th>내용</th>
		<td><textarea rows="20" cols="60" readonly="readonly"><%=dto.getContent() %></textarea></td>

	</table>
	
	<input type="button" class="btn" value="목록으로" onclick="location.href='noticeboard.jsp'" >
	<input type="button" class="btn" value="수정" onclick="location.href='board.do?command=updateres'"/>
	<input type="button" class="btn" value="삭제" onclick="location.href='board.do?command=deleteres'"/>
	
	
</body>
</html>