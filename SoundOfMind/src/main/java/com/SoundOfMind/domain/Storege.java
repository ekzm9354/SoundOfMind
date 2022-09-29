package com.SoundOfMind.domain;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Storege {

	private int s_index;
	private int rownum;
	private Date date;
	private String title;
	private String content;
	private String id;
	private int click;

}
