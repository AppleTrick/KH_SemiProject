<%@page import="com.dto.DonateDto"%>
<%@page import="java.util.List"%>
<%@page import="com.biz.DonateBiz"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<style>

th,td{
	padding: 10px;
}
*{
	box-shadow: none !important;
	outline: none !important;
}
</style>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file="Form/header.jsp"%>
	<div class="mt-4">
		<div class="container d-flex justify-content-center">
			<div class="col-9">
				<div class="card">
				<%
					String donate_phone = request.getParameter("donate_phone");
					List<DonateDto> list = (List<DonateDto>) request.getAttribute("list");
				%>
					<h2 style="margin-bottom: 20px; margin-top: 20px; text-align: center">후원 내역</h2>
					<table class="table">
						<col width="50px">
						<col width="200px">
						<col width="300px">
						<tr style="text-align:center;">
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
						<tr style="text-align:center;">
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
					</table>
						<input type="button" class="btn btn-warning col-2 mx-auto" value="홈으로" style="text-align: center; margin-bottom: 10px;"
						onclick="location.href='donate.do?command=main'">
	    		</div>
	    	</div>
    	</div>
    </div>
</body>
</html>