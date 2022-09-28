package com.SoundOfMind.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.SoundOfMind.domain.Emotion;

@Mapper
public interface MypageMapper {
	public List<Emotion> emotion(String id);
}
