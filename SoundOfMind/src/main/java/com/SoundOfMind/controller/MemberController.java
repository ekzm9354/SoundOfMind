package com.SoundOfMind.controller;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.SoundOfMind.domain.Member;
import com.SoundOfMind.mapper.MemberMapper;

@Controller
public class MemberController {

	@Autowired
	private MemberMapper mapper;
	

	@PostMapping("/join.do")
	public String join(Member member) {
		mapper.join(member);
		return "index";
	}
	

	@GetMapping("/join.do")
	public String join() {
		return "join";
	}
	
	@GetMapping("/login.do")
	public String login() {
		return "login";
	}
	
	@PostMapping("/login.do")
	public String login(Member member, Model model) {
		Member user = mapper.login(member);
		if(user == null) {
			return "login";}
		else {
		model.addAttribute("name", user.getName());
		model.addAttribute("grade", user.getGrade());
		model.addAttribute("id", user.getId());
			return "index";
		}
	}
	
	@RequestMapping("/delete.do")
	public String delete(String id) {
		mapper.delete(id);
		return "index";
	}
}
