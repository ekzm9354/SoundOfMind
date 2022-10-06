package com.SoundOfMind.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.SoundOfMind.domain.News;

@Mapper
public interface NewsMapper {

	public List<News> news1();
	public List<News> news2();
	public List<News> news3();
}
