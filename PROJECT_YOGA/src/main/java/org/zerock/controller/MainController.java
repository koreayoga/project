package org.zerock.controller;

import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/main/*")
@Log4j
public class MainController {
	
	@GetMapping("/home")
	public void open() {		
		log.info("welcome homepage................");
	}
		
	@GetMapping("/intro")
	public void intro() {
		log.info("intro................");
	}
}
