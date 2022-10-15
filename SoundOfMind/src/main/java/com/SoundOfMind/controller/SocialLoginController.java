package com.SoundOfMind.controller;

import org.springframework.stereotype.Controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.client.RestTemplate;

import com.SoundOfMind.domain.Kakao;
import com.SoundOfMind.mapper.MemberMapper;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

@Controller
public class SocialLoginController {

	@Autowired
	private MemberMapper mapper;

	@GetMapping("/KakoLogin")
	public String kakalogin(String code, HttpSession session) {
//		로그인시 받아오는 코드 확인
		System.out.println("KakoCode:" + code);
//		받아온 코드를 통해 RestAPI 요청 access_token 받기 요청
//		HttpBody 오브젝트 생성
		MultiValueMap<String, String> params = new LinkedMultiValueMap<>();
		params.add("grant_type", "authorization_code");
		params.add("client_id", "ff4fdda8a1d1c553542e5db65cc12b69");
		params.add("redirect_uri", "http://localhost:8085/KakoLogin");
		params.add("code", code);
//		HttpHeader 오브젝트 생성	
		HttpHeaders headers = new HttpHeaders();
		headers.add("Content-type", "application/x-www-form-urlencoded;charset=utf-8");
//		Header와 Body를 하나의 오브젝트에 담기
		HttpEntity<MultiValueMap<String, String>> kakaoTokenRequest = new HttpEntity<>(params, headers);
//		POST 방식으로 KEY-VALUE 형태로 데이터를 카카오에 요청하기
//		RestTemplate는 요청을 간단하게 해주는 함수
		RestTemplate rt = new RestTemplate();
// 		실제로 카카오 요청하기
		ResponseEntity<String> response = rt.exchange("https://kauth.kakao.com/oauth/token", HttpMethod.POST,
				kakaoTokenRequest, String.class);
//     JSON 형태로 받온다
//		Kakao.java에 담기
		ObjectMapper objectMapper = new ObjectMapper();
		Kakao oauthToken = null;
		try {
			oauthToken = objectMapper.readValue(response.getBody(), Kakao.class);
			System.out.println("AccessToken:" + oauthToken.getAccess_token());
			session.setAttribute("AccessToken", oauthToken.getAccess_token());
			session.setAttribute("Social", "kakao");
//			AucessToken 종료
//			사용자 정보 요청하기

		} catch (JsonProcessingException e) {
			e.printStackTrace();
		}
		return "socialCheck";
	}

//	카카오 사용자 정보 받아오기
	@GetMapping("/kakao.do")
	public String kakao(String id, String Social, HttpSession session) {
		session.setAttribute("id", id);
		session.setAttribute("Kakao", Social);
		String num = mapper.SocialJoinCheck(id);
		System.out.println(num);
		if (num == null) {
			mapper.SocialJoin(Social, id);
		}
		return "index";
	}

//	 네이버 로그인
	@GetMapping("/NaverLogin.do")
	public String naverLogin(String id, String Social, HttpSession session) {
		System.out.println("NaverEmail:" + id);
		System.out.println("Social:" + Social);
		session.setAttribute("Naveremail", id);
		session.setAttribute("Naver", Social);
		String num = mapper.SocialJoinCheck(id);
		System.out.println(num);
		if (num == null) {
			mapper.SocialJoin(Social, id);
		}
		return "index";
	}

//	네이버 로그인 체크
	@GetMapping("/NaverLogin")
	public String naverLogin(Model model) {
		model.addAttribute("Social", "naver");
		return "socialCheck";
	}

//	구글 로그인
	@GetMapping("/GoogleLogin.do")
	public String googleLogin(String id_token) {
		System.out.println(id_token);
		return "socialCheck";
	}
}
