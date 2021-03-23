<%@page import="com.dto.SemiDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
    <a href = "noticeboard_select.jsp">공지글 하나 선택</a>
    <a href = "noticeboard_insert.jsp">공지글 쓰기(관리자)</a>
    <a href = "noticeboard_update.jsp">공지글 수정(관리자)</a>
    
    
<%
	List<SemiDto> list = (List<SemiDto>) request.getAttribute("list");

%>    
    <h1>공지글 리스트 샘플</h1>
    <table border ="1">
    	<col width="50px"/>
    	<col width="500px"/>
    	<col width="100px"/>
    	<col width="100px"/>
    	<tr>
    		<th>번호</th>
    		<th>제목</th>
    		<th>작성자</th>
    		<th>작성일</th>
    	</tr>

<%
	if(list == null || list.size() ==0){
%>
		<tr>
			<td colspan="4">----글 없음-----</td>
		</tr>
<%
	} else {
		for (SemiDto dto : list){
%>
		<tr>
    		<td><%=dto.getSeq()%></td>
    		<td><a href="board.do?command=select&seq=<%=dto.getSeq() %>"><%= dto.getTitle()%></a></td>
    		<td><%= dto.getWriter()%></td>
    		<td><%= dto.getRegdate()%></td>
    	</tr>
<%
		}
	}
	%>
 <!--    	<c:choose>
    		<c:when test="${empty list }">
    			<tr>
    				<th colspan = "4" >---글 없음---</th>
    			</tr>
    		</c:when>
    	<c:otherwise>
    		<c:forEach items="${list }" var="dto">
    			<tr>
    				<td>${dto.seq }</td>
    				<td><a href="board.do?command=select&seq=${dto.seq }">${dto.title }</a>
    				<td>${dto.writer }</td>
    				<td>${dto.regdate }</td>
    				</tr>
    		</c:forEach>
    		</c:otherwise>
    </c:choose>
    
     -->
    </table>
    
    <input type="button" value="글작성" onclick="location.href='board.do?command=insertform'"/>
</body>
</html>