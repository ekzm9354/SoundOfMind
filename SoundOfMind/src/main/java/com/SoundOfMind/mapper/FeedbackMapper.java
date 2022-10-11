package com.SoundOfMind.mapper;

import org.apache.ibatis.annotations.Mapper;
import com.SoundOfMind.domain.Feedback;

@Mapper
public interface FeedbackMapper {
	public int Feedback(String email,String title, String text);
}
