package com.SoundOfMind.mapper;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface ComentMapper {
	public int coment(String id, int storege_id, String coments);
}
