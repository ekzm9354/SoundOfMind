package com.SoundOfMind.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.SoundOfMind.domain.Coment;
import com.SoundOfMind.domain.Storege;

@Mapper
public interface StoregeMapper {
	public List<Storege> comushow(int page);

	public Storege board(int s_index);

	public List<Coment> boardComent(int storege_id);

	public int click(int click, int s_index);

	public List<Storege> clickBest();

	public int boardWrite(String title, String content, String id);

	public List<Storege> search(String search);

	public List<Storege> comushowSize();
}
