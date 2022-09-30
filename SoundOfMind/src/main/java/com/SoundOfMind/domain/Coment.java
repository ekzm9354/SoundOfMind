package com.SoundOfMind.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.NonNull;

@Data
@AllArgsConstructor
@NoArgsConstructor
@NonNull
public class Coment {

	private int c_index;
    private String id;
	private int storege_id;
    private String coments;
}
