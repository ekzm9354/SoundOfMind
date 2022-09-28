package com.SoundOfMind.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Coment {

	private int c_index;
	private String id;
	private int storege_id;
	private String coments;
}
