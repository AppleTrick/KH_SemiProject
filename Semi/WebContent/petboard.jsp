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
						<input type="button" class="btn" value="글작성" onclick="location.href='pet.do?command=insertform'"/>
					</div>
					
					
					<!-- 글게시물  -->
					<div class="photo-gallery">

						<!--  아래 같은 형식으로 계속 출력 시킬것!-->
						<!-- img의 chk 과 div 클래스의 pic wait 인 경우 입양대기 -->
						<!-- div 클래스의 pic after 인 경우 입양후기 -->

						<div class="pic wait">
							<img src="resources/TestImage/dog1.jpg" data-original="dog1.jpg" chk="stop"/>
						</div>
						<div class="pic wait">
							<img src="resources/TestImage/dog2.jpg" data-original="dog2.jpg" chk="stop"/>
						</div>
						<div class="pic wait">
							<img src="resources/TestImage/dog3.jpg" data-original="dog3.jpg" chk="stop"/>
						</div>
						<div class="pic after">
							<img src="resources/TestImage/dog4.jpg" data-original="dog4.jpg" />
						</div>
						<div class="pic after">
							<img src="resources/TestImage/cat1.jpg" data-original="cat1.jpg" />
						</div>
						<div class="pic after">
							<img src="resources/TestImage/cat2.jpg" data-original="cat2.jpg" />
						</div>
						<div class="pic after">
							<img src="resources/TestImage/cat3.jpg" data-original="cat3.jpg" />
						</div>
						<div class="pic wait">
							<img src="resources/TestImage/dog1.jpg" data-original="dog1.jpg" chk="stop"/>
						</div>
						<div class="pic wait">
							<img src="resources/TestImage/dog2.jpg" data-original="dog2.jpg" chk="stop"/>
						</div>
						<div class="pic after">
							<img src="resources/TestImage/dog4.jpg" data-original="dog4.jpg"/>
						</div>
						<div class="pic after">
							<img src="resources/TestImage/cat1.jpg" data-original="cat1.jpg"/>
						</div>
						<div class="pic after">
							<img src="resources/TestImage/cat2.jpg" data-original="cat2.jpg"/>
						</div>
						<div class="pic after">
							<img src="resources/TestImage/cat3.jpg" data-original="cat3.jpg"/>
						</div>
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
					<span>제목</span>
				</div>
				<div class="modal-text-content">
					<span> 내용 부분 </span>
				</div>

				<!-- onclick 부분 href 해주시면 됩니다. -->
				<div class="wrap">
					<input type="button" value="삭제하기" class="modal-button" onclick="">
					<input type="button" value="수정하기" class="modal-button" onclick="">
					<input type="button" value="입양신청하러가기" class="modal-button"
						id="apply" onclick="">
				</div>
			</div>
		</div>
	</div>
  
	 
	
	
	
<%
	List<BoardDto> list = (List<BoardDto>) request.getAttribute("list");
	

%>    
    <h2 style="margin-bottom: 20px; margin-top: 20px; text-align: center">PET BOARD</h2>
    <table class="table table-hover" id="list">
    	<col width="100px"/>
    	<col width="100px"/>
    	<col width="100px"/>
    	<col width="100px"/>
    	<col width="100px"/>
    	<col width="100px"/>
    <thead>
		<tr>
			<th scope="col" class="" style="text-align: center;">글번호</th>
			<th scope="col" class="">제목</th>
			<th scope="col" class="" style="text-align: center;">작성자</th>
			<th scope="col" class="" style="text-align: center;">날짜</th>
			<th scope="col" class="" style="text-align: center;">조회수</th>
			<th scope="col" class="" style="text-align: center;">사진(이미지)</th>
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
		
		
		//getBrd_no() :2 =입양 대기, :3 = 입양 후기게시판 
		//전체페이지를 불러오는 코드
		for (BoardDto dto : list){
			if(dto.getBrd_no()==2 || dto.getBrd_no()==3){
			
%>
		
		<tr>
    		<td style="text-align: center;"><%=dto.getArticle_no()%></td>
    		<td><a href="pet.do?command=selectone&article_no=<%=dto.getArticle_no() %>" style="text-decoration: none; color:black;"><%= dto.getTitle()%></a></td>
    		<td style="text-align: center;"><%= dto.getMem_name() %></td>
    		<td style="text-align: center;"><%= dto.getRegdate()%></td>
    		<td style="text-align: center;"><%= dto.getHit() %></td>
    		<td style="text-align: center;"><%= dto.getImage() %></td>
    		
    	</tr>
<%
			}
		}
	}
	%>
    </table>
	
	
	
</body>
</html>