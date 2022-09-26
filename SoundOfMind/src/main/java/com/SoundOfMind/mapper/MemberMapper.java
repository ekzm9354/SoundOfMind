package com.SoundOfMind.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.SoundOfMind.domain.Member;

@Mapper
public interface MemberMapper {

	public int join(Member member);
	public Member login(Member member);
	public int delete(String id);
	
}
