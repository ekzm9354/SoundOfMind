package com.SoundOfMind.domain;


import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Chatting {
	private int c_index;
	private String date;
	private String to_id;
	private String from_id;
	private String chat;

}
