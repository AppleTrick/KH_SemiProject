<%@page import="com.dto.LoginDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인페이지</title>
<link rel="stylesheet" href="resources/indexResources/style.css" />
<script src="resources/indexResources/script.js" charset="utf-8"></script>
</head>
<body>
<% 


LoginDto dto =(LoginDto)session.getAttribute("dto"); //컨트롤러에서 dto 받아와서 형변환 
System.out.println("session 담겼을까요?"+dto);

%>
	<%@ include file="Form/header.jsp"%>
	
	<!-- 메인부분 시작 -->
	<section class="main">
		<div class="slide slide1"></div>
        <div class="slide slide2" id="slide"></div>
        
      	<div class="content">
        	<h2>Hello I'm<br /><span>Jacob Stevens</span></h2>
        <div class="animated-text">
          <h3>Web Disigner</h3>
          <h3>Web Developer</h3>
          <h3>Motion Graphic Designer</h3>
        </div>
        <a href="#" class="btn1">See My Works</a>
        <div class="media-icons">
          <a href="#"><i class="fab fa-facebook"></i></a>
          <a href="#"><i class="fab fa-instagram"></i></a>
          <a href="#"><i class="fab fa-twitter"></i></a>
        </div>
      </div>
    </section>
    
    <script>
        var slide = document.getElementById('slide');
        window.onmousemove = function(e){
            var x = e.clientX;
            slide.style.left = x+'px';
        }
    </script>
    <!-- 메인부분 종료 -->
    
    <!-- about 부분 시작 -->
    <section class="about" id="about">
      <div class="title">
        <h2 class="section-title">About Me</h2>
      </div>
      <div class="content">
        <div class="column col-left">
          <div class="img-card">
            <img src="resources/indexResources/cat.jpg" alt="">
          </div>
        </div>
        <div class="column col-right">
          <h2 class="content-title">안녕하세요</h2>
          <p class="paragraph-text">In this video, you will learn how to design A <br><br> Complete Responsive Personal Portfolio Website Using HTML, CSS, and Vanilla Javascript</p>
          <a href="" class="btn">See More</a>
        </div>
      </div>
    </section>
	<!-- about 부분 종료 -->
	
	<!-- slider 부분 -->
	<section class="sliderBody">
		<div class="img-slider">
	        <div class="slide3 active">
	            <img src="resources/indexResources/cat.jpg" alt="" class="mainImage">
	            <div class="info">
	                <h2>Slide 01</h2>
	                <p>In this video, You will learn how to design a Responsive Image Slider(Slideshow / Carousel) with Manual Navigation Buttons and Auto-Play Navigation functionalities only using pure javascript. In this Image Slider, you can add more images you want without changing any CSS styles because </p>
	            </div>
	        </div>
	        <div class="slide3">
	            <img src="resources/indexResources/cat.jpg" alt="" class="mainImage">
	            <div class="info">
	                <h2>Slide 02</h2>
	                <p>In this video, You will learn how to design a Responsive Image Slider(Slideshow / Carousel) with Manual Navigation Buttons and Auto-Play Navigation functionalities only using pure javascript. In this Image Slider, you can add more images you want without changing any CSS styles because </p>
	            </div>
	        </div>
	        <div class="slide3">
	            <img src="resources/indexResources/dog.jpg" alt="" class="mainImage">
	            <div class="info">
	                <h2>Slide 03</h2>
	                <p>In this video, You will learn how to design a Responsive Image Slider(Slideshow / Carousel) with Manual Navigation Buttons and Auto-Play Navigation functionalities only using pure javascript. In this Image Slider, you can add more images you want without changing any CSS styles because </p>
	            </div>
	        </div>
	        <div class="slide3">
	            <img src="resources/indexResources/dog.jpg" alt="" class="mainImage">
	            <div class="info">
	                <h2>Slide 04</h2>
	                <p>In this video, You will learn how to design a Responsive Image Slider(Slideshow / Carousel) with Manual Navigation Buttons and Auto-Play Navigation functionalities only using pure javascript. In this Image Slider, you can add more images you want without changing any CSS styles because </p>
	            </div>
	        </div>
	        <div class="slide3">
	            <img src="resources/indexResources/dog.jpg" alt="" class="mainImage">
	            <div class="info">
	                <h2>Slide 05</h2>
	                <p>In this video, You will learn how to design a Responsive Image Slider(Slideshow / Carousel) with Manual Navigation Buttons and Auto-Play Navigation functionalities only using pure javascript. In this Image Slider, you can add more images you want without changing any CSS styles because </p>
	            </div>
	        </div>
	        <div class="navigation">
	            <div class="btn2 active"></div>
	            <div class="btn2"></div>
	            <div class="btn2"></div>
	            <div class="btn2"></div>
	            <div class="btn2"></div>
	        </div>
	    </div>
	</section>
	

    <script type="text/javascript">
    var slides = document.querySelectorAll('.slide3');
    var btns = document.querySelectorAll('.btn2');
    let currentSlide = 1;

    var manualNav = function(manual){
       slides.forEach((slide3) => {
           slide3.classList.remove('active');
           btns.forEach((btn) =>{
               btn.classList.remove('active');
           });
       });

        slides[manual].classList.add('active');
        btns[manual].classList.add('active');
    }

    btns.forEach((btn,i)=>{
        btn.addEventListener("click",()=>{
            manualNav(i);
            currentSlide = i;
        })
    })

    // 오토 네이비게이션
    var repeat = function(activeClass){
        let active = document.getElementsByClassName('active');
        let i = 1;

        var repeater = () => {
            setTimeout(function(){
                [...active].forEach((activeSlide) => {
                    activeSlide.classList.remove('active');
                });

                slides[i].classList.add('active');          
                btns[i].classList.add('active');

                i++;

                if(slides.length== i){
                    i=0;
                }
                if (i >= slides.length) {
                    return;
                }
                repeater();
            },5000);
        }
        repeater();
    }
    repeat();
    </script>	
	<!-- slider 부분 종료 -->
	
	<!-- our team 부분 -->
	<section class="work" id="work">
      <div class="title reveal">
        <h2 class="section-title">My Work</h2>
      </div>
      <div class="content">
        <div class="card reveal">
          <div class="card-img">
            <img src="images/work1.jpg" alt="">
          </div>
        </div>
        <div class="card reveal">
          <div class="card-img">
            <img src="images/work2.jpg" alt="">
          </div>
        </div>
        <div class="card reveal">
          <div class="card-img">
            <img src="images/work3.jpg" alt="">
          </div>
        </div>
        <div class="card reveal">
          <div class="card-img">
            <img src="images/work4.jpg" alt="">
          </div>
        </div>
        <div class="card reveal">
          <div class="card-img">
            <img src="images/work5.jpg" alt="">
          </div>
        </div>
      </div>
    </section>
    <!-- 끝 -->
	
	
	<!-- 채팅시작 -->
	<!-- <textarea readonly rows="10" cols="35" id="messageTextArea"></textarea>
	<div>
		<input id="user" type="text" value="anonymous"> <input
			id="textMessage" type="text"><br> <input
			onclick="sendMessage()" value="Send" type="button"><br>
		<input onclick="disconnect()" value="Disconnect" type="button">
	</div> -->
	<!-- 채팅 종료 -->

	<!-- <script type="text/javascript">
		// 콘솔 텍스트 에리어 오브젝트
		const messageTextArea = document.getElementById("messageTextArea");

		// 웹 소켓 접속 함수, url 뒤의 파라미터는 callback 함수를 받는다.
		function connectWebSocket(url, message, open, close, error) {

			let webSocket = new WebSocket(url);

			// 함수 체크하는 함수
			function call(cb, msg) {
				// cb가 함수 타입인지 확인
				if (cb !== undefined && typeof cb === "function") {
					// 함수 호출
					cb.call(null, msg);
				}
			}

			// WebSocket 서버와 접속이 되면 호출되는 함수
			webSocket.onopen = function() {
				call(open);
			};

			// WebSocket 서버와 접속이 끊기면 호출되는 함수
			webSocket.onclose = function() {
				call(close);
			};

			// WebSocket 서버와 통신 중에 에러가 발생하면 요청되는 함수
			webSocket.onerror = function() {
				call(error);
			};

			// WebSocket 서버로 부터 메시지가 오면 호출되는 함수
			webSocket.onmessage = function(msg) {
				call(message, msg);
			};
			return webSocket;
		}

		// 연결 발생 때 사용할 callback 함수
		var open = function() {
			// 콘솔 텍스트에 메시지를 출력한다
			messageTextArea.value += "Server connect...\n";
		}

		// 종료 발생 때 사용할 callback 함수
		var close = function() {
			// 콘솔 텍스트에 메시지를 출력한다
			messageTextArea.value += "Server Disconnect...\n";
			// 재 접속을 시도한다.
			setTimeout(function() {
				// 재접속
				webSocket = connectWebSocket(
						"ws://localhost:8787/Semi/semiIndexChat", message,
						open, close, error);
			});
		}

		// 에러 발생 때 사용할 callback 함수
		var error = function() {
			messageTextArea.value += "error...\n";
		}

		// 메세지를 받을 때 사용할 callback 함수
		var message = function(msg) {
			messageTextArea.value += msg.data + "\n";
		};

		// 웹 소켓 생성
		var webSocket = connectWebSocket(
				"ws://localhost:8787/Semi/semiIndexChat", message, open, close,
				error);

		// Send 버튼을 누르면 호출되는 함수
		function sendMessage() {

			// 유저명 텍스트 박스 오브젝트를 취득
			var user = document.getElementById("user");

			// 송신 메시지를 작성하는 텍스트 박스 오브젝트를 취득
			var message = document.getElementById("textMessage");

			// 콘솔 텍스트에 메시지를 출력한다.
			messageTextArea.value += user.value + "(me) => " + message.value
					+ "\n";

			// WebSocket 서버에 메시지를 전송(형식 「{{유저명}}메시지」)
			webSocket.send("{{" + user.value + "}}" + message.value);

			// 송신 메시지를 작성한 텍스트 박스를 초기화한다.
			message.value = "";
		}
		// Disconnect 버튼을 누르면 호출되는 함수
		function disconnect() {
			// WebSocket 접속 해제
			webSocket.close();
		} -->
	</script>
</body>
</html>