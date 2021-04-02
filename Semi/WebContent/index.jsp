<%@page import="com.dto.LoginDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인페이지</title>

<link rel="stylesheet" href="resources/css/index.css" />

</head>
<body>
<% 


LoginDto dto =(LoginDto)session.getAttribute("dto"); //컨트롤러에서 dto 받아와서 형변환 
System.out.println("session 담겼을까요?"+dto);

%>
	<%@ include file="Form/header.jsp"%>
	<!-- 바디부분 시작 -->
	<div class="mt-4">
		<div class="container d-flex justify-content-center">
			<div class="col-9">
				<!-- <div class="row"> -->
					<!-- 로우 단위로 나눔 (좌측) -->
							
							<!-- 채팅시작 -->
							<textarea readonly rows="10" cols="35" id="messageTextArea"></textarea>
							<div>
								<input id="user" type="text" value="anonymous"> <input
									id="textMessage" type="text"><br> <input
									onclick="sendMessage()" value="Send" type="button"><br>
								<input onclick="disconnect()" value="Disconnect" type="button">
							</div>
							<!-- 채팅 종료 -->
					
					<!-- 옆에 내용 부분 끝 -->
				<!-- </div> -->
			</div>
		</div>
	</div>
	<!-- 바디부분 종료 -->

	<script type="text/javascript">
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
		}
	</script>
</body>
</html>