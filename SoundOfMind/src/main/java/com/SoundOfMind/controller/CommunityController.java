package com.SoundOfMind.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class CommunityController {

	@GetMapping("/community.do")
	public String community() {

		return "community";
	}
}
