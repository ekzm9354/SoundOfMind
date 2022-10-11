package com.SoundOfMind.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.SoundOfMind.domain.Feedback;
import com.SoundOfMind.mapper.FeedbackMapper;

@Controller
public class FeedbackRestController {

	@Autowired
	private FeedbackMapper mapper;

	@PostMapping("/feedback.do")
	public @ResponseBody int feedback(String email, String title, String text) {
		int num = mapper.Feedback(email, title, text);
		return num;
	}

}
