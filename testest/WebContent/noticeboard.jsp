<%@page import="com.dto.SemiDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <style>
  .btn{
  background-color: #ff9999!important;}
  .btn:hover, .btn:focus{
  background-color: hotpink!important;}
.btn:focus, .btn:active, .btn:hover, input:active, input:focus, nav:active, nav:focus, nav:hover{
    box-shadow: none!important;
    outline: none!important;
}
#notice_list{
	text-decoration: none!important;
}
  </style>
 <style type="text/css">
			li {list-style: none; float: left; padding: 6px;}
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
  <!-- 헤더부분 추가 -->
	<%@ include file="Form/header.jsp" %>
	
	<!-- 바디부분 시작 -->
    <div class="mt-4">
      <div class="container d-flex justify-content-center"><!-- 가로 폭 조절 -->
        <div class="col-99">
        <div class="card"><!-- 카드 시작 -->
        <div class="noticeboard_list">
    
<%
	List<SemiDto> list = (List<SemiDto>) request.getAttribute("list");

%>    
    <h2 style="margin-bottom: 20px; margin-top: 20px; text-align: center">공지사항</h2>
    <table class="table table-hover" id="notice_list">
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
			<td colspan="5" style="text-align: center;">----글 없음-----</td>
		</tr>
<%
	} else {
		for (SemiDto dto : list){
%>
		
		<tr>
    		<td style="text-align: center;"><%=dto.getArticle_no()%></td>
    		<td class="text_underline"><a href="board.do?command=selectone&seq=<%=dto.getArticle_no() %>"><%= dto.getNotice_title()%></a></td>
    		<td style="text-align: center;"><%= dto.getAdmin_writer()%></td>
    		<td style="text-align: center;"><%= dto.getNotice_regdate()%></td>
    		<td style="text-align: center;"><%= dto.getNotice_hit() %></td>
    	</tr>
<%
		}
	}
	%>
    </table>
    </div>
    <div style="text-align: right; margin-right: 10px; margin-bottom: 10px;">
    <input type="button" class="btn" value="글작성" onclick="location.href='board.do?command=insertform'"/>
    </div>
    
    <div>
  <ul>
    <c:if test="${pageMaker.prev}">
    	<li><a href="list${pageMaker.makeQuery(pageMaker.startPage - 1)}">이전</a></li>
    </c:if> 

    <c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
    	<li><a href="list${pageMaker.makeQuery(idx)}">${idx}</a></li>
    </c:forEach>

    <c:if test="${pageMaker.next && pageMaker.endPage > 0}">
    	<li><a href="list${pageMaker.makeQuery(pageMaker.endPage + 1)}">다음</a></li>
    </c:if> 
  </ul>
	</div>
	
       <!-- pagination
    <nav aria-label="pagination">
  <ul class="pagination justify-content-center" >
    <li class="page-item">
      <a class="page-link" href="#" aria-label="Previous">
        <span aria-hidden="true">&laquo;</span>
      </a>
    </li>
    <li class="page-item"><a class="page-link" href="#">1</a></li>
    <li class="page-item"><a class="page-link" href="#">2</a></li>
    <li class="page-item"><a class="page-link" href="#">3</a></li>
    <li class="page-item">
      <a class="page-link" href="#" aria-label="Next">
        <span aria-hidden="true">&raquo;</span>
      </a>
    </li>
  </ul>
</nav>
	 pagination 끝-->
	
    </div><!-- 카드 끝 -->
    		</div>
    	</div>
    </div>
</body>
</html>
<br/>
<br/>