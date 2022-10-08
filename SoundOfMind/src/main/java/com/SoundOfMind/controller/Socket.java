package com.SoundOfMind.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

import org.springframework.stereotype.Component;

import com.SoundOfMind.domain.Member;

import ch.qos.logback.core.recovery.ResilientSyslogOutputStream;

@Component
@ServerEndpoint(value = "/websocket") // 서버가 바인딩된 주소를 뜻함.
public class Socket {
// 소켓에 있는 전체 리스트
	private static ArrayList<Session> sessionList = new ArrayList<Session>();

	@OnOpen // 클라이언트가 소켓에 연결되때 마다 호출
	public void onOpen(Session session) {
//		클라이언트가 소켓에 연결되면 해당 아이디를기록, 해당 아이디를 전체 리스트에 추가
		if (session != null) {
			String sessionId = session.getId();
			System.out.println("client is connected.sessionId == [" + sessionId + "]");
			sessionList.add(session);
//			웹소켓에 연결되어 있는 모든 사용자에게 메시지 전송
			sendMessageToAll("[USER-" + sessionId + "]님이 입장하셨습니다.");
		}
	}

	@OnClose // 클라이언트와 소켓과의 연결이 닫힐때 (끊길떄) 마다 호출
	public void onClose(Session session) {
		if (session != null) {
			String sessionId = session.getId();
			System.out.println("client is disconnected.sessionId == [" + sessionId + "]");
			sendMessageToAll("[USER-" + sessionId + "]님이 나가셨습니다.");
		}
	}

	@OnMessage
	public String onMessage(String message, Session session) {
		if (session != null) {
			String sessionId = session.getId();
			System.out.println("message is arrived.sessionId == [" + sessionId + "]/ message== [" + message + "]");
			sendMessageToAll("[USER-" + sessionId + "]" + message);
		}
		return null;
	}

	@OnError // 의도치 않은 에러 발생
	public void onError(Throwable t) {
		t.printStackTrace();
	}

//	 웹소켓에 연결되어 있는 모든 사용자에게 메시지 전송
	private boolean sendMessageToAll(String message) {
		if (sessionList == null) {
			return false;
		}
		int sessionCount = sessionList.size();
		if (sessionCount < 1) {
			return false;
		}
		Session singleSession = null;
		for (int i = 0; i < sessionCount; i++) {
			singleSession = sessionList.get(i);
			if (singleSession == null) {
				continue;
			}
			if (!singleSession.isOpen()) {
				continue;
			}
			sessionList.get(i).getAsyncRemote().sendText(message);
		}
		return true;
	}
}