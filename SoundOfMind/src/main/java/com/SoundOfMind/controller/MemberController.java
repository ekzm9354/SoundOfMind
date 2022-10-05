package com.SoundOfMind.controller;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLDecoder;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Mapper;
import org.python.jline.internal.Log;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.SoundOfMind.domain.Member;
import com.SoundOfMind.mapper.MemberMapper;

@Controller
public class MemberController {

	@Autowired
	private MemberMapper mapper;

	@GetMapping("/kakao.do")
	public String kakao(String id,String Socail,Model model) {
		model.addAttribute("id", id);
		model.addAttribute("Kakao", Socail);
		
		return "index";
	}
	
	@RequestMapping("/index.do")
	public String index() {
		return "index";
	}

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
	public String login(Member member, HttpSession session, HttpServletRequest request) {
		Member user = mapper.login(member);
		if (user == null) {
			return "login";
		} else {
			session.setAttribute("user", user); // 세션생성
			String ip = request.getRemoteAddr();
			System.out.println(ip);
			session.setAttribute("ip", ip);

			return "index";
		}
	}

	@RequestMapping("/delete.do")
	public String delete(Member member, HttpSession session) {
		System.out.println(member.getId());

		mapper.delete(member);
		session.invalidate();
		return "index";
	}

	@RequestMapping("/logout.do")
	public String logout(HttpSession session) {
		session.invalidate();
		return "index";
	}

	@RequestMapping("/news.do")
	public String news() {
		return "news";
	}
	
	

}