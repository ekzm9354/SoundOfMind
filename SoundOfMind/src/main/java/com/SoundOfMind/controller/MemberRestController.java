package com.SoundOfMind.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.SoundOfMind.mapper.MemberMapper;
//ajax컨트롤러~!
@Controller
public class MemberRestController {
@Autowired 

private MemberMapper mapper;

//아이디 중복체크 
	@GetMapping("idCheck")
	public @ResponseBody int idCheck(String id) {
		int cnt= mapper.idCheck(id);
		return cnt;
	}
}
