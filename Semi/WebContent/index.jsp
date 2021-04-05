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
        	<h2>함께해요<br /><span>맛있는 밥 후원하기</span></h2>
        <div class="animated-text">
          <h3>랜선보호자가 되고싶다면?</h3>
          <h3>굶주림에 지친아이들을 돕고싶다면?</h3>
          <h3>유기견 보호소에 힘이되고 싶다면?</h3>
        </div>
        <a href="move.do?move=donation" class="btn1">후원하기</a>
       <!--  <div class="media-icons">
          <a href="#"><i class="fab fa-facebook"></i></a>
          <a href="#"><i class="fab fa-instagram"></i></a>
          <a href="#"><i class="fab fa-twitter"></i></a>
        </div> -->
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
        <h2 class="section-title">About Us</h2>
      </div>
      <div class="content">
        <div class="column col-left">
          <div class="img-card">
            <img src="resources/indexResources/cat.jpg" alt="">
          </div>
        </div>
        <div class="column col-right">
          <h2 class="content-title">ANIMALNATION</h2>
          <p class="paragraph-text" style="font-size: 14pt;">
          오늘날 전세계적으로 700억여 마리의 동물들이 인간에 의해 태어나고 죽음에 이르고 있습니다. <br>
          그리고 국내에서는 매년 십만 마리 이상 하루에 약 200마리의 반려동물들이 길거리에 버려지고 있습니다. <br>
          이 중 새 보호자를 찾거나 원래 집으로 돌아가는 경우도 있지만 대부분은 자연사하거나 안락사 됩니다. <br>
          인간에 의해 상처받고 고통받는 것에 책임을 느끼고 작은 보탬이 되고자 애니멀네이션을 설립하였습니다. <br>

		</p>
	   </div>
      </div>
    </section>
	<!-- about 부분 종료 -->
	<!-- about 부분 시작 -->
    <section class="about1" id="about">
      <div class="title1">
        <h2 class="section-title1">About Us</h2>
      </div>
      <div class="content">        
        <div class="column col-right">
          <h2 class="content-title1">ANIMALNATION</h2>
          <p class="paragraph-text1" style="font-size: 14pt;">
          애니멀네이션은 흩어져있는 보호소의 정보를 모아 한눈에 보여주어 중간다리의 역할을 하는 플랫폼입니다.<br> 
		  저희는 잊혀져 가는 유기동물들의 입양을 도와주고, 운영비용이 모자란 보호소에 후원금을 전달 합니다. <br>
		  여러분들의 소중한 마음이 모여 올바른 반려동물 문화가 자리잡게 될 것입니다.<br>
		</p>
	   </div>
	   <div class="column col-left">
          <div class="img-card">
            <img src="resources/indexResources/cat.jpg" alt="">
          </div>
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
        <h2 class="section-title">DEVELOPERS</h2>
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