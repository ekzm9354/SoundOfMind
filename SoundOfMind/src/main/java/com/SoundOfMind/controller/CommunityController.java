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
import com.SoundOfMind.domain.News;
import com.SoundOfMind.domain.Storege;
import com.SoundOfMind.mapper.ChattingMapper;
import com.SoundOfMind.mapper.NewsMapper;
import com.SoundOfMind.mapper.StoregeMapper;

@Controller
public class CommunityController {

	@Autowired
	private ChattingMapper Cmapper;

	@Autowired
	private StoregeMapper Smapper;

	@Autowired
	private NewsMapper nmapper;

// 게시판 보여주기
	@GetMapping("/community.do")
	public String community(Model model) {
		List<Storege> comushow = Smapper.comushow();
		int size = comushow.size();
		model.addAttribute("comushow", comushow);
		model.addAttribute("size", size);

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

//	글쓰기
	@GetMapping("/boardWrite.do")
	public String boardwrite() {
		return "boardwrite";
	}

//	뉴스
	@RequestMapping("/news.do")
	public String news(HttpSession session) {
//		긍정
		List<News> news1 = nmapper.news1();
		session.setAttribute("news1", news1);
//		부정
		List<News> news2 = nmapper.news2();
		session.setAttribute("news2", news2);
//		중립
		List<News> news3 = nmapper.news3();
		session.setAttribute("news3", news3);
		return "news";
	}

	@GetMapping("/map.do")
	public String Map() {
		return "map";
	}
}
