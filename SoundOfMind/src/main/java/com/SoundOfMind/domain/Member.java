package com.SoundOfMind.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@Data
@NoArgsConstructor
public class Member {
	
	private String name;
	private String id;
	private String pw;
	private int grade;
}
