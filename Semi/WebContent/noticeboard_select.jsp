<%@page import="com.dto.SemiDto"%>
<%@page import="com.dao.SemiDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
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
<head>
<meta charset="UTF-8">
<title>selectOne</title>
<style>
  .btn{
  background-color: #ff9999!important;}
  .btn:hover, .btn:focus{
  background-color: hotpink!important;}
.btn:focus, .btn:active, .btn:hover, input:active, input:focus{
    box-shadow: none!important;
    outline: none!important;
}
  </style>
</head>
<body> 
<!-- 헤더부분 추가 -->
	<%@ include file="Form/header.jsp" %>
<!-- 바디부분 시작 -->
    <div class="mt-4">
      <div class="container d-flex justify-content-center"><!-- 가로 폭 조절 -->
        <div class="col-99">
        <div class="card"><!-- 카드 시작 -->
        <div class="noticeboard_list">	
<%
	int seq = Integer.parseInt(request.getParameter("seq"));

	SemiDao dao = new SemiDao();
	SemiDto dto = dao.selectOne(seq);

%>
	<table class="table" id="select">
	<col width="90px" />
    	<col width="700px"/>
    	<col width="120px"/>
    	<col width="120px"/>
	<tr>
		<th style="text-align: center">작성자</th>
		<td><%=dto.getAdmin_writer() %></td>
	</tr>
	<tr>
		<th style="text-align: center">제목</th>
		<td><%=dto.getTitle() %></td>
	</tr>
	<tr>
		<th style="text-align: center; height:350px;">내용</th>
		<td><div><%=dto.getContent() %></div></td>

	</table>
	
	<div style="text-align: right; margin-right: 10px; margin-bottom: 10px;">
	<input type="button" class="btn" value="목록으로" onclick="location.href='board.do?command=list'" >
	<input type="button" class="btn" value="수정" onclick="location.href='board.do?command=updateform&seq=<%=seq %>'"/>
	<input type="button" class="btn" value="삭제" onclick="location.href='board.do?command=delete&seq=<%=seq %>'"/>
	 </div>
	 </div>
    </div><!-- 카드 끝 -->
    		</div>
    	</div>
    </div>
	<br/>
	<br/>
</body>
</html>