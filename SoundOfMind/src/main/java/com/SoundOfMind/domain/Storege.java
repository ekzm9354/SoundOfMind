package com.SoundOfMind.domain;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Storege {
	private int rownum;
	private int s_index;
	private Date date;
	private String id;
	private String text;
	private String emotion;
}
