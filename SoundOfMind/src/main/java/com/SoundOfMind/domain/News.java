package com.SoundOfMind.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class News {
	
	private int n_index;
	private int rownum;
	private String date;
	private String title;
	private String url;
	private String content;
	private String emotions;
	
}
