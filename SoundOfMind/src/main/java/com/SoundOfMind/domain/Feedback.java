package com.SoundOfMind.domain;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Feedback {
	private int f_index;
	private Date date;
	private String email;
	private String title;
	private String text;
}
