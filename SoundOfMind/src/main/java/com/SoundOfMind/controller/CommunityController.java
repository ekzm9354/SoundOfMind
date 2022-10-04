package com.SoundOfMind.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.SoundOfMind.domain.Chatting;
import com.SoundOfMind.domain.Coment;
import com.SoundOfMind.domain.Member;
import com.SoundOfMind.domain.Storege;
import com.SoundOfMind.mapper.ChattingMapper;
import com.SoundOfMind.mapper.StoregeMapper;

@Controller
public class CommunityController {

	@Autowired
	private ChattingMapper Cmapper;

	@Autowired
	private StoregeMapper Smapper;

// 게시판 보여주기
	@GetMapping("/community.do")
	public String community(Model model) {
		List<Storege> comushow = Smapper.comushow();
		model.addAttribute("comushow", comushow);
		
		List<Storege> clickBest = Smapper.clickBest();
		model.addAttribute("clickBest", clickBest);
		return "community";
	}

//	대화목록 불러오기
	@GetMapping("/chatting.do")
	public String chatting(HttpSession session) {
		Member member = (Member) session.getAttribute("user");
		if (member != null) {
			String id = member.getId();

			List<Chatting> chatlist = Cmapper.chatlist(id);
			session.setAttribute("chatlist", chatlist);
		}
		return "chatting";
	}

// 게시판 내용(조회 시 조회 수 증가포함)
	@GetMapping("/board.do")
	public String board(int s_index, Model model, int click) {
		click += 1;
		Smapper.click(click, s_index);

		Storege storege = Smapper.board(s_index);
		model.addAttribute("storege", storege);

		int storege_id = s_index;
		List<Coment> boardComent = Smapper.boardComent(storege_id);
		model.addAttribute("boardComent", boardComent);
		return "boardcontent";
	}
}
