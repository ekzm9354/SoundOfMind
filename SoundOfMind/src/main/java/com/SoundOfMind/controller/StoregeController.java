package com.SoundOfMind.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.SoundOfMind.domain.Member;
import com.SoundOfMind.domain.Storege;
import com.SoundOfMind.mapper.StoregeMapper;

@Controller
public class StoregeController {

	@Autowired
	private StoregeMapper mapper;

	@GetMapping("/storege.do")
	public String storege(HttpSession session, Model model) {
		Member member = (Member) session.getAttribute("user");
		if (member != null) {
			String id = member.getId();
			List<Storege> storege = mapper.storege(id);
			model.addAttribute("storege", storege);
		}
		return "storege";
	}
}
