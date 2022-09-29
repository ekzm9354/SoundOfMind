package com.SoundOfMind.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.SoundOfMind.domain.Storege;

@Mapper
public interface StoregeMapper {
	public List<Storege> comushow();
}
