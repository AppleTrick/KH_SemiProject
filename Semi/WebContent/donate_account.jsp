<%@page import="com.dto.PagingDto"%>
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
	<%@ include file="Form/header.jsp" %>
<%
	List<DonateDto> list = (List<DonateDto>) request.getAttribute("list");
	String donate_phone = request.getParameter("donate_phone");
	int pageNum = request.getParameter("page") == null ? 1 : Integer.parseInt(request.getParameter("page"));
	int totalCount = Integer.parseInt(request.getAttribute("totalCount") + "");

	PagingDto paging = new PagingDto();
	paging.setPageNo(pageNum);
	paging.setPageSize(10);
	paging.setTotalCount(totalCount);
%>
	
	<script type="text/javascript">
		$(document).ready(function(){
			
			var pageNum = <%=pageNum - 1%>;
			
			if(pageNum >= 10){
				pageNum %= 10;
			}
			
			$(".pagination>a").eq(pageNum).addClass("on");
			
		})
	</script>

	<table border="1">
		<col width="25px">
		<col width="100px">
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
			<td colspan="4">-------------작성된 글이 없습니다---------------</td>
		</tr>
<%
	} else {
		for (DonateDto dto : list) {
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
%>
		<tr>
			<td colspan="3" align="center">
				<div class="pagination">
		<input type="button" onclick="pageMove(<%=paging.getFirstPageNo()%>)"
			value="◀"> <input type="button"
			onclick="pageMove(<%=paging.getPrevPageNo()%>)" value="◁">

		<%
			for (int i = paging.getStartPageNo(); i <= paging.getEndPageNo(); i++) {
		%>
		<a onclick="pageMove(<%=i%>)"><%=i%></a>
		<%
			}
		%>

		<input type="button" onclick="pageMove(<%=paging.getNextPageNo()%>)"
			value="▷"> <input type="button"
			onclick="pageMove(<%=paging.getFinalPageNo()%>)" value="▶">
	</div>
		<script>
			function pageMove(page){
				location.href='donate.do?command=donatemain&donate_phone=<%=donate_phone %>&page='+page
			}
		</script>
	</td>
			<td align="right"><input type="button" value="홈으로" onclick="location.href='donate.do?command=main'"></td>
		</tr>
	</table>
	
</body>
</html>