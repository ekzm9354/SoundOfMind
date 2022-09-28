package com.SoundOfMind.controller;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.SoundOfMind.mapper.StoregeMapper;

@Controller
public class StoregeController {

	@Autowired
	private StoregeMapper mapper;

}
