<%@page import="com.dto.LoginDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
 
	
	<script type="text/javascript" src="resources/js/header.js"></script>
	<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl"
	crossorigin="anonymous" />
	<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.0/font/bootstrap-icons.css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.2/css/all.min.css">
	<link rel="stylesheet" href="resources/css/header.css">
	
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
			if (dto1 != null) {
				if (dto1.getMem_image() == null) {
			%>
				<div class="action1">
					<div class="profile" onclick="menuToggle()">
						<img src="resources/img/profile.jpg" alt="">
					</div>
					<div class="menu">
						<h7>
							<%=dto1.getMem_name()%> 님<br>
							<span>환영합니다.</span>
						</h7>
						<ul class="list-group">
							<li><img src="resources/img/edit.png" alt=""><a href="login.do?command=updatform&mem_no=<%=dto1.getMem_no()%>">Edit profile</a></li>
							<li><img src="resources/img/log-out.png" alt=""><a href="login.do?command=logout">Logout</a></li>
						</ul>
					</div>
				</div>
	        					    		
			<%
			    }else{
			%>
				<div class="action1">
					<div class="profile" onclick="menuToggle()">
						<img src="./upload/<%=dto1.getMem_image() %>" alt="">
					</div>
					<div class="menu">
						<h7>
							<%=dto1.getMem_name()%> 님<br>
							<span>환영합니다.</span>
						</h7>
						<ul class="list-group">
							<li><img src="resources/img/edit.png" alt=""><a href="login.do?command=updatform&mem_no=<%=dto1.getMem_no()%>">Edit profile</a></li>
							<li><img src="resources/img/log-out.png" alt=""><a href="login.do?command=logout">Logout</a></li>
						</ul>
					</div>
				</div>
			<%
				}			
       		} else {
	      	%>
	       	<a href="move.do?move=loginpage" id="login">
	       		로그인
	       	</a>
	       	<%
       		}
	       	%>
	       	</div> 
    </header>
    <div class="upsite"></div>
  </body>
  <script type="text/javascript">
	  function menuToggle(){
	      const toggleMenu = document.querySelector('.menu');
	      toggleMenu.classList.toggle('active');
	  }
  </script>
</html>
