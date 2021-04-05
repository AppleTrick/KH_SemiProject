<%@page import="com.dto.PagingDto"%>
<%@page import="com.biz.LoginBiz"%>
<%@page import="com.dto.BoardDto"%>
<%@page import="com.dto.SemiDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<style>
.btn:focus, .btn:active, .btn:hover, input:active, input:focus, nav:active,
	nav:focus, nav:hover {
	box-shadow: none !important;
	outline: none !important;
}

#notice_list a {
	text-decoration: none;
}
</style>

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
    
<meta charset="UTF-8">
<title>Notice Board List</title>
<head>

</head>
<body>
<%
	List<BoardDto> list = (List<BoardDto>) request.getAttribute("list");
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
  <!-- 헤더부분 추가 -->
	<%@ include file="Form/header.jsp" %>
	
	<!-- 바디부분 시작 -->
    <div class="mt-4">
      <div class="container d-flex justify-content-center"><!-- 가로 폭 조절 -->
        <div class="col-99">
        <div class="card"><!-- 카드 시작 -->
        <div class="noticeboard_list">
    
<%

	

%>    
    <h2 style="margin-bottom: 20px; margin-top: 20px; text-align: center">공지사항</h2>
    <table class="table table-hover" id="list">
    	<col width="70px"/>
    	<col width="500px"/>
    	<col width="120px"/>
    	<col width="120px"/>
    	<col width="70px"/>
    <thead>
		<tr>
			<th scope="col" class="" style="text-align: center;">번호</th>
			<th scope="col" class="">제목</th>
			<th scope="col" class="" style="text-align: center;">작성자</th>
			<th scope="col" class="" style="text-align: center;">날짜</th>
			<th scope="col" class="" style="text-align: center;">조회수</th>
		</tr>
	</thead>

<%
	if(list == null || list.size() ==0){
%>
		<tr>
			<td colspan="4">----글 없음-----</td>
		</tr>
<%
	} else {
		
		
		//getBrd_no() ==1 : 공지글만 보기
		for (BoardDto dto : list){
			
%>
		
		<tr>
    		<td style="text-align: center;"><%=dto.getArticle_no()%></td>
    		<td><a href="notice.do?command=selectone&article_no=<%=dto.getArticle_no() %>" style="text-decoration: none; color:black;"><%= dto.getTitle()%></a></td>
    		<td style="text-align: center;"><%= dto.getMem_name() %></td>
    		<td style="text-align: center;"><%= dto.getRegdate()%></td>
    		<td style="text-align: center;"><%= dto.getHit() %></td>
    	</tr>
<%
		}
	}
	%>
    </table>
    </div>
    <div style="text-align: right; margin-right: 10px; margin-bottom: 10px;">
    <input type="button" class="btn btn-primary" value="글작성" onclick="location.href='notice.do?command=insertform'"/>
    </div>
    
       <!-- pagination-->
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
				location.href='notice.do?command=list&page='+page
			}
		</script>
	 <!-- pagination 끝-->
	
    </div><!-- 카드 끝 -->
    		</div>
    	</div>
    </div>
</body>
</html>
<br/>
<br/>