<%@page import="com.dto.LoginDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
 
	<link rel="stylesheet" href="resources/css/header.css">
	<script type="text/javascript" src="resources/js/header.js"></script>
	<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl"
	crossorigin="anonymous" />
	<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.0/font/bootstrap-icons.css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.2/css/all.min.css">
	
	<!--  <link href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="resouces/bootstrap/js/bootstrap.js"></script>-->
</head>
  <body>
  <%
  	LoginDto dto1 = (LoginDto)session.getAttribute("dto");
  %>


      <header>
	      <!-- 로고 부분 -->
	      <a href="move.do?move=home" class="brand">
	      	<img src="resources/img/logo.png" alt="" width="200px">
	      </a>
	      <!-- ? -->
	      <div class="menu-btn"></div>
	      
	      <!-- 항복 부분 -->
	      <div class="navigation">
	      	<a href="move.do?move=petboard">펫보드</a>
	        <a href="move.do?move=noticeboard">공지사항</a>
	        <a href="move.do?move=matchPet">얼굴인식</a>
	        <a href="move.do?move=donation">기부페이지</a>
	        <a href="move.do?move=map">지도페이지이동</a>
	        <a href="move.do?move=doctor">펫닥터페이지</a>
	        <%
			if( dto1 != null ){
				if(dto1.getMem_image() == null){			    	
			%>
			<div style="display : inline;">
				<a href="mypage.jsp">
	        		<img src="resources/img/profile.jpg"  width="32px" height="32px;" style="border-radius: 50%; overflow: hidden;" >
	        	</a>
			</div>
	        					    		
			<%
			    }else{
			%>
	       	<a href="mypage.jsp">
	            <img src="./upload/<%=dto1.getMem_image() %>"  width="32px" height="32px;" style="border-radius: 50%; overflow: hidden;">
	        </a>
			<%
				}			
			%>
		   	<a href="login.do?command=logout">
		   		<button>로그아웃</button>
		   	</a>
	       	<%
	       	} else {
	      	%>
	       	<a href="move.do?move=loginpage">
	       		<button>로그인</button> 
	       	</a>
	       	<%
	       	}
	       	%>
	       	</div> 
    </header>
    <div class="upsite"></div>
  </body>
</html>
