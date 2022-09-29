package com.SoundOfMind.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.SoundOfMind.domain.Chatting;
import com.SoundOfMind.domain.Member;
import com.SoundOfMind.domain.Storege;
import com.SoundOfMind.mapper.ChattingMapper;
import com.SoundOfMind.mapper.StoregeMapper;

@Controller
public class CommunityController {

	@Autowired
	private ChattingMapper Cmapper;

	@Autowired
	private StoregeMapper Smapper;

	@GetMapping("/community.do")
	public String community(Model model) {
		List<Storege> comushow = Smapper.comushow();
		model.addAttribute("comushow", comushow);
		return "community";
	}

	@GetMapping("/chatting.do")
	public String chatting(HttpSession session) {
		Member member = (Member) session.getAttribute("user");
		if (member != null) {
			String id = member.getId();
//			채팅방목록
			List<Chatting> chatlist = Cmapper.chatlist(id);
			session.setAttribute("chatlist", chatlist);
		}
		return "chatting";
	}

}
