<%@page import="com.biz.BoardBiz"%>
<%@page import="com.dto.BoardDto"%>
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
<script src="resources/js/petboard.js"></script>  
</head>
<body>

<%
	//로그인 세션 불러옵니다...
	LoginDto logindto = (LoginDto)session.getAttribute("dto");	
%>

<%
	// 리스트를 불러옵니다.
	List<BoardDto> list = (List<BoardDto>) request.getAttribute("list");
%>  
	

	<%@ include file="Form/header.jsp"%>
	


	<!-- 바디부분 시작 -->
	<div class="mt-4">
		<div class="container d-flex justify-content-center">
			<div class="col-9">
				<!-- 선택한 값만 모여주게 할 수 있는 라디오 버튼 --> 
				<input type="radio" name="Gallery" id="check1" checked /> 
				<input type="radio" name="Gallery" id="check2" /> 
				<input type="radio"	name="Gallery" id="check3" />
				
				
				<!-- 최상위 박스 -->
				<div class="contentBox">
					<!-- 선택하는 곳 -->
					<div class="top-content">
						<label for="check1">전체보기</label> 
						<label for="check2">입양대기</label> 
						<label for="check3">입양후기</label>
						<input type="button" class="btn" value="입양 후기 글작성" onclick="location.href='pet.do?command=insertform'"/>
<%
						if((logindto != null) && (logindto.getMem_role().equals("ADMIN"))){
%>
						<input type="button" class="btn" value="크롤링해주기(입양대기)" onclick="location.href='crawling.do?command=animal&mem_no=<%=logindto.getMem_no()%>&brd_no=2'"/>
<%
						}
%>	
					
					</div>		

					<!-- 글게시물  -->
					<div class="photo-gallery">
						<%
							if(list == null || list.size() ==0){
						%>
							<div>
								<h1>글없음</h1>
							</div>
						<%
							} else {			
								//getBrd_no() :2 =입양 대기, :3 = 입양 후기게시판 
								//전체페이지를 불러오는 코드
								for (BoardDto dto : list){
									if(dto.getBrd_no()==2){
									
						%>
								<!-- dto.getBrd_no()==2 일경우(입양대기)	 -->
								
								<div class="pic wait">
									<img src="resources/saveFile/<%= dto.getImage() %>" data-original="<%= dto.getImage() %>" articleNo="<%=dto.getArticle_no() %>" chk="stop"/>
								</div>			    	
			    	
						    	
						<%
									}else if(dto.getBrd_no()==3){
						%>
								<!-- dto.getBrd_no()==3 일경우(입양후기)	 -->	
									<div class="pic after">
										<img src="savefile/<%= dto.getImage() %>" data-original="<%= dto.getImage() %>" articleNo="<%=dto.getArticle_no() %>" />
									</div>			

						<%				
									}
								}
							}
						%>

						<!--  아래 같은 형식으로 계속 출력 시킬것!-->
						<!-- img의 chk 과 div 클래스의 pic wait 인 경우 입양대기 -->
						<!-- div 클래스의 pic after 인 경우 입양후기 -->
						
						
						
						<!-- 
						<div class="pic wait"> 입양 대기형식
							<img src="resources/TestImage/dog1.jpg" data-original="dog1.jpg" chk="stop"/>
						</div>

						<div class="pic after"> 입양 후기 형식
							<img src="resources/TestImage/dog4.jpg" data-original="dog4.jpg" />
						</div>
						-->

					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- 모달창생성 -->
	<div class="modal1">

		<div class="full-img">
			<div class="modalImg">
				<img src="resources/TestImage/dog2.jpg" alt="" class="thisImg">
			</div>
			<div class="modalText">
				<div class="modal-text-title">
					<span id="title">제목</span>
				</div>
				<div class="modal-text-content">
					<span id="content"> 내용 부분 </span>
				</div>

				<!-- onclick 부분 href 해주시면 됩니다. -->
				<div class="wrap">
					<input type="hidden" value="" id="TextArticleNo">
					<input type="button" value="삭제하기" class="modal-button" onclick="deleteData()">
					<input type="button" value="수정하기" class="modal-button" onclick="updateData()">
					<input type="button" value="입양신청하러가기" class="modal-button" id="apply" onclick="applyData()">
				</div>
			</div>
		</div>
	</div>	
</body>
</html>