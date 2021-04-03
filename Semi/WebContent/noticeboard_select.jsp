<%@page import="com.dto.BoardDto"%>
<%@page import="com.biz.BoardBiz"%>
<%@page import="com.dao.BoardDao"%>
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
	</table>
	
	<div style="text-align: right; margin-right: 10px; margin-bottom: 10px;">
	<input type="button" class="btn" value="목록으로" onclick="location.href='notice.do?command=list'" >
	<input type="button" class="btn" value="수정" onclick="location.href='notice.do?command=updateform&article_no=<%=article_no %>'"/>
	<input type="button" class="btn" value="삭제" onclick="location.href='notice.do?command=delete&article_no=<%=article_no %>'"/>
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