<%@page import="com.dto.LoginDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인페이지</title>
	<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl"
	crossorigin="anonymous" />
	<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.0/font/bootstrap-icons.css">

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
				<div class="row">
					<!-- 로우 단위로 나눔 (좌측) -->
					<div class="col-8">


						<!-- 글 부분 -->
						<div class="d-flex flex-column mb-4">
							<div class="card">

								<!--  카드 헤더부분 -->
								<div class="card-header">
									<div class="d-flex flex-row align-items-center">
										<div
											class="rounded-circle overflow-hidden d-flex border border-danger justify-content-center align-items-center post-profile-photo me-3">
											<img src="resources/img/profile.jpg" alt=""
												style="transform: scale(1.5); width: 100%; position: absolute; left: 0;" />
										</div>
										<span class="font-weight-bold">이름</span>
									</div>
								</div>

								<!-- 카드 바디 부분 -->
								<div class="card-body p-0">
									<div class="ratio ratio-4x3">
										<img src="resources/img/dog.jpg" alt="" />
									</div>

									<!-- 하단 버튼 리스트 -->
									<div class="d-flex justify-content-between ps-3 pe-3 pt-3 pb-1">
										<ul class="list inline p-0 mb-0">
											<li class="list-inline-item ms-2">
												<button class="btn p-0">
													<svg xmlns="http://www.w3.org/2000/svg" width="1.6em"
														height="1.6em" fill="currentColor" class="bi bi-heart"
														viewBox="0 0 16 16">
                              <path
															d="M8 2.748l-.717-.737C5.6.281 2.514.878 1.4 3.053c-.523 1.023-.641 2.5.314 4.385.92 1.815 2.834 3.989 6.286 6.357 3.452-2.368 5.365-4.542 6.286-6.357.955-1.886.838-3.362.314-4.385C13.486.878 10.4.28 8.717 2.01L8 2.748zM8 15C-7.333 4.868 3.279-3.04 7.824 1.143c.06.055.119.112.176.171a3.12 3.12 0 0 1 .176-.17C12.72-3.042 23.333 4.867 8 15z" />
                            </svg>
												</button>
											</li>

											<li class="list-inline-item ms-2">
												<button class="btn p-0">
													<svg xmlns="http://www.w3.org/2000/svg" width="1.6em"
														height="1.6em" fill="currentColor" class="bi bi-heart"
														viewBox="0 0 16 16">
                              <path
															d="M8 2.748l-.717-.737C5.6.281 2.514.878 1.4 3.053c-.523 1.023-.641 2.5.314 4.385.92 1.815 2.834 3.989 6.286 6.357 3.452-2.368 5.365-4.542 6.286-6.357.955-1.886.838-3.362.314-4.385C13.486.878 10.4.28 8.717 2.01L8 2.748zM8 15C-7.333 4.868 3.279-3.04 7.824 1.143c.06.055.119.112.176.171a3.12 3.12 0 0 1 .176-.17C12.72-3.042 23.333 4.867 8 15z" />
                            </svg>
												</button>
											</li>

											<li class="list-inline-item ms-2">
												<button class="btn p-0">
													<svg xmlns="http://www.w3.org/2000/svg" width="1.6em"
														height="1.6em" fill="currentColor" class="bi bi-heart"
														viewBox="0 0 16 16">
                              <path
															d="M8 2.748l-.717-.737C5.6.281 2.514.878 1.4 3.053c-.523 1.023-.641 2.5.314 4.385.92 1.815 2.834 3.989 6.286 6.357 3.452-2.368 5.365-4.542 6.286-6.357.955-1.886.838-3.362.314-4.385C13.486.878 10.4.28 8.717 2.01L8 2.748zM8 15C-7.333 4.868 3.279-3.04 7.824 1.143c.06.055.119.112.176.171a3.12 3.12 0 0 1 .176-.17C12.72-3.042 23.333 4.867 8 15z" />
                            </svg>
												</button>
											</li>
										</ul>

										<div>
											<button class="btn p-0">
												<svg xmlns="http://www.w3.org/2000/svg" width="1.6em"
													height="1.6em" fill="currentColor" class="bi bi-heart"
													viewBox="0 0 16 16">
                            <path
														d="M8 2.748l-.717-.737C5.6.281 2.514.878 1.4 3.053c-.523 1.023-.641 2.5.314 4.385.92 1.815 2.834 3.989 6.286 6.357 3.452-2.368 5.365-4.542 6.286-6.357.955-1.886.838-3.362.314-4.385C13.486.878 10.4.28 8.717 2.01L8 2.748zM8 15C-7.333 4.868 3.279-3.04 7.824 1.143c.06.055.119.112.176.171a3.12 3.12 0 0 1 .176-.17C12.72-3.042 23.333 4.867 8 15z" />
                          </svg>
											</button>
										</div>
									</div>

									<!-- 텍스트 내용 -->
									<div class="ps-3 pe-3 pb-2">
										<strong class="d-block mb-1">좋아요 클릭수</strong> <strong
											class="d-block">username</strong>
										<p class="mb-1">영국 매체 기브미스포츠는 21일(한국 시간) 이번 시즌 잉글랜드
											프리미어리그(EPL) 각 포지션별 톱5 선수를 선정했다. 매체는 축구 통계 업체 후스코어드의 평점을 참고했다.
											평점 7.43의 손흥민은 왼쪽 윙 포워드 부문에서 2위를 차지했다. 라힘 스털링(맨체스터 시티), 사디오
											마네(리버풀), 마커스 래쉬포드(맨체스터 유나이티드) 등 쟁쟁한 경쟁자들을 제쳤다.</p>
										<!-- 숨겨진 코멘트 보기 -->
										<button class="btn p-0">
											<span class="text-muted">view all 925 comment</span>
										</button>

										<!-- 댓글창 -->
										<div>
											<!-- 한 유저가 댓글 달때 생기는 곳 -->
											<div>
												<strong>박창희</strong> <span>😍 정신 나갈거 같아 정신 나갈거 같아정신
													나갈거 같아정신 나갈거 같아정신 나갈거 같아정신 나갈거 같아정신 나갈거 같아정신 나갈거 같아정신 나갈거
													같아정신 나갈거 같아정신 나갈거 같아</span>
											</div>
											<!-- 한 유저가 댓글 달때 생기는 곳 -->
											<div>
												<strong>최봉준</strong> <span>😍</span>
											</div>
											<!-- 한 유저가 댓글 달때 생기는 곳 -->
											<div>
												<strong>차가람</strong> <span>😍</span>
											</div>
										</div>

										<!-- 날짜 입력 -->
										<small class="text-muted">3월 22일 11시 38</small>
										<!-- 날짜입력 종료 -->
									</div>
									<!-- 텍스트 종료 -->

									<!-- 댓글 입력 -->
									<div class="position-relative comment-box">
										<form action="">
											<div class="d-flex flex-row">
												<input class="border-0 p-3 flex-fill"
													placeholder="댓글을 입력해 주세요" />
												<button class="btn btn-primary btn-post">Post</button>
											</div>
										</form>
									</div>
									<!-- 댓글 입력 종료 -->
								</div>
							</div>
						</div>
						<!-- End Of post -->
					</div>
					<!--  옆에 내용부분 추가 -->
					<div class="col-4">
						<div>
							<!-- 채팅시작 -->
							<textarea readonly rows="10" cols="35" id="messageTextArea"></textarea>
							<div>
								<input id="user" type="text" value="anonymous"> <input
									id="textMessage" type="text"><br> <input
									onclick="sendMessage()" value="Send" type="button"><br>
								<input onclick="disconnect()" value="Disconnect" type="button">
							</div>
							<!-- 채팅 종료 -->
						</div>
					</div>
					<!-- 옆에 내용 부분 끝 -->
				</div>
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