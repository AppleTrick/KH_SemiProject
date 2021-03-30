<%@page import="com.dto.DonateDto"%>
<%@page import="java.util.List"%>
<%@page import="com.biz.DonateBiz"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	String donate_phone = request.getParameter("donate_phone");
	List<DonateDto> list = (List<DonateDto>) request.getAttribute("list");
%>
	<table border="1">
		<col width="50px">
		<col width="200px">
		<col width="300px">
		<tr>
			<th>번호</th>
			<th>후원자</th>
			<th>후원금액</th>
			<th>후원날짜</th>
		</tr>
<%
	if (list.size() == 0) {
%>
		<tr>
			<td colspan="3">-------------작성된 글이 없습니다---------------</td>
		</tr>
<%
	} else {
		for (DonateDto dto : list) {
			if (dto.getDonate_phone().equals(donate_phone)) {
%>
		<tr>
			<td><%=dto.getDonate_no() %></td>
			<td><%=dto.getDonate_name() %></td>
			<td><%=dto.getDonate_pay() %></td>
			<td><%=dto.getDonate_date() %></td>
		</tr>
<%
			}
		}
	}
%>
		<tr>
			<td colspan="4" align="right"><input type="button" value="홈으로" onclick="location.href='donate.do?command=main'"></td>
		</tr>
	</table>
</body>
</html>