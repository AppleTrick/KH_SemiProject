package com.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.annotation.WebServlet;
import javax.websocket.OnClose;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;



// WebSocket 호스트 설정
@ServerEndpoint("/semiIndexChat")
public class SemiIndexChat {
	
	// 접속된 클라이언트 WebSocket session 관리 리스트
	private static List<Session> sessionUsers = Collections.synchronizedList(new ArrayList<>());
	
	// 메세지에서 유저명 취득을 위한 정규식 표현
	private static Pattern pattern = Pattern.compile("^\\{\\{.*?\\}\\}");
	
	// WebSocket으로 브라우저가 접속하면 요청되는 함수
	@OnOpen
	public void handleOpen(Session userSession) {
		
		sessionUsers.add(userSession);
		
		System.out.println("클라이언트 연결중");
	}
	
	//WebSocket으로 메세지 요청시 실행함수
	@OnMessage
	public void handleMessage(String message, Session userSession) throws IOException {
		
		System.out.println("message");
		String name = "anoymous";
		Matcher matcher = pattern.matcher(message);
		
		if (matcher.find()) {
			name = matcher.group();
		}
		
		final String msg = message.replaceAll(pattern.pattern(), "");
		final String username = name.replaceFirst("^\\{\\{", "").replaceFirst("\\}\\}$", "");
		
		sessionUsers.forEach(session -> {
			if(session == userSession) {
				return;
			}
			
			try {
				session.getBasicRemote().sendText(username + " => " + msg);
			}catch (IOException e) {
				e.printStackTrace();
			}
		});
		
	}
	//WebScoekt 과 브라우저가 접속이 끊기면 요청되는 함수
	@OnClose
	public void handleClose(Session userSession){
		sessionUsers.remove(userSession);
		
		System.out.println("접속 종료");
	}
}
