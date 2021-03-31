<%@page import="com.dto.LoginDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<link rel="stylesheet" href="resources/css/header.css">
	<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl"
	crossorigin="anonymous" />
	<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.0/font/bootstrap-icons.css">
</head>
  <body>
  <%
  	LoginDto dto1 = (LoginDto)session.getAttribute("dto");
  	
  	
  %>
    <div>
      <!-- 네비게이션바 -->
      <nav class="navbar navbar-expend-lg navbar-light bg-light">
        <div class="container justify-content-center">
          <div class="d-flex flex-row justify-content-between align-items-center col-9">
            <!-- 로고 -->
            <a class="navbar-brand" href="move.do?move=home">
              <img src="resources/img/logo.png" alt="" width="200px">
            </a>
            <!-- 서칭박스 -->
            <div>
              <form class="d-flex">
                <input class="form-control me-2" type="search" placeholder="검색" aria-label="Search" size="45" >
              </form>
            </div>
            <!-- 아이콘 리스트 -->
            <div>
              <ul class="list-inline m-0">
              <!-- 공지사항  -->
                <li class="list-inline-item ms-2">
                <a href="move.do?move=noticeboard" class="link-menu">
                  <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" fill="currentColor" class="bi bi-info-circle" viewBox="0 0 16 16">
  					<path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
  					<path d="M8.93 6.588l-2.29.287-.082.38.45.083c.294.07.352.176.288.469l-.738 3.468c-.194.897.105 1.319.808 1.319.545 0 1.178-.252 1.465-.598l.088-.416c-.2.176-.492.246-.686.246-.275 0-.375-.193-.304-.533L8.93 6.588zM9 4.5a1 1 0 1 1-2 0 1 1 0 0 1 2 0z"/>
					</svg>
					</a>
                </li>
              <!-- 동물 얼굴인식 -->
                <li class="list-inline-item ms-2">
                  <a href="move.do?move=matchPet" class="link-menu">
                    <svg id="Capa_1" enable-background="new 0 0 512 512" height="24" viewBox="0 0 512 512" width="24" xmlns="http://www.w3.org/2000/svg"><g><path d="m382.749 195.774-25.182-17.168 1.756 30.426c2.164 37.49-20.201 64.829-34.271 71.342-11.347-6.83-24.356-10.407-38.052-10.407h-61c-24.935 0-46-20.607-46-45v-60c0-24.813-20.187-45-45-45h-45c-33.084 0-60 26.916-60 60h-30v45c0 36.219 25.809 66.524 60 73.493v34.208c0 28.702 10.864 56.872 30 78.261v101.038h90v-92h69.787l4.394 4.394c12.796 12.796 29.688 21.301 47.819 24.352v63.255h90v-110.542l-24.416-48.832c33.97-14.691 54.416-47.481 54.416-82.627 0-29.7-14.674-57.436-39.251-74.193zm-262.749-45.807h15c8.271 0 15 6.729 15 15v30c0 8.271-6.729 15-15 15s-15-6.729-15-15zm223.936 178.817-11.936 2.491v17.233l30 60v73.459h-30v-62h-15c-15.521 0-31.074-6.288-41.606-16.819l-13.18-13.181h-112.214v92h-30v-83.213c-1.293-1.86-30-24.315-30-66.086v-62.701h-15c-24.813 0-45-20.187-45-45v-15h30v-30c0-16.542 13.458-30 30-30v45c0 24.813 20.187 45 45 45 5.634 0 11.025-1.05 16-2.95 2.551 15.471 9.984 29.761 21.588 41.103 14.413 14.088 33.381 21.847 53.412 21.847h61c18.801 0 28.424 10.744 31.223 12.354 2.148-.853 28.406 1.371 52.382-35.246 6.819-10.415 11.886-21.919 15.04-33.917 4.121 8.201 6.355 17.355 6.355 26.809 0 28.725-19.765 52.911-48.064 58.817z"/><path d="m113.463 45.253h30v60h-30z" transform="matrix(.996 -.087 .087 .996 -6.07 11.483)"/><path d="m194.714 143.431h60v30h-60z" transform="matrix(.996 -.087 .087 .996 -12.953 20.189)"/><path d="m168.209 77.514h60v30h-60z" transform="matrix(.643 -.766 .766 .643 -.068 184.882)"/><path d="m467 117.967c-11.328 0-21.684 4.217-29.603 11.151l-219.801-129.085-15.192 25.869 220.27 129.36c-.434 2.506-.674 5.077-.674 7.705 0 24.813 20.187 45 45 45s45-20.187 45-45-20.187-45-45-45zm0 60c-8.271 0-15-6.729-15-15s6.729-15 15-15 15 6.729 15 15-6.729 15-15 15z"/></g></svg>
                  </a>
                </li>
               <!--기부페이지 -->
                <li class="list-inline-item ms-2">
                  <a href="move.do?move=donation" class="link-menu">
                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" fill="currentColor" class="bi bi-suit-heart" viewBox="0 0 16 16">
 					 <path d="M8 6.236l-.894-1.789c-.222-.443-.607-1.08-1.152-1.595C5.418 2.345 4.776 2 4 2 2.324 2 1 3.326 1 4.92c0 1.211.554 2.066 1.868 3.37.337.334.721.695 1.146 1.093C5.122 10.423 6.5 11.717 8 13.447c1.5-1.73 2.878-3.024 3.986-4.064.425-.398.81-.76 1.146-1.093C14.446 6.986 15 6.131 15 4.92 15 3.326 13.676 2 12 2c-.777 0-1.418.345-1.954.852-.545.515-.93 1.152-1.152 1.595L8 6.236zm.392 8.292a.513.513 0 0 1-.784 0c-1.601-1.902-3.05-3.262-4.243-4.381C1.3 8.208 0 6.989 0 4.92 0 2.755 1.79 1 4 1c1.6 0 2.719 1.05 3.404 2.008.26.365.458.716.596.992a7.55 7.55 0 0 1 .596-.992C9.281 2.049 10.4 1 12 1c2.21 0 4 1.755 4 3.92 0 2.069-1.3 3.288-3.365 5.227-1.193 1.12-2.642 2.48-4.243 4.38z"/>
					</svg>
                  </a>
                </li>
               <!-- 지도페이지 이동 -->
                <li class="list-inline-item ms-2">
                  <a href="move.do?move=map" class="link-menu">
                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" fill="currentColor" class="bi bi-map" viewBox="0 0 16 16">
  					 <path fill-rule="evenodd" d="M15.817.113A.5.5 0 0 1 16 .5v14a.5.5 0 0 1-.402.49l-5 1a.502.502 0 0 1-.196 0L5.5 15.01l-4.902.98A.5.5 0 0 1 0 15.5v-14a.5.5 0 0 1 .402-.49l5-1a.5.5 0 0 1 .196 0L10.5.99l4.902-.98a.5.5 0 0 1 .415.103zM10 1.91l-4-.8v12.98l4 .8V1.91zm1 12.98l4-.8V1.11l-4 .8v12.98zm-6-.8V1.11l-4 .8v12.98l4-.8z"/>
					</svg>
                  </a>
                </li>
               <!-- 펫닥터 페이지  -->
                <li class="list-inline-item ms-2">
                  <a href="move.do?move=doctor" class="link-menu">
                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" fill="currentColor" class="bi bi-border-all" viewBox="0 0 16 16">
  						<path d="M0 0h16v16H0V0zm1 1v6.5h6.5V1H1zm7.5 0v6.5H15V1H8.5zM15 8.5H8.5V15H15V8.5zM7.5 15V8.5H1V15h6.5z"/>
					</svg>
                  </a>
                </li>
               <!-- 회원 정보 -->
               		<%
					    if( dto1 != null ){
					    	if(dto1.getMem_image() == null){
					    	
							%>		    		
					    		<li class="list-inline-item align-middle ms-2">
					            <a href="mypage.jsp">
					                <div class="rounded-circle overflow-hidden d-flex justify-content-center align-items-center topbar-profile-photo" >
					                    <img src="resources/img/profile.jpg" alt="" style="transform: scale(1.5); width: 100%; position: absolute; left: 0;">
					                </div>
					            </a>
					        </li>
					    		
					<%
					    	}else{
					%>
					
						<li class="list-inline-item align-middle ms-2">
					            <a href="mypage.jsp">
					                <div class="rounded-circle overflow-hidden d-flex justify-content-center align-items-center topbar-profile-photo" >
					                    <img src="./upload/<%=dto1.getMem_image() %>" alt="" style="transform: scale(1.5); width: 100%; position: absolute; left: 0;">
					                </div>
					            </a>
					        </li>
					        
				<%
					    	}			
				%>
					
					
					
					
                <!--로그아웃-->
                	
                
                <li class="list-inline-item align-middle ms-2">
               	  <a href="login.do?command=logout">
               		<div>
               			<button>로그아웃</button>
               		</div>
               	  </a>
               	</li>
               <%
               		} else {
               %>
               	<li class="list-inline-item align-middle ms-2">
               	  <a href="move.do?move=loginpage">
               		<div>
               			<button>로그인</button>
               		</div>
               	  </a>
               	</li>
               <%
               		}
               %> 
              </ul>
            </div>
          </div>
        </div>
      </nav>
    </div>
  </body>
</html>
