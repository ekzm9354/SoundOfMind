package com.SoundOfMind.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.SoundOfMind.domain.Chatting;
import com.SoundOfMind.domain.Member;
import com.SoundOfMind.mapper.ChattingMapper;

@Controller
public class ComunityRestController {

	@Autowired
	private ChattingMapper Cmapper;

//	 대화 불러오기
	@GetMapping("/ShowChat.do")
	public @ResponseBody List<Chatting> showchat(String to_id, HttpSession session) {
		Member member = (Member) session.getAttribute("user");
		String from_id = member.getId();
		List<Chatting> chat = Cmapper.chat(from_id, to_id);
		System.out.println(chat);
		return chat;
	}

//	클릭시 채팅방 이름 바꾸기
	@RequestMapping("/whoChat.do")
	public @ResponseBody String whoChat(String whochat) {
		String whoChat = whochat;
		return whoChat;
	}

// 메세지 보내기
	@PostMapping("/ChatSend.do")
	public @ResponseBody int chatSend(String to_id, String from_id, String chat) {
		int cnt = Cmapper.ChatSend(to_id, from_id, chat);
		System.out.println(from_id);
		return cnt;
	}

//	보낸 메세지 바로 보여주기
	@GetMapping("/ResentChat.do")
	public @ResponseBody List<Chatting> ResentChat(String from_id, HttpSession session) {
		Member member = (Member) session.getAttribute("user");
		String to_id = member.getId();
		List<Chatting> ResentChat = Cmapper.ResentChat(from_id, to_id);
		System.out.println(ResentChat);
		return ResentChat;
	}

	@GetMapping("/deleteChat.do")
	public @ResponseBody int deleteChat(String to_id, HttpSession session) {
		Member member = (Member) session.getAttribute("user");
		String from_id = member.getId();
		int cnt = Cmapper.deleteChat(to_id, from_id);
		return cnt;
	}
}
