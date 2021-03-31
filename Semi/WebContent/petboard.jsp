<%@page import="com.dto.PetDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/css/petboard.css" />
</head>
<body>

	<%@ include file="Form/header.jsp"%>
	
	<%
	List<PetDto> list = (List<PetDto>) request.getAttribute("list");
	List<PetDto> list2 = (List<PetDto>) request.getAttribute("list2");
	List<PetDto> list3 = (List<PetDto>) request.getAttribute("list3");
	%>
	<!-- 바디부분 시작 -->
	<div class="mt-4">
		<div class="container d-flex justify-content-center">
			<div class="col-9">

				<input type="radio" name="Gallery" id="check1" checked /> 
				<input type="radio" name="Gallery" id="check2" /> 
				<input type="radio"	name="Gallery" id="check3" />

				<div class="container">
					<div class="top-content">
						<label for="check1">전체보기</label> 
						<label for="check2">입양대기</label> 
						<label for="check3">입양후기</label>
						<input type="button" class="btn" value="글작성" onclick="location.href='pet.do?command=insertform'"/>
					</div>
		
					<div class="photo-gallery">
					
						<!-- 글게시물  -->
						<!--  아래 같은 형식으로 계속 출력 시킬것!
						<div class="pic wait">
							<img src="resources/TestImage/img01.jpg" />
						</div>
						-->
						
<%
	if(list2 == null || list2.size() ==0){
%>
		<tr>
			<td colspan="4">----글 없음-----</td>
		</tr>
<%
	} else {
		for (PetDto dto : list3){
%>
						<div class="pic after">
							<td> <%=dto.getPet_content()%></td>
						</div>
						<!--
						<div class="pic wait">
							<td> <%=dto.getPet_title()%></td>
						</div>
						 
						<div class="pic after">
							<img src="resources/TestImage/img05.jpg" />
						</div>
						<div class="pic after">
							<img src="resources/TestImage/img06.jpg"/>
						</div>
						 -->
<%}
		} %>					
					</div>
				</div>


			</div>
		</div>
	</div>


   
</body>
</html>