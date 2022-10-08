package com.SoundOfMind.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import java.util.Locale;

@Controller
public class SocketController {

	@GetMapping("/socket")
	public String socket(Locale locale, Model model) {
		return "test";
	}

}
