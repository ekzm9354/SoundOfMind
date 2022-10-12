package com.SoundOfMind.controller;

import java.io.File;
import java.io.IOError;
import java.io.IOException;
import java.net.http.HttpHeaders;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.python.jline.internal.Log;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.mongo.embedded.EmbeddedMongoProperties.Storage;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.SoundOfMind.domain.Emotion;
import com.SoundOfMind.domain.Member;
import com.SoundOfMind.domain.Storege;
import com.SoundOfMind.mapper.MypageMapper;

import ch.qos.logback.core.util.FileUtil;

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
			String profile_s = mapper.profile_save(id);
			session.setAttribute("profile_s",profile_s);
			List<Storege> storege = mapper.mycomushow(id);
			model.addAttribute("storege",storege);
		}
		return "mypage";
	}
	

	
}
