package com.SoundOfMind.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.SoundOfMind.domain.Chatting;

@Mapper
public interface ChattingMapper {
	public List<Chatting> chat(String from_id, String to_id);

	public List<Chatting> chatlist(String id);

	public int ChatSend(String to_id, String from_id, String chat);

	public List<Chatting> ResentChat(String from_id, String to_id);

	public int deleteChat(String to_id, String from_id);
	
	public int ToMessage(String to_id,String from_id,String chat);
}
