package com.SoundOfMind.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class SttController {

	@RequestMapping("/index.do")
	public void stt(HttpServletRequest request, Model model) {
		try {
			String decodeResult = URLDecoder.decode(request.getParameter("text"), "UTF-8");
			System.out.println(decodeResult);
			model.addAttribute("STT", decodeResult);
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}

	}
}
