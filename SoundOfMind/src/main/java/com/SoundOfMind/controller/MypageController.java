package com.SoundOfMind.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.SoundOfMind.domain.Emotion;
import com.SoundOfMind.domain.Member;
import com.SoundOfMind.mapper.MypageMapper;

@Controller
public class MypageController {

	@Autowired
	private MypageMapper mapper;

	@GetMapping("/mypage.do")
	public String storege(HttpSession session, Model model) {
		Member member = (Member) session.getAttribute("user");
		if (member != null) {
			String id = member.getId();
			List<Emotion> emotion = mapper.emotion(id);
			model.addAttribute("emotion", emotion);
		}
		return "mypage";
	}
}
