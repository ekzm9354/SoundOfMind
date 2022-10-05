package com.SoundOfMind.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.SoundOfMind.domain.Member;

@Mapper
public interface MemberMapper {

	//회원가입
	public int join(Member member);
	//로그인
	public Member login(Member member);
	//회원탈퇴
	public int delete(Member member);
	//아이디 중복체크
	public int idCheck(String id);
	//소셜 회원가입
	public int SocialJoin(String root,String id);
    //소셜 회원가입 중복체크
	public String SocialJoinCheck(String id);
}
