package com.SoundOfMind.application;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.config.annotation.CorsRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@MapperScan("com.SoundOfMind.mapper")
@ComponentScan("com.SoundOfMind.controller")
@SpringBootApplication
public class SoundOfMindApplication implements WebMvcConfigurer {
	@Override
	public void addCorsMappings(CorsRegistry registry) {
		registry.addMapping("/**").allowedOrigins("*");
	}
	
	public static void main(String[] args) {
		SpringApplication.run(SoundOfMindApplication.class, args);
	}

}
