package com.SoundOfMind.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.SoundOfMind.domain.Emotion;
import com.SoundOfMind.domain.Member;

@Mapper
public interface MypageMapper {
	public List<Emotion> emotion(String id);
	
	public String profile_save(String id);
	
	public int profile_update(String profile, String id);
	
}
