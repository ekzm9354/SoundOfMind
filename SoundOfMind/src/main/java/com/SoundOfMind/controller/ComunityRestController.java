package com.SoundOfMind.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.SoundOfMind.domain.Chatting;
import com.SoundOfMind.domain.Member;
import com.SoundOfMind.mapper.ChattingMapper;

@Controller
public class ComunityRestController {

	@Autowired
	private ChattingMapper Cmapper;

	@GetMapping("/ShowChat.do")
	public @ResponseBody List<Chatting> showchat(String to_id, HttpSession session) {
		System.out.println(to_id);
		Member member = (Member) session.getAttribute("user");
		String from_id = member.getId();
		System.out.println(from_id);
		List<Chatting> chat = Cmapper.chat(from_id, to_id);
		System.out.println(chat);

		return chat;
	}
}
