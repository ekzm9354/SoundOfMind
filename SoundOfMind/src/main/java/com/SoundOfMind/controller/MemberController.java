package com.SoundOfMind.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

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
	public String login(Member member,HttpSession session,HttpServletRequest request) {
		Member user = mapper.login(member);
		if(user == null) {
			return "login";}
		else {
			session.setAttribute("user", user); //세션생성
			String ip = request.getRemoteAddr();
			System.out.println(ip);
			session.setAttribute("ip", ip);
			
			return "index";
		}
	}
	@RequestMapping("/delete.do")
	public String delete(String id) {
		mapper.delete(id);
		return "index";
	}
	@RequestMapping("/logout.do")
	public String logout(HttpSession session) {
		session.invalidate();
		return "index";
	}
	

}
